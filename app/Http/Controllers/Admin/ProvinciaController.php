<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Departamento;
use Illuminate\Http\Request;
use App\Models\Provincia;

class ProvinciaController extends Controller
{
    public function index()
    {
        $provincias = Provincia::all();

        return view('admin.provincias.index', compact('provincias'));
    }

    public function create()
    {
        $dpto = Departamento::all();
        $select = $dpto->pluck('nombre', 'id');
        return view('admin.provincias.create', compact('select'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'ubigeo' => 'required',
            'estado' => 'required',
            'departamentos_id' => 'required'
        ]);

        $provincia = Provincia::create($request->all());

        return redirect()->route('admin.provincias.index', $provincia)->with('info', 'La provincia se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Provincia $provincia)
    {
        $dpto = Departamento::all();
        $select = $dpto->pluck('nombre', 'id');
        return view('admin.provincias.edit', compact('provincia', 'select'));
    }

    public function update(Request $request, Provincia $provincia)
    {
        $request->validate([
            'nombre' => 'required',
            'ubigeo' => 'required',
            'estado' => 'required',
            'departamentos_id' => 'required'
        ]);

        $provincia->update($request->all());

        return redirect()->route('admin.provincias.index')->with('info', 'El registro se actualizó con éxito');
    }

    public function destroy(Provincia $provincia)
    {
        $provincia->delete();

        return redirect()->route('admin.provincias.index')->with('info', 'La provincia se eliminó con éxito');
    }
}
