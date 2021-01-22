@extends('master')

@push("stylesheet")
    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
@endpush

@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="col-10 offset-1">
                <h1 class="m-5 product-title text-center">Livrare</h1>

                <div class="col-12 bg-white mt-5 p-5">

                    <h4>Ai dreptul de a verifica daca ai primit exact ce ai comandat!</h4>
                    <p class="pt-2">La shop platesti dupa ce deschizi coletul si te asiguri ca ai primit produsul comandat, in stare perfecta. Serviciul <strong>„Deschiderea coletului la livrare”</strong> este disponibil pentru produsele vandute si expediate de shop si este valabil atat pentru persoanele fizice, cat si pentru persoanele juridice.</p>
                    <h4>Cum functioneaza serviciul?</h4>
                    <p class="pt-2">In momentul primirii comenzii poti solicita curierului deschiderea coletului pentru a verifica starea produsului/produselor.</p>
                    <p class="pt-2">Acest serviciu iti ofera doar posibilitatea de a verifica daca produsul se prezinta in stare perfecta, nu si posibilitatea de a verifica tehnic (testa/proba) produsul.</p>
                    <p class="pt-2">Daca in urma deschiderii coletului constati ca produsul comandat nu este în stare perfecta de livrare şi prezinta semne de lovire, zgarieturi sau alte probleme de tip estetic, iti recomandam sa refuzi comanda. Pentru a refuza comanda trebuie sa completezi un Proces verbal de constatare, in prezenta curierului, in momentul livrarii. Procesul verbal nu mai poate fi completat dupa plecarea curierului.</p>
                    <p class="pt-2">Daca ai achitat comanda online si in urma deschiderii coletului ai decis returnarea produsului, suma achitata online va fi restituita in contul din care ai efectuat plata, in cel mai scurt timp.</p>
                    <p class="pt-2">In cazul comenzilor ce contin mai multe produse, daca in urma deschiderii coletului/coletelor la livrare constati ca unul dintre produse nu se afla in stare perfecta si decizi refuzarea acestuia, procedura implica returul intregii comenzi, implicit a tuturor produselor livrate.</p>
                    <h4>Cine achita transportul?</h4>
                    <p class="pt-2">In cazul refuzului coletului prin intermediul serviciului <strong>“Deschiderea coletului la livrare”</strong>, taxele de transport nu trebuie achitate de catre cumparator.</p>
                </div>

            </div>
        </div>
    </div>
@endsection
