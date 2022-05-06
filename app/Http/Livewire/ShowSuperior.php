<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Publicidad;

class ShowSuperior extends Component
{
    public function render()
    {
        return view('livewire.show-superior', ['publicidad' => Publicidad::where('estado', 1)->get()]);
    }
}
