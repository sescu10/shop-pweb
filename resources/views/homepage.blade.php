@extends('master')

@section('content')
    <!-- Section Hero -->
    <div class="section-hero">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="col-lg-7 col-sm-12 explore-courses">
                    <h1>Cumpara la noi <br>ai livrare gratuita</h1>
                    <h4>Comanda minima necesara este <br class="d-none d-lg-inline">in valoare de 150 RON</h4>
                </div>
                <div class="col-lg-5 col-sm-12">
                    <div class="grid-container pl-lg-5">
                        <div>
                            <h3>300+
                                <br>
                                <span>Produse</span>
                            </h3>
                        </div>
                        <div>
                            <h3>121+
                                <br>
                                <span>Recenzii</span>
                            </h3>
                        </div>
                        <div>
                            <h3>140+
                                <br>
                                <span>Parteneri</span>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Section Hero -->

    <main>
        <!-- Feature Selection Courses -->
        <section class="feature-selection-courses">
            <div class="container">
                <h1>Cauta dupa categorii?</h1>
                <div class="cards">
                    <div class="card">
                        <div class="card-header bg-light-blue">
                            <a href="#" class="course-category text-center"><h2 class="font-weight-bold text-white">Descarcabile</h2></a>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <p>Cauti produse care le poti folosi imediat? Nu cauta mai departe, orice produs achizitionat in aceasta lista poate fi descarcat dupa achizitia de pe site-ul nostru.</p>
                            <a href="/lista_produse?category=downloadable" class="mt-auto btn btn-block play-btn">
                                <i class="far fa-play-circle mr-2"></i>Vezi lista
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header bg-purple">
                            <a href="#" class="course-category text-center"><h2 class="font-weight-bold text-white">Ridicare la sediu</h2></a>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <p>Aceste produse pot fi ridicate doar de la sediu firmei noastre. Necesita un act de identitate si utilizatoruls aiba o varsta peste 18 ani pentru a le putea ridica.</p>
                            <a href="/lista_produse?category=collectible" class="mt-auto btn btn-block play-btn">
                                <i class="far fa-play-circle mr-2"></i>Vezi lista
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header bg-lite-blue">
                            <a href="#" class="course-category text-center"><h2 class="font-weight-bold text-white">Livrare prin curier</h2></a>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <p>Orice produs din aceasta categorie poate fi livrat prin curie. Acestea beneficiaza si de livrare gratuita daca comanda depaseste totalul de 150 RON</p>
                            <a href="/lista_produse?category=shipment" class="mt-auto btn btn-block play-btn">
                                <i class="far fa-play-circle mr-2"></i>Vezi lista
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="expert-speakers">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-sm-12 col-lg-8">
                        <h1>List produselor noastre</h1>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 mx-auto">
                        <div class="cards">
                            @foreach($produse as $produs)
                                <a href="/produs/{{$produs->id}}">
                                    <div class="card p-4 mb-5">
                                        <div class="product-image">
                                            @if($produs->image())
                                                <img src="{{$produs->image()->path}}" alt="">
                                            @else
                                                <img src="/img/missing_picture.jpg" alt="">
                                            @endif
                                        </div>
                                        <div class="card-body mt-4 p-0 bg-transparent text-center">
                                            <h2 class="card-name" >{{$produs->name}}</h2>
                                            <p class="lite-blue-text"> {{$produs->price}} RON</p>
                                            <div class="product-description mb-3">
                                                <p >{!! $produs->description  !!}</p>
                                            </div>
                                        </div>
                                        <div class="card-footer border-0 p-0 bg-transparent">
                                            <button class="primary-btn btn-block btn-add-to-basket buy-button w-100 add-to-cart" rel="nofollow" data-price="{{$produs->price}}" data-name="{{$produs->name}}">
                                                <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-bag-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M5.5 3.5a2.5 2.5 0 0 1 5 0V4h-5v-.5zm6 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5V8z"/>
                                                </svg>
                                                Adauga in cos
                                            </button>
                                        </div>
                                    </div>
                                </a>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="topics-btn text-center">
                    <a class="list-btn px-5 py-3" href="/lista_produse" rel="nofollow"><span>Lista produse</span></a>
                </div>
            </div>
        </section>

        <section class="pricing-header bg-lite-blue">
            <div class="container text-center">
                <h1>Ultimele recenzii</h1>
                <h5 class="text-white">Recenziile utilizatorilor nostri sunt foarte importante si noi dorim sa fim deschisi. <br>Puteti vizualiza aici ultimele recenzii ale produselor noastre.</h5>
            </div>
        </section>

        <section class="topics sectiunea-recenzii">
            <div class="container">
                <div class="cards">
                    @foreach($recenzii as $recenzie)
                        <div class="card shadow-sm">
                            <div class="card-title p-3 d-flex align-items-center justify-content-center h-100">
                                <div class="text-center d-content">
                                    <img src="{{$recenzie->user->profile_pic_path}}" alt="user-image" class="rounded-circle user-image-recenzii">
                                </div>
                                <div class="d-content">
                                    <h5 class="d-block font-weight-normal flex-grow-1 ml-3">{{$recenzie->user->first_name . ' ' . $recenzie->user->last_name}}</h5>

                                </div>
                            </div>
                            <div class="topic-details mx-4 my-4">
                                <blockquote class="blockquote mb-0">
                                    <div class="review-comment mb-3">{{$recenzie->comment}}</div>
                                    <footer class="blockquote-footer"><a class="" href="/produs/{{$recenzie->product_id}}"> <cite title="Source Title">{{$recenzie->product->name}}</cite></a></footer>
                                </blockquote>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="topics-btn"><a class="list-btn px-5 py-3" href="/recenzii" rel="nofollow"><span>Lista recenziilor</span></a></div>
            </div>
        </section>
    </main>
@endsection
