<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        foreach (config('permissions') as $role => $permissions) {
            $exists = Role::where('name', $role)->first();

            if (!$exists) {
                Role::create([
                    'name' => $role,
                ]);
            }

            foreach ($permissions as $permission) {
                $exists = Permission::where('name', $permission['code'])->first();

                if (!$exists) {
                    Permission::create([
                        'name' => $permission['code'],
                    ]);
                }
            }
        }
    }
}
