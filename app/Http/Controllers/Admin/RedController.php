<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Red;

class RedController extends Controller
{
    public function index()
    {
        $redes = Red::all();

        return view('admin.reds.index', compact('redes'));
    }

    public function create()
    {
        return view('admin.reds.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'ruta' => 'required',
            'estado' => 'required'
        ]);

        $red = Red::create($request->all());

        return redirect()->route('admin.reds.index', $red)->with('info', 'La red social se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Red $red)
    {
        return view('admin.reds.edit', compact('red'));
    }

    public function update(Request $request, Red $red)
    {
        $request->validate([
            'nombre' => 'required',
            'ruta' => 'required',
            'estado' => 'required'
        ]);

        $red->update($request->all());

        return redirect()->route('admin.reds.index')->with('info', 'El registro se actualizó con éxito');
    }

    public function destroy(Red $red)
    {
        $red->delete();

        return redirect()->route('admin.reds.index')->with('info', 'La red social se eliminó con éxito');
    }
}
