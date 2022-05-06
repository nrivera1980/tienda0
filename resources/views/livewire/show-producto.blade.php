<div>
    <div class="font-bold text-lg text-black pl-2">
      {{ $productos->total() }} productos {!! $productos->links() !!}
    </div>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      @if (!is_null($productos)) 
        @foreach ($productos as $item)
          <div class="flex items-center justify-center">
            <div class="max-w-sm w-full sm:w-full lg:w-full py-4 px-2">
              <div class="bg-white shadow-xl rounded-lg overflow-hidden w-72">
                <a href="{{route('detalle.producto', $item)}}">
                  <div class="bg-cover bg-center h-96 p-4" style="background-image: url({{Storage::url($item->imagen)}})">
                    <div class="flex justify-end">
                      <svg class="h-6 w-6 text-white fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M12.76 3.76a6 6 0 0 1 8.48 8.48l-8.53 8.54a1 1 0 0 1-1.42 0l-8.53-8.54a6 6 0 0 1 8.48-8.48l.76.75.76-.75zm7.07 7.07a4 4 0 1 0-5.66-5.66l-1.46 1.47a1 1 0 0 1-1.42 0L9.83 5.17a4 4 0 1 0-5.66 5.66L12 18.66l7.83-7.83z"></path>
                      </svg>
                    </div>
                  </div>
                </a>
                <div class="p-4">
                  <p class="uppercase tracking-wide text-sm font-bold text-gray-700">{{ $item->nombre }}</p>
                  <a href="{{route('detalle.producto', $item)}}">
                    <p class="text-gray-700">{{  strip_tags(Str::limit($item->breve, 28)) }}</p>
                  </a>
                </div>
                <div class="flex items-center justify-between p-4 text-gray-700">
                  <p class="text-gray-900 font-bold text-right">Online</p>
                  <p class="text-right font-bold text-red-600">S/ {{ number_format($item->precio, 2, '.', ',') }}</p>
                </div>
              </div>
            </div>
          </div>
        @endforeach
      @else
            <div class="p-2">
                <p class="text-red-700 text-lg lg:text-2xl">Muy pronto tendremos productos de esta categoría, mientras tanto siga en nuestro catalogo</p>
            </div>
        @endif
    </div>
    <div class="font-bold text-lg text-black pl-2">
      {!! $productos->links() !!}
    </div>
</div>
