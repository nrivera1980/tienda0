<div class="d-inline">
    @if ($baner)
        @foreach ($baner as $item)
            <div class="mx-auto py-2 lg:py-4">
                <div class="flex justify-center w-full sm:carousel-inner sm:relative sm:overflow-hidden">
                    @foreach ($item->detallebaners as $subitem)
                        <div class="px-2 sm:carousel-item sm:relative">
                            <a href="{{$subitem->url}}"><img src="{{Storage::url($subitem->img)}}" style="width: {{$subitem->ancho}}; height: {{$subitem->alto}};"></a> 
                        </div>
                    @endforeach
                </div>
            </div>
        @endforeach    
    @endif
</div>
