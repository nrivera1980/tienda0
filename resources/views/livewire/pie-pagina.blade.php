<div>
    <div class="bg-cover bg-right lg:bg-center" style="background-image: url({{asset('img/suscribete.jpg')}});">
      <div class="flex justify-around items-center mx-auto">
        <div class="flex-grow"></div>
        <div class="flex-none w-full lg:w-5/12">
          <h3 class="pt-2 pl-2">¡Un <strong> descuento especial </strong> por tu <strong>cumpleaños</strong>!</h3>
          <h3 class="pb-2 pl-2">¡<strong>Cupones</strong> exclusivos y notificaciones de nuestros <strong> mejores eventos</strong>!</h3>
          <div class="flex flex-wrap">
            <div class="p-2 w-full lg:w-1/2">
              <div class="relative">
                  <label for="mailsuscriptor" class="form-control">Correo electrónico *</label>
                  <input id="mailsuscriptor" name="mailsuscriptor" class="form-control form-control-sm w-full" type="email">
              </div>
            </div>
            <div class="p-2 w-full lg:w-1/2">
              <div class="relative">
                <label for="ncsuscriptor" class="form-control">Fecha de nacimiento *</label>
                <input id="ncsuscriptor" name="ncsuscriptor" class="form-control form-control-sm" type="date">
              </div>
            </div>
            <div class="p-2 w-full">
              <div class="relative">
                <h3 class="font-bold italic">Deseo recibir promociones de:*</h3>
                <input type="radio" id="female" name="genero" value="F" class="form-control form-control-sm">
                <label for="female">Mujer</label>
                <input type="radio" id="male" name="genero" value="M" class="form-control form-control-sm ml-12">
                <label for="male">Hombre</label>
              </div>
            </div>
            <div class="pl-2 w-full">
              <div class="relative">
                <input type="checkbox" name="ninos" id="ninos" class="form-control form-control-sm">
                <label class="text-sm">También deseo recibir promociones y ofertas para niños.</label>
              </div>
            </div>
            <div class="p-2 w-full">
              <div class="relative">
                <input type="checkbox" name="terminos" id="terminos" class="form-control form-control-sm">
                <label class="text-sm">He leído y acepto la <a href="{{route('terminos')}}" class="text-black underline">política de protección</a> de datos personales.</label>
              </div>
            </div>
            <div class="p-2 w-full">
              <div class="relative">
                <button type="button" class="px-4 py-3 bg-blue-600 rounded-md text-white outline-none focus:ring-4 shadow-lg transform active:scale-x-75 transition-transform mx-5 flex">
                  suscribirme
                </button>
              </div>
            </div>
          </div>
        </div>
        {{-- <div class="h-96 w-full bg-opacity-75 flex flex-col justify-center items-center">
          <div class="text-black text-base lg:text-lg font-bold"><p class="leading-normal" style="text-align: justify; text-align-last: center;">¡Un <strong> descuento especial </strong> por tu <strong>cumpleaños</strong> !</p></div>
        </div> --}}
      </div>
    </div>
    <footer class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto flex md:items-center lg:items-start md:flex-row md:flex-nowrap flex-wrap flex-col">
          <div class="w-64 flex-shrink-0 md:mx-0 mx-auto text-center md:text-left">
            <a class="flex title-font font-medium items-center md:justify-start justify-center text-gray-900">
              <img src="{{ url('img/la-tienda-36.png') }}" alt="La Tienda">
            </a>
            <h2 class="title-font font-medium text-gray-900 tracking-widest text-sm mt-4 mb-3"> <strong> CONTACTO </strong></h2>
            <ul class="text-sm text-gray-900">
              @foreach ($empresa as $item)
              <li class="flex items-center "><img src="{{ url('img/location.svg') }}" alt="" srcset="{{ url('img/location.svg') }}" width="24" height="24">{{ $item->direccion }}</li>
              <li class="flex items-center"><img src="{{ url('img/telefono.svg') }}" alt="" srcset="{{ url('img/telefono.svg') }}" width="24" height="24" class="mr-2">{{ $item->telefono }}</li>
              <li class="flex items-center"><img src="{{ url('img/email.svg') }}" alt="" srcset="{{ url('img/email.svg') }}" width="24" height="24" class="mr-2">{{ $item->email }}</li>
              @endforeach
            </ul>
          </div>
          <div class="flex-grow flex flex-wrap md:pl-20 -mb-10 md:mt-0 mt-10 md:text-left text-center">
            <div class="lg:w-1/4 md:w-1/2 w-full px-4">
              <h2 class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3"> <strong> LA TIENDA </strong></h2>
              <nav class="list-none mb-10">
                <li>
                  <a href="{{ route('nosotros') }}" :active="request()->routeIs('nosotros')" class="text-gray-600 hover:text-gray-900">Nosotros</a>
                </li>
                <li>
                  <a href="{{ route('tiendas') }}" :active="request()->routeIs('tiendas')" class="text-gray-600 hover:text-gray-900">Tiendas</a>
                </li>
                <li>
                  <a href="{{ route('contactanos') }}" :active="request()->routeIs('contactanos')" class="text-gray-600 hover:text-gray-900">Contáctanos</a>
                </li>
              </nav>
            </div>
            <div class="lg:w-1/4 md:w-1/2 w-full px-4">
              <h2 class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3"><strong>CATEGORIAS</strong></h2>
              <nav class="list-none mb-10">
                @foreach ($categorias as $item)
                <li>
                  <a href="{{ route('categoria', $item->id) }}" class="text-gray-600 hover:text-gray-900">
                    {{ $item->nombre }}
                  </a>
                </li>
                @endforeach
                <li>
                  <a href="#" class="text-red-600 hover:text-red-900">Venta de Entradas (*)</a>
                </li>
              </nav>
            </div>
            <div class="lg:w-1/4 md:w-1/2 w-full px-4">
              <h2 class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3"><strong>ATENCIÓN AL USUARIO</strong></h2>
              <nav class="list-none mb-10">
                <li>
                  <a href="{{ route('preguntas-frecuentes') }}" :active="request()->routeIs('preguntas-frecuentes')" class="text-gray-600 hover:text-gray-900">Preguntas frecuentes</a>
                </li>
                <li>
                  <a href="{{ route('terminos-y-condiciones') }}" :active="request()->routeIs('terminos-y-condiciones')" class="text-gray-600 hover:text-gray-900">Términos y condiciones</a>
                </li>
                <li>
                  <a href="{{ route('politica-y-proteccion-de-datos') }}" :active="request()->routeIs('politica-y-proteccion-de-datos')" class="text-gray-600 hover:text-gray-900">Política y protección de datos</a>
                </li>
                <li>
                  <a href="{{ route('bases-legales') }}" :active="request()->routeIs('bases-legales')" class="text-gray-600 hover:text-gray-900">Bases legales</a>
                </li>
              </nav>
            </div>
            <div class="lg:w-1/4 md:w-1/2 w-full px-4">
                <h2 class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3"><strong>LIBRO DE RECLAMACIONES</strong></h2>
                <nav class="list-none mb-10">
                  <li>
                    <a href="{{route('reclamos')}}"><img src="{{url('img/libro_reclamaciones.png')}}" alt=""></a>
                  </li>
                </nav>
              </div>
          </div>
        </div>
        <div class="bg-gray-100">
          <div class="container mx-auto py-4 px-5 flex flex-wrap flex-col sm:flex-row">
            <p class="text-gray-500 text-sm text-center sm:text-left">© 2022 La Tienda —
              <a href="https://sysapp.dev" rel="noopener noreferrer" class="text-gray-600 ml-1" target="_blank">Realizado por SySapp.dev</a>
            </p>
            <span class="inline-flex sm:ml-auto sm:mt-0 mt-2 justify-center sm:justify-start">Encuentranos en: 
              <a href="#" class="text-gray-500">
                <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                  <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path>
                </svg>
              </a>
              <a href="#" class="ml-3 text-gray-500">
                <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                  <path d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"></path>
                </svg>
              </a>
              <a href="#" class="ml-3 text-gray-500">
                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                  <rect width="20" height="20" x="2" y="2" rx="5" ry="5"></rect>
                  <path d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"></path>
                </svg>
              </a>
              <a href="#" class="ml-3 text-gray-500">
                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="0" class="w-5 h-5" viewBox="0 0 24 24">
                  <path stroke="none" d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6zM2 9h4v12H2z"></path>
                  <circle cx="4" cy="4" r="2" stroke="none"></circle>
                </svg>
              </a>
            </span>
          </div>
        </div>
      </footer>
</div>
