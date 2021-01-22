@extends('master')

@push("stylesheet")
    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
@endpush

@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="col-10 offset-1">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-5">
                            <div class="product-image">
                                <img src="/img/profile_image.png" alt="">
                            </div>
                        </div>
                        <div class="col-7 mt-4">
                            <h1 class="mb-2 product-title">Sescu Andrei</h1>

                            <p class="lite-blue-text product-price"> Software developer</p>

                            <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                        </div>
                    </div>

                </div>

                <div class="col-12 bg-white mt-5 p-5">
                    <h3>
                        Istoric
                    </h3>
                    <p class="pt-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et sagittis tortor, quis pretium ex. Etiam eu libero in turpis vestibulum luctus sed at odio. Donec eros lectus, facilisis sed dignissim eget, venenatis quis nibh. Morbi ac ipsum orci. Fusce scelerisque lectus et lectus auctor, et tristique dolor tristique. Donec at eros quis tellus efficitur blandit. Donec consectetur, sem vel mattis consequat, urna libero euismod ex, vel venenatis lorem mi venenatis metus.</p>
                    <p class="pt-2">In ultrices, urna in pulvinar lobortis, lorem magna vehicula est, ac venenatis mauris tortor ut elit. In dapibus leo quis dui blandit, congue ullamcorper nibh rutrum. Curabitur feugiat augue id massa efficitur egestas. Duis maximus tortor et velit mollis, quis vulputate purus feugiat. Cras sed magna consequat, suscipit nisi et, scelerisque mauris. Morbi et risus blandit, suscipit mi in, bibendum urna. Suspendisse et accumsan diam. Sed condimentum massa vel odio aliquam, congue mollis odio pulvinar. Fusce vestibulum ligula eget neque tincidunt, quis ullamcorper diam volutpat. Mauris ligula tellus, volutpat vitae lorem ac, bibendum iaculis dolor. Nullam ullamcorper odio sit amet tincidunt consectetur. Cras vehicula condimentum tellus at mollis. Praesent placerat, tellus quis porttitor egestas, odio arcu interdum dolor, at bibendum ipsum sem eu mauris. Etiam at tempus lorem.</p>
                    <p class="pt-2">Pellentesque et lobortis metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ultrices luctus erat in fermentum. Morbi quis est dictum massa porttitor imperdiet et id tellus. Nulla mattis diam vitae felis porta iaculis. Ut luctus a erat vitae sagittis. Mauris id eros rutrum enim consequat euismod. Suspendisse ac ultricies mi.</p>
                    <p class="pt-2">Nulla facilisi. Maecenas imperdiet ut lectus ac blandit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque sed ipsum ante. Vestibulum ac arcu sed nibh viverra fringilla eget nec massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis cursus molestie dolor, sed aliquam urna lobortis sed. Curabitur blandit lacinia venenatis. Phasellus at massa ligula. Mauris elit velit, rhoncus sed lacinia ut, placerat id nisi.</p>
                    <p class="pt-2">In laoreet lacinia pretium. Vestibulum feugiat semper ligula eget vestibulum. Donec euismod, quam vel faucibus finibus, odio eros auctor odio, ut egestas dui risus sit amet eros. Vestibulum sit amet ligula ac purus interdum viverra. Suspendisse risus dui, viverra ac ornare eget, tempus id tortor. Maecenas ut vestibulum lorem. Quisque id velit vel est accumsan sagittis vel at felis. Vivamus ut augue a elit hendrerit ultrices. Curabitur at turpis ex. Ut eu nisl et ipsum consectetur sagittis ac at diam. Nulla pharetra urna vel neque vestibulum tempus. Praesent vel ultrices arcu.</p>
                </div>

            </div>
        </div>
    </div>
@endsection
