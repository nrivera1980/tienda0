<div>
    <div class='flex items-center justify-center bg-gradient-to-br'>
        <div class='w-full px-2 py-1 mx-auto rounded-lg'>
            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Marca</summary>
                @foreach ($marcas as $marca)
                <div class="block">
                  <div class="px-4 @if($loop->first) pt-3 @endif pb-3">
                    <label class="inline-flex items-center">
                      <input type="checkbox" class="text-green-700 focus:ring-white w-5 h-5 focus:ring-opacity-25 border"  />
                      <span class="ml-2">{{ $marca->nombre }}</span>
                    </label>
                  </div>
                </div>
                @endforeach
            </details>
        </div>
    </div> 

    <div class='flex items-center justify-center bg-gradient-to-br'>
        <div class='w-full px-2 py-1 mx-auto rounded-lg'>
            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Tipo</summary>
                @foreach ($tipos as $tipo)
                <div class="block">
                  <div class="px-4 @if($loop->first) pt-3 @endif pb-3">
                    <label class="inline-flex items-center">
                      <input type="checkbox" class="text-green-700 focus:ring-white w-5 h-5 focus:ring-opacity-25 border"  />
                      <span class="ml-2">{{ $tipo->nombre }}</span>
                    </label>
                  </div>
                </div>
                @endforeach
            </details>
        </div>
    </div>
    
    <div class='flex items-center justify-center bg-gradient-to-br'>
        <div class='w-full px-2 py-1 mx-auto rounded-lg'>
            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Color</summary>
                @foreach ($colors as $color)
                <div class="block">
                  <div class="px-4 @if($loop->first) pt-3 @endif pb-3">
                    <label class="inline-flex items-center">
                      <input type="checkbox" class="text-green-700 focus:ring-white w-5 h-5 focus:ring-opacity-25 border"  />
                      <span class="ml-2">{{ $color->nombre }}</span>
                    </label>
                  </div>
                </div>
                @endforeach
            </details>
        </div>
    </div>

    <div class='flex items-center justify-center bg-gradient-to-br'>
        <div class='w-full px-2 py-1 mx-auto rounded-lg'>
            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Fit</summary>
                @foreach ($fits as $fit)
                <div class="block">
                  <div class="px-4 @if($loop->first) pt-3 @endif pb-3">
                    <label class="inline-flex items-center">
                      <input type="checkbox" class="text-green-700 focus:ring-white w-5 h-5 focus:ring-opacity-25 border"  />
                      <span class="ml-2">{{ $fit->nombre }}</span>
                    </label>
                  </div>
                </div>
                @endforeach
            </details>
        </div>
    </div>

    <div class='flex items-center justify-center bg-gradient-to-br'>
        <div class='w-full px-2 py-1 mx-auto rounded-lg'>
            <details class="w-full bg-white border border-gray-900 cursor-pointer mb-3" open>
                <summary class="w-full bg-white text-dark font-bold flex justify-between px-4 py-3  after:content-['+']">Talla</summary>
                @foreach ($tallas as $talla)
                <div class="block">
                  <div class="px-4 @if($loop->first) pt-3 @endif pb-3">
                    <label class="inline-flex items-center">
                      <input type="checkbox" class="text-green-700 focus:ring-white w-5 h-5 focus:ring-opacity-25 border"  />
                      <span class="ml-2">{{ $talla->nombre }}</span>
                    </label>
                  </div>
                </div>
                @endforeach
            </details>
        </div>
    </div>
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
</div>