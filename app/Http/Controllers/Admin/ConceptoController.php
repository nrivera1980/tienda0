<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Concepto;

class ConceptoController extends Controller
{
    public function index()
    {
        $conceptos = Concepto::all();

        return view('admin.conceptos.index', compact('conceptos'));
    }

    public function create()
    {
        return view('admin.conceptos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'tipo' => 'required',
            'estado' => 'required'
        ]);

        $concepto = Concepto::create($request->all());

        return redirect()->route('admin.conceptos.index', $concepto)->with('info', 'El concepto se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Concepto $concepto)
    {
        return view('admin.conceptos.edit', compact('concepto'));
    }

    public function update(Request $request, Concepto $concepto)
    {
        $request->validate([
            'nombre' => "required",
            'tipo' => 'required',
            'estado' => 'required'
        ]);

        $concepto->update($request->all());

        return redirect()->route('admin.conceptos.index', $concepto)->with('info', 'El concepto se actualizó con éxito');
    }

    public function destroy(Concepto $concepto)
    {
        $concepto->delete();

        return redirect()->route('admin.conceptos.index')->with('info', 'El concepto se eliminó con éxito');
    }
}
