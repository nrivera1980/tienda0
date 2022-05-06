@auth
    @livewire('show-superior')
    <x-app-layout>
        <div class="mx-auto">
            <section class="bg-cover bg-center" style="background-image: url({{asset('img/tiendas.jpeg')}})">
                <div class="flex justify-around items-center container mx-auto">
                    <div class="w-full flex justify-start items-center h-60">
                        <div class="text-white text-lg lg:text-4xl font-bold"> Nuestras tiendas</div>
                    </div>
                </div>
            </section>
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
            @livewire('show-superior')
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
                
                <div class="mx-auto">
                    <section class="bg-cover bg-center" style="background-image: url({{asset('img/tiendas.jpeg')}})">
                        <div class="flex justify-around items-center container mx-auto">
                            <div class="w-full flex justify-start items-center h-60">
                                <div class="text-white text-lg lg:text-4xl font-bold"> Nuestras tiendas</div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="container mx-auto">
                    <div class="grid grid-cols-1 lg:grid-cols-2">
                        <div></div>
                        <div></div>
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