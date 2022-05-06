<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Categoria;

use Illuminate\Support\Facades\Storage;

class CategoriaController extends Controller
{
    public function index()
    {
        $categorias = Categoria::all();

        return view('admin.categorias.index', compact('categorias'));
    }

    public function create()
    {
        $select = Categoria::whereNull('categorias_id')
            ->with('subcategorias')
            ->orderByRaw('id, categorias_id, orden')
            ->get();
        return view('admin.categorias.create', compact('select'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'slug' => 'required',
            'estado' => 'required',
            'orden' => 'required',
            'padre' => 'required'
        ]);

        if($request->file('imagen')){

            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/cabeceras', $request->file('imagen'), $name);

            Categoria::create([
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'estado' => $request->estado,
                'orden' => $request->orden,
                'categorias_id' => $request->categorias_id,
                'slug' => $request->slug,
                'padre' => $request->padre,
                'imagen' => $url
            ]);
        }else{
            Categoria::create($request->all());
        }

        //$categoria = Categoria::create($request->all());

        return redirect()->route('admin.categorias.index')->with('info', 'La categoría se creó con éxito');
    }

    public function edit(Categoria $categoria)
    {
        $select = Categoria::whereNull('categorias_id')
            ->with('subcategorias')
            ->orderByRaw('id, categorias_id, orden')
            ->get();

        return view('admin.categorias.edit', compact('categoria', 'select'));
    }

    public function update(Request $request, Categoria $categoria)
    {
        $urlpasado = $categoria->imagen;
        
        $request->validate([
            'nombre' => 'required',
            'slug' => 'required',
            'estado' => 'required',
            'orden' => 'required'
        ]);

        $categoria->update($request->all());

        if($request->file('imagen')){
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/cabeceras', $request->file('imagen'), $name);

            if($urlpasado){
                Storage::delete($urlpasado);
            }

            $categoria->update([
                'imagen' => $url
            ]);
        }

        return redirect()->route('admin.categorias.index')->with('info', 'La categoría se actualizó con éxito');
    }

    public function destroy(Categoria $categoria)
    {
        Storage::delete($categoria->imagen);
        
        $categoria->delete();

        return redirect()->route('admin.categorias.index')->with('info', 'La categoría se eliminó con éxito');
    }
}
