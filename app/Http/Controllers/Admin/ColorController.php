<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Color;

class ColorController extends Controller
{
    public function index()
    {
        $colores = Color::all();

        return view('admin.colors.index', compact('colores'));
    }

    public function create()
    {
        return view('admin.colors.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $color = Color::create($request->all());

        return redirect()->route('admin.colors.index')->with('info', 'El color se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Color $color)
    {
        return view('admin.colors.edit', compact('color'));
    }

    public function update(Request $request, Color $color)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $color->update($request->all());

        return redirect()->route('admin.colors.index')->with('info', 'El color se actualizó con éxito');
    }

    public function destroy(Color $color)
    {
        $color->delete();

        return redirect()->route('admin.colors.index')->with('info', 'El color se eliminó con éxito');
    }
}
