<div>
    <div class="container mx-auto">
        <div class="my-4 mx-10 bg-white grid grid-cols-1 gap-2">
            <div class="w-full flex">
                <div class="lg:w-3/5 w-full flex">
                    <div class="w-28 flex flex-col p-1">
                        <img src="{{Storage::url($prd->imagen)}}" wire:click="pasarfoto('{{$prd->imagen}}')" class="cursor-pointer w-28 m-1">
                        @foreach ($fotos as $foto)
                            <img src="{{Storage::url($foto->ruta)}}" wire:click="pasarfoto('{{$foto->ruta}}')" class="cursor-pointer w-28 m-1">
                        @endforeach
                    </div>
                    <div class="p-1 m-1">
                        <img src="{{Storage::url($maxfoto)}}" class="transform transition duration-500 hover:scale-125">
                    </div>
                </div>
                <div class="lg:w-2/5 w-full p-2 flex flex-col">
                    <div class="text-black font-bold text-2xl uppercase my-2">{{$prd->nombre}} {{$mostrartalla}}</div>
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
                        @foreach ($colores as $color)
                        <a href="{{route('detalle.producto', $color->id)}}" title="{{$color->breve}}"><div class="w-8 h-8 mr-2" style="background-color:{{$color->rgb}};"></div></a>
                        @endforeach
                    </div>
                    <div class="text-black font-bold text-lg mt-6 mb-1">Talla</div>
                    <div class="flex items-center justify-between my-1">
                        <div class="flex items-center justify-start">
                            @foreach ($tallas as $talla)
                            <button wire:click="elegirtalla('{{$talla->nombre}}')" class="w-12 h-10 mr-2 {{$colbasetalla}} {{$coltexttalla}} border border-gray-900 text-base uppercase flex items-center justify-center hover:bg-gray-900 hover:text-white">{{$talla->nombre}}</button>
                            @endforeach
                        </div>
                        <div class="w-auto">
                            @livewire('mostrar-guiatalla', ['g' => $prd->tipo->id])
                        </div>
                    </div>
                    <div>
                        <button class="bg-red-600 w-full py-3 border border-transparent rounded-md text-white font-bold {{$estboton}}">{{$msjboton}}</button>
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
    </div>
</div>
