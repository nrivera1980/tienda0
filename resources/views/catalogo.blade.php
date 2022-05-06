@auth
    @livewire('show-superior')
    <x-app-layout>
        @php
            $img = '';
        @endphp
        @foreach ($categorias as $cat)
            @if ($cat->id == $id)
                @php
                    $img = $cat->imagen
                @endphp
            @endif
        @endforeach
        @if (strlen($img) > 0)
        <div class="mx-auto">
            <section class="bg-cover bg-left lg:bg-center" style="background-image: url({{Storage::url($img)}})">
                <div class="flex justify-around items-center container mx-auto">
                    <div class="w-full flex justify-start items-center h-20 lg:h-60">
                        
                    </div>
                </div>
            </section>
        </div>
        @endif
        <div class="flex flex-wrap max-w-7xl mx-auto">
            <div class="lg:w-3/12 md:w-1/2 w-full p-5">
                @livewire('show-filtro', ['cat' => $id])
            </div>
            <div class="lg:w-9/12 md:w-1/2 w-full p-5">
                @livewire('show-producto', ['cat' => $id])
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
                    
                    @php
                        $img = '';
                    @endphp
                    @foreach ($categorias as $cat)
                        @if ($cat->id == $id)
                            @php
                                $img = $cat->imagen
                            @endphp
                        @endif
                    @endforeach 
                    @if (strlen($img) > 0)
                    <div class="mx-auto">
                        <section class="bg-cover bg-left lg:bg-center" style="background-image: url({{Storage::url($img)}})">
                            <div class="flex justify-around items-center container mx-auto">
                                <div class="w-full flex justify-start items-center h-20 lg:h-60">
                                    
                                </div>
                            </div>
                        </section>
                    </div>
                    @endif
                    <div class="flex flex-wrap max-w-7xl mx-auto">
                        <div class="lg:w-3/12 md:w-1/2 w-full p-5">
                            @livewire('show-filtro', ['cat' => $id])
                        </div>
                        <div class="lg:w-9/12 md:w-1/2 w-full p-5">
                            @livewire('show-producto', ['cat' => $id])
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