<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Marca;
use App\Models\Tipo;
use App\Models\Color;
use App\Models\Fit;
use App\Models\Talla;
use Illuminate\Support\Facades\DB;

class ShowFiltro extends Component
{
    public $cat;

    public function mount($cat)
    {
        $this->cat = $cat;
    }
    
    public function render()
    {
        return view('livewire.show-filtro', [

            'marcas' => Marca::join('productos', function($join) {
                $join->on('marcas.id', '=', 'productos.marcas_id')
                ->where('marcas.estado', 1)->where('productos.categorias_id', $this->cat);
            })->select('marcas.id', 'marcas.nombre', 'marcas.descripcion', 'marcas.estado')
            ->groupBy('marcas.id', 'marcas.nombre', 'marcas.descripcion', 'marcas.estado')->get(),

            'tipos' => Tipo::join('productos', function($join) {
                $join->on('tipos.id', '=', 'productos.tipos_id')
                ->where('tipos.estado', 1)->where('productos.categorias_id', $this->cat);
            })->select('tipos.id', 'tipos.nombre', 'tipos.descripcion', 'tipos.estado')
            ->groupBy('tipos.id', 'tipos.nombre', 'tipos.descripcion', 'tipos.estado')->get(),

            'colors' => Color::join('productos', function($join) {
                $join->on('colors.id', '=', 'productos.colors_id')
                ->where('colors.estado', 1)->where('productos.categorias_id', $this->cat);
            })->select('colors.id', 'colors.nombre', 'colors.descripcion', 'colors.estado')
            ->groupBy('colors.id', 'colors.nombre', 'colors.descripcion', 'colors.estado')->get(),

            'fits' => Fit::join('productos', function($join) {
                $join->on('fits.id', '=', 'productos.fits_id')
                ->where('fits.estado', 1)->where('productos.categorias_id', $this->cat);
            })->select('fits.id', 'fits.nombre', 'fits.descripcion', 'fits.estado')
            ->groupBy('fits.id', 'fits.nombre', 'fits.descripcion', 'fits.estado')->get(),

            'tallas' => Talla::join('producto_tallas', 'producto_tallas.tallas_id', '=', 'tallas.id')
		          ->join('productos', 'productos.id', '=', 'producto_tallas.productos_id')
		          ->where('tallas.estado', 1)
		          ->where('productos.categorias_id', $this->cat)
		          ->select('tallas.*')
                  ->groupBy('tallas.id', 'tallas.nombre', 'tallas.descripcion', 'tallas.estado')
                  ->get()

            /* 'tallas' => Talla::join('productos', function($join) {
                $join->on('tallas.id', '=', 'productos.tallas_id')
                ->where('tallas.estado', 1)->where('productos.categorias_id', $this->cat);
            })->select('tallas.id', 'tallas.nombre', 'tallas.descripcion', 'tallas.estado')
            ->groupBy('tallas.id', 'tallas.nombre', 'tallas.descripcion', 'tallas.estado')->get(), */
            
        ]);
    }
}
