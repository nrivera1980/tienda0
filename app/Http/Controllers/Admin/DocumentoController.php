<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Documento;

class DocumentoController extends Controller
{
    public function index()
    {
        $documentos = Documento::all();

        return view('admin.documentos.index', compact('documentos'));
    }

    public function create()
    {
        return view('admin.documentos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'id' => 'required|unique:documentos',
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $concepto = Documento::create($request->all());

        return redirect()->route('admin.conceptos.index', $concepto)->with('info', 'El concepto se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Documento $documento)
    {
        return view('admin.documentos.edit', compact('documento'));
    }

    public function update(Request $request, Documento $documento)
    {
        $request->validate([
            'id' => 'required|unique:documentos,id,$documento->id',
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $documento->update($request->all());

        return redirect()->route('admin.documentos.index')->with('info', 'El registro se actualizó con éxito');
    }

    public function destroy(Documento $documento)
    {
        $documento->delete();

        return redirect()->route('admin.documentos.index')->with('info', 'El documento se eliminó con éxito');
    }
}
