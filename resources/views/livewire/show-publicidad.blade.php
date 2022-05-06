<div class="w-full d-inline">
    @if ($pubslider)
        @foreach ($pubslider as $item)
            @if (strlen($item->urlslider) > 0)
                <div class="mx-auto py-2 lg:py-4">
                    <div class="flex justify-around items-center h-28 lg:h-24 bg-cover bg-center">
                        <a href="{{$item->urlslider}}"><img src="{{Storage::url($item->slider)}}" alt=""></a>
                    </div>
                </div>
            @endif
        @endforeach
    @endif
</div>
