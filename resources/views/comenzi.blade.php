@extends('master')

@push('scripts')
    <script type="application/javascript">
        $(function () {
            let formFilter = $("#form-filter");

            $(".form-control").change(function () {
                formFilter.find('.rpp').val($(".rpp-select option:selected").val());
                formFilter.submit();
            });
        });
    </script>
@endpush

@push("stylesheet")
    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
@endpush

@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="col-10 offset-1">
                <h1 class="m-5 product-title text-center">Istoric comenzi</h1>
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <div class="card text-center p-5">
                            <div class="profile-image pb-4">
                                <img src="{{ auth()->user()->profile_pic_path }}" class="rounded-circle" alt="">
                            </div>
                            <h2 class="mb-2 ">{{ auth()->user()->first_name . " " .auth()->user()->last_name }}</h2>
                            <p class="text-muted">{{ auth()->user()->email }}</p>
                        </div>
                    </div>

                    <div class="col-lg-8">
                        @foreach($comenzi as $comanda)
                            <div class="card mb-5">
                                <div class="card-header alert-info">
                                    <div class="float-left">
                                        <h6 class="text-muted mb-1"> Data comenzii</h6>
                                        <h4>{{ \Carbon\Carbon::parse($comanda->created_at)->toFormattedDateString()}}</h4>
                                    </div>
                                    <div class="float-right text-right">
                                        <h6 class="text-muted mb-1"> Total produse</h6>
                                        <h4>{{$comanda->no_products}}</h4>
                                    </div>
                                </div>

                                <div class="card-body p-0">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col">Nume</th>
                                                <th scope="col">Cantitate</th>
                                                <th scope="col" class="text-right">Pret total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($comanda->produse as $com_produs)
                                                <tr>
                                                    <td>{{$com_produs->product->name}}</td>
                                                    <td>{{$com_produs->no_products}}</td>
                                                    <td class="text-right">{{$com_produs->total_price . ' $'}}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                <div class="card-footer">
                                    <div class="float-right">
                                        <h6 class="text-muted font-weight-bold">Total price </h6>
                                        <h2>{{$comanda->total_price . ' $'}}</h2>
                                    </div>

                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
