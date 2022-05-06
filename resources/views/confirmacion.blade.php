@auth
<x-app-layout>
    <div>
        <div class="mx-auto">
            <div>
                <section class="text-black font-sans bg-white">
                    <div class="container px-5 py-10 mx-auto text-sm lg:text-base">
                        <div class="text-justify">
                            <h2 class="text-red-600 text-lg font-bold mb-5 uppercase">registro de su queja o reclamo realizado con exito.</h2>
                            <p class="w-full mb-5 font-bold">Sr(a). {{$libro->cliente}}</p>
                            <p class="w-full mb-5">Se le informa que su queja o reclamo ha sido registro y adicional a esto se ha enviado un correo de confirmación a la siguiente direcion de email proporcionado por Ud. {{$libro->email}}</p>
                            <p class="w-full font-bold">Por tanto, se le estara respondiendo en los 30 dias calendario sobre la solución a su reclamo o queja.</p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</x-app-layout>
@endauth
@guest
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'La Tienda') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Styles -->
        <link rel="stylesheet" href="{{ mix('css/app.css') }}">

        <link rel="stylesheet" href="{{asset('vendor/fontawesome/css/all.min.css')}}">
        <link rel="stylesheet" href="{{asset('vendor/iconmonstr/css/iconmonstr-iconic-font.min.css')}}">

        @livewireStyles

        <!-- Scripts -->
        <script src="{{ mix('js/app.js') }}" defer></script>
    </head>
    <body class="font-sans antialiased">
        <x-jet-banner />

        <div class="min-h-screen bg-gray-100">
            @livewire('menu-pagina')

            <!-- Page Heading -->
            @if (isset($header))
                <header class="bg-white shadow">
                    <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                        {{ $header }}
                    </div>
                </header>
            @endif

            <!-- Page Content -->
            <main>
                <div>
                    <div class="mx-auto">
                        <div>
                            <section class="text-black font-sans bg-white">
                                <div class="container px-5 py-10 mx-auto text-sm lg:text-base">
                                    <div class="text-justify">
                                        <h2 class="text-red-600 text-lg font-bold mb-5 uppercase">registro de su queja o reclamo realizado con exito.</h2>
                                        <p class="w-full mb-5 font-bold">Sr(a). {{$libro->cliente}}</p>
                                        <p class="w-full mb-5">Se le informa que su queja o reclamo ha sido registro y adicional a esto se ha enviado un correo de confirmación a la siguiente direcion de email proporcionado por Ud. {{$libro->email}}</p>
                                        <p class="w-full font-bold">Por tanto, se le estara respondiendo en los 30 dias calendario sobre la solución a su reclamo o queja.</p>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                    
            </main>

            @livewire('pie-pagina')

        </div>

        @stack('modals')

        @livewireScripts
    </body>
</html>
@endguest
