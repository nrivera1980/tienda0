<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Publicidad;

class ShowPublicidad extends Component
{
    public function render()
    {
        return view('livewire.show-publicidad', ['pubslider' => Publicidad::where('estado', 1)->get()]);
    }
}
