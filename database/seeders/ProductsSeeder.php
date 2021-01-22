<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Recenzii;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $types = ['collectible','shipment','downloadable'];
        $description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.

Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.';

        $review = ['Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.',
'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.',
'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.',
'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.',
'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.'];

        $items = [
            [
                'name' => 'Item1',
                'price' => 20,
            ],
            [
                'name' => 'Item2',
                'price' => 40,
            ],
            [
                'name' => 'Item3',
                'price' => 42,
            ],
            [
                'name' => 'Item4',
                'price' => 68,
            ],
            [
                'name' => 'Item5',
                'price' => 45,
            ],
            [
                'name' => 'Item6',
                'price' => 12,
            ],
            [
                'name' => 'Item7',
                'price' => 48,
            ],
            [
                'name' => 'Item8',
                'price' => 25,
            ],
            [
                'name' => 'Item9',
                'price' => 10,
            ],
            [
                'name' => 'Item10',
                'price' => 120,
            ]
        ];

        foreach ($items as $item)
        {
            $produs = new Product();
            $produs->name = $item['name'];
            $produs->price = $item['price'];
            $produs->type = $types[rand(0,2)];
            $produs->description = $description;
            $produs->save();

            $img1 = new ProductImage();
            $img1->product_id = $produs->id;
            $img1->path = '/img/'.rand(1,7).'.png';
            $img1->save();

            $img2 = new ProductImage();
            $img2->product_id = $produs->id;
            $img2->path = '/img/'.rand(1,7).'.png';
            $img2->save();

            $img3 = new ProductImage();
            $img3->product_id = $produs->id;
            $img3->path = '/img/'.rand(1,7).'.png';
            $img3->save();

            $recenzie = new Recenzii();
            $recenzie->product_id = $produs->id;
            $recenzie->user_id = User::find(rand(1,5))->id;
            $recenzie->comment = $review[rand(0,4)];
            $recenzie->note = 5;
            $recenzie->save();

            for ($i = 0; $i <= rand(4,5); $i++) {
                $recenzie = new Recenzii();
                $recenzie->product_id = $produs->id;
                $recenzie->user_id = User::find(rand(1,5))->id;
                $recenzie->comment = $review[rand(0,4)];
                $recenzie->note = 5;
                $recenzie->save();
            }
        }


    }
}
