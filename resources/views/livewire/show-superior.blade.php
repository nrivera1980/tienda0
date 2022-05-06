<div class="w-full d-inline">
    @if ($publicidad)
        @foreach ($publicidad as $item)
            @if (strlen($item->urlsuperior) > 0)
                <div class="mx-auto">
                    <div class="flex justify-around items-center h-14 lg:h-12 bg-cover bg-center">
                        <a href="{{$item->urlsuperior}}"><img src="{{Storage::url($item->superior)}}" alt=""></a>
                    </div>
                </div>
            @endif
        @endforeach
    @endif
</div>
