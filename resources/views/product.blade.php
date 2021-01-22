@extends('master')

@push("stylesheet")
    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
@endpush

@section('content')
    <div class="container-xl my-5">
        <div class="row">
            <div class="col-10 offset-1">
                @if(isset($message))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Multumim pentru review-ul tau!</strong> Parerea ta e binevenita si o asteptam si la alte produse!
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif
                <div class="row bg-white m-1">
                    <div class="col-xl-5">

                        @if(count($produs->images) == 0)
                            <div class="product-image">
                                <img src="/img/missing_picture.jpg" alt="">
                            </div>
                        @else
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    @foreach($produs->images as $key => $image)
                                        <li data-target="#carouselExampleIndicators" data-slide-to="{{$key}}" @if($key == 0) class="active" @endif ></li>
                                    @endforeach
                                </ol>
                                <div class="carousel-inner">
                                    @foreach($produs->images as $key => $image)
                                        <div class="carousel-item @if($key == 0) active @endif">
                                            <img class="d-block w-100" src="{{$image->path}}" alt="{{$image->name}}">
                                        </div>
                                    @endforeach
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        @endif

                    </div>
                    <div class="col-ml-7 ml-3 mt-4">
                        <h1 class="mb-2 product-title">{{$produs->name}}</h1>

                        <div class="badge badge-info p-2">
                            <h6 class="text-white">{{ucfirst($produs->type)}}</h6>
                        </div>

                        <p class="lite-blue-text pt-4 product-price"> {{$produs->price}} RON</p>

                        <button class="primary-btn btn-block btn-add-to-basket buy-button w-100 add-to-cart mb-3" rel="nofollow" data-price="{{$produs->price}}" data-name="{{$produs->name}}">
                            <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-bag-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M5.5 3.5a2.5 2.5 0 0 1 5 0V4h-5v-.5zm6 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5V8z"/>
                            </svg>
                            Adauga in cos
                        </button>
                    </div>
                </div>

                <div class="col-12 bg-white mt-5 p-5">
                    <h3>
                        Descriere produs
                    </h3>
                    <p class="pt-2 action-btn">{!! $produs->description !!}</p>
                    @if(count($produs->recenzii) != 0)
                        <button class="btn btn-primary mr-2 mt-2 btn-recenzii" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                            Vezi recenziile
                        </button>
                    @endif
                    @if(auth()->user())
                        <button class="btn btn-primary mt-2" type="button" data-toggle="collapse" data-target="#expandRecenzie" aria-expanded="false" aria-controls="expandRecenzie">
                            Lasa un review
                        </button>
                    @endif
                </div>

                <div class="collapse p-5 bg-white border-top" id="expandRecenzie">
                    <div>
                        <h4 class="pb-2">@if(auth()->user())Salut {{auth()->user()->first_name . ' ' . auth()->user()->last_name}}@else Buna! te rugam sa fii responsabil @endif,</h4>
                        <p class="alert alert-info">
                            <svg width="1.3em" height="1.3em" viewBox="0 0 16 16" class="bi bi-info-circle-fill pr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM8 5.5a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                            </svg>
                            Te rugam sa fii respectuos si sa lasi un review cum se cuvine dupa folosirea acestui produs si sa ne spui parerea ta.</p>
                    </div>
                    <form id="" action="/recenzie" method="POST">
                        @csrf
                        <input name="produs_id" value="{{$produs->id}}" style="visibility: hidden;">
                        <textarea name="recenzie" id="" class="w-100 bg-light border-0 p-3" cols="30" rows="10"></textarea>
                        <button class="btn btn-primary mt-2" type="submit" data-toggle="collapse" data-target="#expandRecenzie" aria-expanded="false" aria-controls="expandRecenzie">Trimite</button>
                    </form>
                </div>

                <div class="collapse" id="collapseExample">
                    <h2 class="pt-5 pb-2">Recenzii</h2>
                    @foreach($produs->recenzii as $recenzie)
                        <div class="card card-body">
                            <blockquote class="blockquote">
                                <div class="recenzie-user pb-2">
                                    <img src="{{$recenzie->user->profile_pic_path}}" alt="user-image" class="rounded-circle user-image-recenzii">
                                    <cite title="Source Title">{{$recenzie->user->first_name . ' ' .$recenzie->user->last_name}}</cite>
                                    <div class="float-right">{{ \Carbon\Carbon::parse($recenzie->created_at)->toFormattedDateString()}}</div>
                                </div>
                                <p class="m-0 pb-3">{{ $recenzie->comment }}</p>
                            </blockquote>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
