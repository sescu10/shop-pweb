<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Recenzii;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $recenzii = Recenzii::orderBy('created_at')->take(4)->get();
        $produse = Product::orderBy('created_at')->take(4)->get();

        return view('homepage',[
            'recenzii' => $recenzii,
            'produse' => $produse
        ]);
    }
}
