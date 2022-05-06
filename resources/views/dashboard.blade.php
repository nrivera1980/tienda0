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
                {{-- <img src="{{Storage::url($slider->imagen)}}" alt=""> --}}
                <img src="{{Storage::url('slider/1.jpg')}}" alt="">
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
</x-app-layout>
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
