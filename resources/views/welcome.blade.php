@auth
@livewire('show-superior')
    <x-app-layout>
        <div class="mx-auto">
            <div class="slider w-full h-96">
                @php
                    $cnt=0;
                @endphp
                @foreach ($sliders as $slider)
                    @if ($cnt == 0)
                        <div class="slide active">
                            <img src="{{Storage::url($slider->imagen)}}" alt="">
                            @if (!is_null($slider->mensaje))
                            <div class="info grid justify-items-center">
                                <h2 class="text-center">{!!$slider->mensaje!!}</h2>
                                @if (!is_null($slider->boton))
                                <a href="{{$slider->enlace}}" class="btn-mensaje font-bold py-2 px-4 mt-10">{{$slider->boton}}</a>
                                @endif
                            </div>
                            @endif
                        </div>
                    @else
                        <div class="slide">
                            <img src="{{Storage::url($slider->imagen)}}" alt="">
                            @if (!is_null($slider->mensaje))
                            <div class="info grid justify-items-center">
                                <h2 class="text-center">{!!$slider->mensaje!!}</h2>
                                @if (!is_null($slider->boton))
                                <a href="{{$slider->enlace}}" class="btn-mensaje font-bold py-2 px-4 mt-10">{{$slider->boton}}</a>
                                @endif
                            </div>
                            @endif
                        </div>
                    @endif
                    @php
                        $cnt++;
                    @endphp
                @endforeach
                
                <div class="navigation h-96">
                    <i class="im im-angle-left prev-btn"></i>
                    <i class="im im-angle-right next-btn"></i>
                </div>
                <div class="navigation-visibility">
                @for ($i = 0; $i < $cnt; $i++)
                    @if ($i == 0)
                        <div class="slide-icon active"></div>
                    @else
                        <div class="slide-icon"></div>
                    @endif
                @endfor
                </div>
            </div>
        </div>
        @livewire('show-publicidad')
        @livewire('show-baner')
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
                    <div class="slider w-full h-96">
                        @php
                            $cnt=0;
                        @endphp
                        @foreach ($sliders as $slider)
                            @if ($cnt == 0)
                                <div class="slide active">
                                    <img src="{{Storage::url($slider->imagen)}}" alt="">
                                    @if (!is_null($slider->mensaje))
                                    <div class="info grid justify-items-center">
                                        <h2 class="text-center">{!!$slider->mensaje!!}</h2>
                                        @if (!is_null($slider->boton))
                                        <a href="{{$slider->enlace}}" class="btn-mensaje font-bold py-2 px-4 mt-10">{{$slider->boton}}</a>
                                        @endif
                                    </div>
                                    @endif
                                </div>
                            @else
                                <div class="slide">
                                    <img src="{{Storage::url($slider->imagen)}}" alt="">
                                    @if (!is_null($slider->mensaje))
                                    <div class="info grid justify-items-center">
                                        <h2 class="text-center">{!!$slider->mensaje!!}</h2>
                                        @if (!is_null($slider->boton))
                                        <a href="{{$slider->enlace}}" class="btn-mensaje font-bold py-2 px-4 mt-10">{{$slider->boton}}</a>
                                        @endif
                                    </div>
                                    @endif
                                </div>
                            @endif
                            @php
                                $cnt++;
                            @endphp
                        @endforeach
                        <div class="navigation h-96">
                            <i class="im im-angle-left prev-btn"></i>
                            <i class="im im-angle-right next-btn"></i>
                        </div>
                        <div class="navigation-visibility">
                        @for ($i = 0; $i < $cnt; $i++)
                            @if ($i == 0)
                                <div class="slide-icon active"></div>
                            @else
                                <div class="slide-icon"></div>
                            @endif
                        @endfor
                        </div>
                    </div>
                  </div>
                  <div class="mx-auto">
                    @livewire('show-publicidad')
                  </div>
                  <div class="mx-auto">
                    @livewire('show-baner')
                  </div>
                  <div class="mx-auto">
                    @livewire('pie-pagina')
                  </div>
            </main>

        </div>

        @stack('modals')

        @livewireScripts
    </body>
</html>
@endguest
<script>
    const slider = document.querySelector(".slider");
    const nextBtn = document.querySelector(".next-btn");
    const prevBtn = document.querySelector(".prev-btn");
    const slides = document.querySelectorAll(".slide");
    const slideIcons = document.querySelectorAll(".slide-icon");
    const numberOfSlides = slides.length;
    var slideNumber = 0;
  
    //image slider next button
    nextBtn.addEventListener("click", () => {
        slides.forEach((slide) => {
            slide.classList.remove("active");
        });
        slideIcons.forEach((slideIcon) => {
            slideIcon.classList.remove("active");
        });
  
        slideNumber++;
  
        if(slideNumber > (numberOfSlides - 1)){
            slideNumber = 0;
        }
  
        slides[slideNumber].classList.add("active");
        slideIcons[slideNumber].classList.add("active");
    });
  
    //image slider previous button
    prevBtn.addEventListener("click", () => {
        slides.forEach((slide) => {
            slide.classList.remove("active");
        });
        slideIcons.forEach((slideIcon) => {
            slideIcon.classList.remove("active");
        });
  
        slideNumber--;
  
        if(slideNumber < 0){
            slideNumber = numberOfSlides - 1;
        }
  
        slides[slideNumber].classList.add("active");
        slideIcons[slideNumber].classList.add("active");
    });
  
    //image slider autoplay
    var playSlider;
  
    var repeater = () => {
        playSlider = setInterval(function(){
            slides.forEach((slide) => {
            slide.classList.remove("active");
            });
            slideIcons.forEach((slideIcon) => {
            slideIcon.classList.remove("active");
            });
  
            slideNumber++;
  
            if(slideNumber > (numberOfSlides - 1)){
            slideNumber = 0;
            }
  
            slides[slideNumber].classList.add("active");
            slideIcons[slideNumber].classList.add("active");
        }, 4000);
    }
    repeater();
  
    //stop the image slider autoplay on mouseover
    slider.addEventListener("mouseover", () => {
        clearInterval(playSlider);
    });
  
    //start the image slider autoplay again on mouseout
    slider.addEventListener("mouseout", () => {
        repeater();
    });
  </script>
