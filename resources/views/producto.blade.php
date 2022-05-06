@auth
    @livewire('show-superior')
    <x-app-layout>
        @livewire('show-detalle', ['prd' => $prd, 'fotos' => $fotos])
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
                @livewire('show-detalle', ['prd' => $prd, 'fotos' => $fotos])
                {{-- <div class="container mx-auto">
                    <div class="my-4 mx-10 bg-white grid grid-cols-1 gap-2">
                        <div class="w-full flex">
                            <div class="lg:w-3/5 w-full flex">
                                <div class="w-28 flex flex-col p-1">
                                    <img src="{{Storage::url($prd->imagen)}}" class="w-28 m-1">
                                    @foreach ($fotos as $foto)
                                        <img src="{{Storage::url($foto->ruta)}}" class="w-28 m-1">
                                    @endforeach
                                </div>
                                <div class="w-auto p-1 m-1">
                                    <img src="{{Storage::url($prd->imagen)}}" class="transform transition duration-500 hover:scale-125">
                                </div>
                            </div>
                            <div class="lg:w-2/5 w-full p-2 flex flex-col">
                                <div class="text-black font-bold text-2xl uppercase my-2">{{$prd->nombre}}</div>
                                <div class="text-black text-xl my-1">{{ $prd->breve }}</div>
                                <div class="text-black text-base my-1">SKU: {{ $prd->sku }}</div>
                                <div class="border border-gray-300 w-full mt-2"></div>
                                <div class="flex items-center justify-between my-2">
                                    <div class="text-black font-bold text-xl">Oferta Online</div>
                                    <div class="text-red-600 font-bold text-2xl">S/ {{number_format($prd->precio, 2, '.', ',')}}</div>
                                </div>
                                <div class="border border-gray-300 w-full mt-2"></div>
                                <div class="text-black font-bold text-lg my-2">Colores</div>
                                <div class="flex items-center justify-start my-1">
                                    <div class="w-8 h-8 bg-blue-600"></div>
                                </div>
                                <div class="text-black font-bold text-lg mt-6 mb-1">Talla</div>
                                <div class="flex items-center justify-between my-1">
                                    <div class="flex items-center justify-start">
                                        <a href="#"><div class="w-12 h-10 bg-white border border-gray-900 text-base uppercase flex items-center justify-center">S</div></a>
                                        <a href="#"><div class="w-12 h-10 bg-white border border-gray-900 text-base uppercase flex items-center justify-center m-2">M</div></a>
                                    </div>
                                    <div class="w-auto">
                                        @livewire('mostrar-guiatalla', ['g' => $prd->tipo->id])
                                    </div>
                                </div>
                                <div>
                                    <button class="bg-red-600 w-full py-3 border border-transparent rounded-md text-white font-bold">Añadir al carrito</button>
                                </div>
                                <div class="flex flex-wrap content-center pt-4">
                                    <div class="flex items-center mr-2">
                                        <img src="{{ url('img/icono-24horas.png') }}" class="w-12 h-12">
                                    </div>
                                    <div class="flex flex-col">
                                        <p class="text-black font-bold text-sm">Delivery Express</p>
                                        <p class="text-black text-base">Compra HOY y recíbelo MAÑANA</p>
                                    </div>
                                </div>
                                <div class="flex flex-wrap content-center pt-4">
                                    <div class="flex items-center mr-2">
                                        <img src="{{ url('img/icono-delivery.png') }}" class="w-12 h-12">
                                    </div>
                                    <div class="flex flex-col">
                                        <p class="text-black font-bold text-sm">Delivery GRATIS</p>
                                        <p class="text-black text-base">Por compras desde S/ 139</p>
                                    </div>
                                </div>
                                <div class="flex flex-wrap content-center pt-4">
                                    <div class="flex items-center mr-2">
                                        <img src="{{ url('img/icono-tiendas.png') }}" class="w-12 h-12">
                                    </div>
                                    <div class="flex flex-col">
                                        <p class="text-black font-bold text-sm">Recojo en tienda</p>
                                        <p class="text-black text-base">Retira en más +60 tiendas a nivel nacional</p>
                                    </div>
                                </div>
                                <div class="flex flex-wrap content-center pt-4">
                                    <div class="flex items-center mr-2">
                                        <img src="{{ url('img/icono-track.png') }}" class="w-12 h-12">
                                    </div>
                                    <div class="flex flex-col">
                                        <p class="text-black font-bold text-sm">Revisa tu pedido</p>
                                        <p class="text-black text-base">Ingresa tu N° pedido y conoce su estado</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="w-full">
                            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Descripción</summary>
                                
                                <div class="block">
                                  <div class="px-4 pb-3">
                                    <label class="inline-flex items-center">
                                      {!!$prd->descripcion!!}
                                    </label>
                                  </div>
                                </div>
                                
                            </details>
                        </div>
                        <div class="w-full">
                            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Características</summary>
                                
                                <div class="block">
                                  <div class="px-4 pb-3">
                                    <label class="inline-flex items-center">
                                      {!!$prd->detalles!!}
                                    </label>
                                  </div>
                                </div>
                                
                            </details>
                        </div>
                    </div>
                </div> --}}
                
            </main>

            @livewire('pie-pagina')

        </div>

        @stack('modals')

        @livewireScripts
    </body>
</html>
@endguest
<style>
    details summary::-webkit-details-marker {
          display: none;
      }
       
      details[open] summary {
          background: white;
          color: black;
      }

      details[open] summary::after {
          content: "-";
      }

      details[open] summary ~ * {
          animation: slideDown 0.3s ease-in-out;
      }

      details[open] summary p {
          opacity: 0;
          animation-name: showContent;
          animation-duration: 0.6s;
          animation-delay: 0.2s;
          animation-fill-mode: forwards;
          margin: 0;
      }

      @keyframes showContent {
          from {
          opacity: 0;
          height: 0;
          }
          to {
          opacity: 1;
          height: auto;
          }
      }
      @keyframes slideDown {
          from {
          opacity: 0;
          height: 0;
          padding: 0;
          }

          to {
          opacity: 1;
          height: auto;
          }
      }
</style>