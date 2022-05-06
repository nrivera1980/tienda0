<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Producto;
use App\Models\Categoria;
use App\Models\Color;
use App\Models\Tipo;
use App\Models\Talla;
use App\Models\Fit;
use App\Models\Marca;
use Illuminate\Support\Facades\Storage;

class ProductoController extends Controller
{
    public function index()
    {
        $productos = Producto::all();

        return view('admin.productos.index', compact('productos'));
    }

    public function create()
    {
        $categorias = Categoria::all();
        $select = $categorias->pluck('nombre', 'id');
        $colors = Color::all();
        $selectCol = $colors->pluck('nombre', 'id');
        $tipos = Tipo::all();
        $selectTip = $tipos->pluck('nombre', 'id');
        $tallas = Talla::all();
        $selectTal = $tallas->pluck('nombre', 'id');
        $fits = Fit::all();
        $selectFit = $fits->pluck('nombre', 'id');
        $marcas = Marca::all();
        $selectMar = $marcas->pluck('nombre', 'id');
        return view('admin.productos.create', compact('select', 'selectCol', 'selectTip', 'selectTal', 'selectFit', 'selectMar'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'imagen' => 'image',
            'sku' => 'required',
            'nombre' => 'required',
            'estado' => 'required',
            'categorias_id' => 'required'
        ]);

        if($request->file('imagen')){

            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/productos', $request->file('imagen'), $name);

            Producto::create([
                'imagen' => $url,
                'nombre' => strtoupper($request->nombre),
                'sku' => $request->sku,
                'breve' => $request->breve,
                'precio' => $request->precio,
                'descripcion' => $request->descripcion,
                'detalles' => $request->detalles,
                'estado' => $request->estado,
                'categorias_id' => $request->categorias_id,
                'facebook' => $request->facebook,
                'compartir' => $request->compartir,
                'marcas_id' => $request->marcas_id,
                'tallas_id' => $request->tallas_id,
                'tipos_id' => $request->tipos_id,
                'fits_id' => $request->fits_id,
                'colors_id' => $request->colors_id
            ]);
        }

        //$detallebaners = Detallebaner::create($request->all());

        return redirect()->route('admin.productos.index')->with('info', 'El producto se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Producto $producto)
    {
        $categorias = Categoria::all();
        $select = $categorias->pluck('nombre', 'id');
        $colors = Color::all();
        $selectCol = $colors->pluck('nombre', 'id');
        $tipos = Tipo::all();
        $selectTip = $tipos->pluck('nombre', 'id');
        $tallas = Talla::all();
        $selectTal = $tallas->pluck('nombre', 'id');
        $fits = Fit::all();
        $selectFit = $fits->pluck('nombre', 'id');
        $marcas = Marca::all();
        $selectMar = $marcas->pluck('nombre', 'id');
        return view('admin.productos.edit', compact('producto', 'select', 'selectCol', 'selectTip', 'selectTal', 'selectFit', 'selectMar'));
    }

    public function update(Request $request, Producto $producto)
    {
        $request->validate([
            'imagen' => 'image',
            'sku' => 'required',
            'nombre' => 'required',
            'estado' => 'required',
            'categorias_id' => 'required'
        ]);

        if($request->file('imagen')){
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/productos', $request->file('imagen'), $name);

            $producto->nombre = strtoupper($request->nombre);
            $producto->sku = $request->sku;
            $producto->breve = $request->breve;
            $producto->precio = $request->precio;
            $producto->descripcion = $request->descripcion;
            $producto->detalles = $request->detalles;
            $producto->imagen = $url;
            $producto->estado = $request->estado;
            $producto->categorias_id = $request->categorias_id;
            $producto->facebook = $request->facebook;
            $producto->compartir = $request->compartir;
            $producto->marcas_id = $request->marcas_id;
            $producto->tallas_id = $request->tallas_id;
            $producto->tipos_id = $request->tipos_id;
            $producto->fits_id = $request->fits_id;
            $producto->colors_id = $request->colors_id;

            $producto->save();
        }else{
            $producto->update($request->all());
        }

        return redirect()->route('admin.productos.index')->with('info', 'El producto se actualizó con éxito');
    }

    public function destroy(Producto $producto)
    {
        Storage::delete($producto->imagen);
        
        $producto->delete();

        return redirect()->route('admin.productos.index')->with('info', 'El producto se eliminó con éxito');
    }
}
