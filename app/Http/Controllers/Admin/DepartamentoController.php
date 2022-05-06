<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Departamento;

class DepartamentoController extends Controller
{
    public function index()
    {
        $departamentos = Departamento::all();

        return view('admin.departamentos.index', compact('departamentos'));
    }

    public function create()
    {
        return view('admin.departamentos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'ubigeo' => 'required',
            'estado' => 'required'
        ]);

        $departamento = Departamento::create($request->all());

        return redirect()->route('admin.departamentos.index', $departamento)->with('info', 'El departamento se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Departamento $departamento)
    {
        return view('admin.departamentos.edit', compact('departamento'));
    }

    public function update(Request $request, Departamento $departamento)
    {
        $request->validate([
            'nombre' => 'required',
            'ubigeo'=> 'required',
            'estado' => 'required'
        ]);

        $departamento->update($request->all());

        return redirect()->route('admin.departamentos.index')->with('info', 'El registro se actualizó con éxito');
    }

    public function destroy(Departamento $departamento)
    {
        $departamento->delete();

        return redirect()->route('admin.departamentos.index')->with('info', 'El departamento se eliminó con éxito');
    }
}
