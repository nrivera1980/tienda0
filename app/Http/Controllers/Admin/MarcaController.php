<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Marca;

class MarcaController extends Controller
{
    public function index()
    {
        $marcas = Marca::all();

        return view('admin.marcas.index', compact('marcas'));
    }

    public function create()
    {
        return view('admin.marcas.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $marca = Marca::create($request->all());

        return redirect()->route('admin.marcas.index')->with('info', 'La marca se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Marca $marca)
    {
        return view('admin.marcas.edit', compact('marca'));
    }

    public function update(Request $request, Marca $marca)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $marca->update($request->all());

        return redirect()->route('admin.marcas.index')->with('info', 'La marca se actualizó con éxito');
    }

    public function destroy(Marca $marca)
    {
        $marca->delete();

        return redirect()->route('admin.marcas.index')->with('info', 'La marca se eliminó con éxito');
    }
}
