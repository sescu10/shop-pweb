<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admins = [
            [
                'first_name' => 'Sescu',
                'last_name' => 'Andrei',
                'email' => 'sescu.andrei@yahoo.com',
                'password' => '123456',
                'profile_pic_path' => '/img/profile_image.png',
            ],
            [
                'first_name' => 'Bogdan',
                'last_name' => 'George',
                'email' => 'george.bogdan@yahoo.com',
                'password' => '123456',
                'profile_pic_path' => '/img/bogdan.png',
            ],
            [
                'first_name' => 'Robu',
                'last_name' => 'Emanuel',
                'email' => 'robu.ana@yahoo.com',
                'password' => '123456',
                'profile_pic_path' => '/img/emanuel.png',
            ],
            [
                'first_name' => 'Antoci',
                'last_name' => 'Maria',
                'email' => 'antoci.maria@yahoo.com',
                'password' => '123456',
                'profile_pic_path' => '/img/ioana.png',
            ],
            [
                'first_name' => 'Vladescu',
                'last_name' => 'Ionut',
                'email' => 'vladescu.ionut@yahoo.com',
                'password' => '123456',
                'profile_pic_path' => '/img/marian.png',
            ]
        ];

        foreach ($admins as $admin)
        {
            $user = User::where('email', $admin['email'])->first();

            if (!$user)
            {
                $user = new User();
            }

            $permissions = collect(config('permissions.admin'))->pluck('code');

            $user->first_name = $admin['first_name'];
            $user->last_name = $admin['last_name'];
            $user->email = $admin['email'];
            $user->profile_pic_path = $admin['profile_pic_path'];

            if (app()->environment('production')) {
                $user->password = Hash::make(Str::random(15));
            } else {
                $user->password = Hash::make($admin['password']);
                $user->markEmailAsVerified();
            }

            $user->syncRoles('admin');
            $user->syncPermissions($permissions);
            $user->save();

            if (app()->environment('production')) {
                $user->sendEmailVerificationNotification();
            }
        }
    }
}
