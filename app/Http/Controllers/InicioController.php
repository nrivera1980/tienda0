<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Models\Categoria;
use App\Models\Slider;
use App\Models\Producto;
use App\Models\Foto;
use App\Models\Empresa;

class InicioController extends Controller
{
    public function index()
    {
        $sliders = Slider::where('estado', 1)->get();
        $categorias = Categoria::where('estado', 1)->get();
        
        return view('welcome', compact('sliders', 'categorias'));
    }

    public function catalogo()
    {
        $categorias = Categoria::where('estado', 1)->get();
        $productos = Producto::where('estado', 1)->get();
        
        return view('catalogo', compact('categorias', 'productos'));
    }

    public function categoria($id)
    {
        return view('catalogo', compact('id'));
    }

    public function producto_detalle(Producto $prd)
    {
        $fotos = Foto::where('estado', 1)->where('productos_id', $prd->id)->get();

        return view('producto', compact('prd', 'fotos'));
    }
}
