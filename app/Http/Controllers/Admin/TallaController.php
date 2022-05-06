<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Talla;

class TallaController extends Controller
{
    public function index()
    {
        $tallas = Talla::all();

        return view('admin.tallas.index', compact('tallas'));
    }

    public function create()
    {
        return view('admin.tallas.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $talla = Talla::create($request->all());

        return redirect()->route('admin.tallas.index')->with('info', 'La talla se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Talla $talla)
    {
        return view('admin.tallas.edit', compact('talla'));
    }

    public function update(Request $request, Talla $talla)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $talla->update($request->all());

        return redirect()->route('admin.tallas.index')->with('info', 'La talla se actualizó con éxito');
    }

    public function destroy(Talla $talla)
    {
        $talla->delete();

        return redirect()->route('admin.tallas.index')->with('info', 'La talla se eliminó con éxito');
    }
}
