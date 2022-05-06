<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tipo;
use Illuminate\Support\Facades\Storage;

class TipoController extends Controller
{
    public function index()
    {
        $tipos = Tipo::all();

        return view('admin.tipos.index', compact('tipos'));
    }

    public function create()
    {
        return view('admin.tipos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        if ($request->file('imagen'))
        {
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/guias', $request->file('imagen'), $name);

            Tipo::create([
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'estado' => $request->estado,
                'imagen' => $url
            ]);
        }

        return redirect()->route('admin.tipos.index')->with('info', 'El tipo de prenda se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Tipo $tipo)
    {
        return view('admin.tipos.edit', compact('tipo'));
    }

    public function update(Request $request, Tipo $tipo)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        if($request->file('imagen')){

            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/guias', $request->file('imagen'), $name);

            $tipo->nombre = $request->nombre;
            $tipo->descripcion = $request->descripcion;
            $tipo->estado = $request->estado;
            $tipo->imagen = $url;

            $tipo->save();
        }else{
            $tipo->update($request->all());
        }

        return redirect()->route('admin.tipos.index')->with('info', 'El tipo de prenda se actualizó con éxito');
    }

    public function destroy(Tipo $tipo)
    {
        Storage::delete($tipo->imagen);
        
        $tipo->delete();

        return redirect()->route('admin.tipos.index')->with('info', 'El tipo de prenda se eliminó con éxito');
    }
}
