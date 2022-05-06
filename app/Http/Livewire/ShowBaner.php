<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Baner;

class ShowBaner extends Component
{
    public function render()
    {
        return view('livewire.show-baner', ['baner' => Baner::where('estado', 1)->orderBy('posicion')->get()]);
    }
}
