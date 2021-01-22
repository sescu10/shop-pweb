<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\Recenzii;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class OrdersController extends Controller
{

    public function index (Request $request)
    {
        $orders = Order::orderBy('created_at','desc')
            ->where('user_id',auth()->user()->id)
            ->paginate($request->get("take") ? $request->get("take") : 10);

        return view('comenzi', [
            'comenzi'=> $orders
        ]);
    }

    public function salveaza (Request $request)
    {
        $order = new Order();
        $order->user_id = auth()->user()->id;
        $order->no_products = 0;
        $order->total_price = 0;
        $order->save();

        $list = $request->get('list');
        $no_products = 0;
        $total_price = 0;

        foreach ($list as $l){
            $op = new OrderProduct();
            $op->order_id = $order->id;
            $op->no_products = $l['count'];
            $op->total_price = $l['total'];
            $op->product_id = Product::where('name',$l['name'])->first()->id;
            $op->save();

            $no_products = $no_products + $l['count'];
            $total_price = $total_price + $l['total'];
        }

        $order->no_products = $no_products;
        $order->total_price = $total_price;
        $order->save();
    }
}
