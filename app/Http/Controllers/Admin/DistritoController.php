<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Distrito;
use App\Models\Departamento;

class DistritoController extends Controller
{
    public function index()
    {
        $distritos = Distrito::all();

        return view('admin.distritos.index', compact('distritos'));
    }

    public function create()
    {
        return view('admin.distritos.create');
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        //
    }

    public function edit(Distrito $distrito)
    {
        return view('admin.distritos.edit', compact('distrito'));
    }

    public function update(Request $request, Distrito $distrito)
    {
        $request->validate([
            'nombre' => 'required',
            'ubigeo' => 'required',
            'estado' => 'required',
            'provincias_id' => 'required'
        ]);

        $distrito->update($request->all());

        return redirect()->route('admin.distritos.index')->with('info', 'El registro se actualizó con éxito');
    }

    public function destroy(Distrito $distrito)
    {
        $distrito->delete();

        return redirect()->route('admin.distritos.index')->with('info', 'El distrito se eliminó con éxito');
    }
}
