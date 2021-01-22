<header>
    <nav class="navbar navbar-expand-lg navbar-main mt-0 {{ ($header_style ?? 'light') == 'dark' ? 'navbar-dark' : 'navbar-light' }}">
        <div class="container">
            <a class="navbar-brand" href="/">
                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-bag-fill mr-2" fill="#4EADC9" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
                </svg>
                <span class="color-lite-blue">{{ env('APP_NAME') }}</span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto d-flex align-items-center">
                    <li class="nav-item mx-0 mx-lg-1 text-center"><a class="nav-link py-3 px-2" href="/lista_produse">Produse</a></li>
                    <li class="nav-item mx-0 mx-lg-1 text-center"><a class="nav-link py-3 px-2" href="/despre">Despre noi</a></li>
                    <li class="nav-item mx-0 mx-lg-1 text-center"><a class="nav-link py-3 px-2" href="/livrare">Livrare</a></li>
                    <li class="nav-item mx-0 mx-lg-1 text-center"><a class="nav-link py-3 px-2" href="/recenzii">Recenzii</a></li>

                    @if (auth()->check())
                        <li class="nav-item mx-0 mx-lg-1">
                            <div class="dropdown">
                                <button class="nav-link nav-link-outline dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{ auth()->user()->first_name . " " .auth()->user()->last_name }}
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="/istoric-comenzi">Istoric comenzi</a>
                                    <a class="dropdown-item" href="/logout" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>

                                    <form id="logout-form" action="/logout" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </div>
                        </li>
                    @else
                        <li class="nav-item mx-0 mx-lg-1 text-uppercase">
                            <a class="nav-link nav-link-outline" href="/login">
                                <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                </svg>
                                Contul meu
                            </a>
                        </li>
                    @endif
                    <li class="nav-item mx-0 mx-lg-1 text-uppercase">
                        <button type="button" class="login-btn" style="background-color: #343a40;border-color: #343a40;" data-toggle="modal" data-target="#cart"><svg width="1.3em" height="1.3em" viewBox="0 0 16 16" class="bi bi-cart-check-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm.354-7.646a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                            </svg> Cosul meu (<span class="total-count"></span>)
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

