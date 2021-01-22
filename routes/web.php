<?php

use App\Http\Controllers\Backend\Auth\LoginController;
use App\Http\Controllers\GlideController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecenziiController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrdersController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [App\Http\Controllers\HomeController::class, 'index']);
Route::get('/product', function () { return view('product'); });
Route::get('/livrare', function () { return view('livrare'); });
Route::get('/despre', function () { return view('despre'); });
Route::get('/recenzii', [RecenziiController::class, 'index']);
Route::post('/recenzie', [RecenziiController::class, 'salveaza']);
Route::get('/produs/{produs}', [ProductController::class, 'produs']);
Route::get('/lista_produse', [ProductController::class, 'index']);
Route::get('/istoric-comenzi', [OrdersController::class, 'index']);
Route::post('/comenzi', [OrdersController::class, 'salveaza']);

Route::get('/product', function () {
    return view('product');
});


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::domain(env('APP_DOMAIN'))->group(function () {
    Route::get('img/{path}', [GlideController::class, 'index'])
        ->where('path', '.+');

});
