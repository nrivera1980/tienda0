<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Canal;

class CanalController extends Controller
{
    public function index()
    {
        $canales = Canal::all();

        return view('admin.canals.index', compact('canales'));
    }

    public function create()
    {
        return view('admin.canals.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $canal = Canal::create($request->all());

        return redirect()->route('admin.canals.index')->with('info', 'El canal se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Canal $canal)
    {
        return view('admin.canals.edit', compact('canal'));
    }

    public function update(Request $request, Canal $canal)
    {
        $request->validate([
            'nombre' => "required",
            'estado' => 'required'
        ]);

        $canal->update($request->all());

        return redirect()->route('admin.canals.index')->with('info', 'El canal se actualizó con éxito');
    }

    public function destroy(Canal $canal)
    {
        $canal->delete();

        return redirect()->route('admin.canals.index')->with('info', 'El canal se eliminó con éxito');
    }
}
