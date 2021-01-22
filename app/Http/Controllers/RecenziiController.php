<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Recenzii;
use Illuminate\Http\Request;

class RecenziiController extends Controller
{
    public function index(Request $request)
    {

        $recenzii = Recenzii::orderBy('created_at')
                ->paginate($request->get("take") ? $request->get("take") : 5);

        return view('recenzii', [
            'recenzii'=> $recenzii
        ]);
    }

    public function salveaza(Request $request)
    {
        $recenzie = new Recenzii();
        $recenzie->comment = $request->get('recenzie');
        $recenzie->product_id = $request->get('produs_id');
        $recenzie->user_id = auth()->user()->id;
        $recenzie->note = 5;
        $recenzie->save();

        return redirect()->back();
    }
}
