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
                <h1 class="m-5 product-title text-center">Recenzii</h1>
                <div class="row">

                    @foreach($recenzii as $recenzie)
                        <div class="card card-body">
                            <blockquote class="blockquote">
                                <div class="px-3">
                                    <div class="row recenzie-user pb-3">
                                        <div class="col-6">
                                            <img src="{{$recenzie->user->profile_pic_path}}" alt="user-image" class="rounded-circle float-left mt-2">
                                            <div class="float-left ml-3 mt-2">
                                                <h4 class="mb-0">{{$recenzie->user->first_name . ' ' . $recenzie->user->last_name}}</h4>
                                                <a href="/produs/{{$recenzie->product_id}}">{{$recenzie->product->name}}</a>
                                            </div>
                                        </div>
                                        <div class="col-6 text-right pt-3">
                                            {{ \Carbon\Carbon::parse($recenzie->created_at)->toFormattedDateString()}}
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-light">
                                    <p class="m-0 p-4">{{$recenzie->comment}}</p>
                                </div>
                            </blockquote>
                        </div>
                    @endforeach

                    {{ $recenzii->links() }}

                </div>
            </div>
        </div>
    </div>
@endsection
