<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Categoria;

class MenuPagina extends Component
{
    public function render()
    {
        return view('livewire.menu-pagina', [
            'categorias' => Categoria::where('estado', 1)->get()
        ]);
    }
}
