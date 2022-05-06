<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Documento;

class SelectTipodocumento extends Component
{
    public $selectedTipodocumento = null;
    
    public function render()
    {
        return view('livewire.select-tipodocumento', [
            'tipodocumentos' => Documento::where('estado', 1)->get()
        ]);
    }
}
