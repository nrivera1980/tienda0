<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Tipo;

class MostrarGuiatalla extends Component
{
    public $open = false, $guia;

    public function mount($g){
        $this->guia = Tipo::where('estado', 1)->where('id', $g)->first();
    }
    
    public function render()
    {
        return view('livewire.mostrar-guiatalla');
    }
}
