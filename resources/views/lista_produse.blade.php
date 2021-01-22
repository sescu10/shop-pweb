@extends('master')

@push("stylesheet")
    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
@endpush

@section('content')
    <div class="container-xl  my-5">
        <div class="row">
            <div class="col-10 col-sm-12 offset-1 offset-sm-0">
                <h1 class="m-5 product-title text-center"> @if(request('category')) {{ucfirst(request('category'))}} @else Produse @endif</h1>

                @foreach($produse as $produs)
                    <a href="/produs/{{$produs->id}}" class="text-decoration-none">
                        <div class="card card-body card rounded-lg mb-3">
                            <div class="row">
                                <div class="col-xl-3 col-md-12">
                                    @if(count($produs->images) == 0)
                                        <div class="product-image">
                                            <img src="/img/missing_picture.jpg" alt="">
                                        </div>
                                    @else
                                        <div class="product-image">
                                            <img src="{{$produs->images->first()->path}}" alt="">
                                        </div>
                                    @endif

                                </div>
                                <div class="col-xl-9 col-md-12 mt-md-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <h2 class="mb-2">{{$produs->name}}</h2>
                                            @if($produs->type == 'downloadable')
                                                <div class="badge badge-info p-1 mb-2 mt-2">
                                                    <h6 class="text-white">{{ucfirst($produs->type)}}</h6>
                                                </div>
                                            @elseif($produs->type == 'collectible')
                                                <div class="badge bg-purple p-1 mb-2 mt-2">
                                                    <h6 class="text-white">{{ucfirst($produs->type)}}</h6>
                                                </div>
                                            @else
                                            <div class="badge bg-green p-1 mb-2 mt-2">
                                                <h6 class="text-white">{{ucfirst($produs->type)}}</h6>
                                            </div>
                                            @endif

                                        </div>
                                        <div class="col-6 text-right">
                                            <p class="lite-blue-text product-price mb-0 "> {{$produs->price}} RON</p>
                                            <button class="primary-btn btn-add-to-basket buy-button add-to-cart" rel="nofollow" data-price="{{$produs->price}}" data-name="{{$produs->name}}">
                                                <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-bag-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M5.5 3.5a2.5 2.5 0 0 1 5 0V4h-5v-.5zm6 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5V8z"/>
                                                </svg>
                                                Adauga in cos
                                            </button>
                                        </div>
                                    </div>
                                    <section class="mt-3 product-description">
                                        {!! $produs->description !!}
                                    </section>
                                </div>
                            </div>
                        </div>
                    </a>
                @endforeach

                {{ $produse->links() }}

            </div>
        </div>
    </div>
@endsection
