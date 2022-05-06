<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Departamento;
use App\Models\Provincia;

class ShowDpto extends Component
{
    public $departamentos_id, $dptos=[];
    public $provincias=[], $listp=[];
    public $provincias_id;

    public function render()
    {
        $this->dptos = Departamento::all();
        return view('livewire.show-dpto', [
            'departamentos' => $this->dptos->pluck('nombre', 'id')
        ]);
    }

    public function updatedDepartamentos_id($dpto_id)
    {
        $this->listp = Provincia::where('departamentos_id', $dpto_id)->get();
        $this->provincias = $this->listp->pluck('nombre', 'id');
    }

    public function changeEvent($id_dpto){
        $this->listp = Provincia::where('departamentos_id', $id_dpto)->get();
        $this->provincias = $this->listp->pluck('nombre', 'id');
    }

}
