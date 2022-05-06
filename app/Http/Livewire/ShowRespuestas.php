<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Respuesta;

class ShowRespuestas extends Component
{
    public $reclamoId;

    protected $listeners = ['render' => 'render'];
    
    public function render()
    {
        $respuestas = Respuesta::where('reclamos_id', $this->reclamoId)->get();
        $idreclamo = $this->reclamoId;
        
        return view('livewire.show-respuestas', compact('respuestas', 'idreclamo'));
    }
}
