<?php

namespace App\Http\Livewire;

use App\Models\Color;
use App\Models\Talla;
use Livewire\Component;

class ShowDetalle extends Component
{
    public $prd, $fotos;
    public $maxfoto, $ku, $mostrartalla, $colbasetalla='bg-white', $coltexttalla='text-black';
    public $msjboton = 'Seleccione talla', $estboton = 'opacity-50 cursor-not-allowed';

    public function mount($prd, $fotos)
    {
        $this->prd = $prd;
        $this->fotos = $fotos;
        $this->maxfoto = $prd->imagen;
        $this->sku = substr($this->prd->sku, 0, -3);
    }
    
    public function render()
    {
        $colores = Color::join('productos', 'colors.id', '=', 'productos.colors_id')
                            ->where('productos.sku', 'like', $this->sku.'%')
                            ->where('colors.estado', 1)
                            ->select('breve', 'rgb', 'productos.id')
                            ->get();

        $tallas = Talla::join('producto_tallas', 'producto_tallas.tallas_id', '=', 'tallas.id')
                            ->join('productos', 'productos.id', '=', 'producto_tallas.productos_id')
                            ->where('tallas.estado', '=', 1)
                            ->where('productos.id', '=', $this->prd->id)
                            ->select('tallas.nombre', 'producto_tallas.id')
                            ->get();

        return view('livewire.show-detalle', compact('colores', 'tallas'));
    }

    public function pasarfoto($minfoto)
    {
        $this->maxfoto = $minfoto;
    }

    public function elegirtalla($talla)
    {
        $this->colbasetalla = 'bg-gray-900';
        $this->coltexttalla = 'text-white';
        $this->mostrartalla = $talla;
        $this->msjboton = 'Añadir al carrito';
        $this->estboton = '';
    }
}
