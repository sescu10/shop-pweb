<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{csrf_token()}}">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <title>@section('title') - {{ env('APP_NAME') }}@show</title>

    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">

    @stack('stylesheets')
</head>

<body>

@include('layouts.header')

@yield('content')

@include('layouts.footer')

<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert-success thank-message d-none mb-3 text-center" style="border-radius: 10px;"><h3 style="padding: 15px 20px;">Comanda a fost preluata cu success, iti multumim! </h3></div>
                <table class="show-cart table">

                </table>
                <div>Total price: $<span class="total-cart"></span></div>
            </div>
            <div class="modal-footer">
                @if(auth()->user())
                    <button type="button" class="btn btn-primary order-now">Order now</button>
                @else

                    <a class="btn btn-primary" href="/login">
                        <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                        </svg>
                        Logheazate pentru a comanda
                    </a>
                @endif
                <button class="clear-cart btn btn-danger">Clear Cart</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="{{mix('/js/app.js')}}"></script>
<script src="{{mix('js/store.js') }}" defer></script>
@stack('scripts')

</body>
</html>
