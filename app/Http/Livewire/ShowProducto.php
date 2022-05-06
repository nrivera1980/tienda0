<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Producto;
use Livewire\WithPagination;

class ShowProducto extends Component
{
    public $cat;

    public function mount($cat)
    {
        $this->cat = $cat;
    }
    
    use WithPagination;
    public function render()
    {
        return view('livewire.show-producto', [

            'productos' => Producto::where('estado', 1)->where('categorias_id', $this->cat)->paginate(9),
            
        ]);
    }
}
