<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Baner;

class BanerController extends Controller
{
    public function index()
    {
        $baners = Baner::all();

        return view('admin.baners.index', compact('baners'));
    }

    public function create()
    {
        return view('admin.baners.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'titulo' => 'required',
            'posicion' => 'required',
            'estado' => 'required'
        ]);

        $baner = Baner::create($request->all());

        return redirect()->route('admin.baners.index')->with('info', 'El baner se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Baner $baner)
    {
        return view('admin.baners.edit', compact('baner'));
    }

    public function update(Request $request, Baner $baner)
    {
        $request->validate([
            'titulo' => 'required',
            'posicion' => 'required',
            'estado' => 'required'
        ]);

        $baner->update($request->all());

        return redirect()->route('admin.baners.index')->with('info', 'El baner se actualizó con éxito');
    }

    public function destroy(Baner $baner)
    {
        $baner->delete();

        return redirect()->route('admin.baners.index')->with('info', 'El baner se eliminó con éxito');
    }
}
