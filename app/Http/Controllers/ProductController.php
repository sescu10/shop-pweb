<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $category = $request->get('category');

        $query = Product::orderBy('created_at');

        if($category)
            $query->where('type',$category);


        $produse = $query->paginate($request->get("take") ? $request->get("take") : 10);

        return view('lista_produse', [
            'produse'=> $produse
        ]);
    }

    public function produs(Product $produs)
    {
        return view('product', [
            'produs'=> $produs
        ]);
    }
}
