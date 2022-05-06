<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Rapida;

use Illuminate\Support\Facades\Storage;

class RapidaController extends Controller
{
    public function index()
    {
        $rapidas = Rapida::all();

        return view('admin.rapidas.index', compact('rapidas'));
    }

    public function create()
    {
        return view('admin.rapidas.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'img' => 'required|image|nullable|max:2048',
            'url' => 'required',
            'estado' => 'required'
        ]);

        if($request->file('img')){

            $name = $request->file('img')->getClientOriginalName();

            $url = Storage::putFileAs('public/rapidas', $request->file('img'), $name);

            Rapida::create([
                'img' => $url,
                'url' => $request->url,
                'estado' => $request->estado
            ]);
        }

        return redirect()->route('admin.rapidas.index')->with('info', 'El enlace rapido se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Rapida $rapida)
    {
        return view('admin.rapidas.edit', compact('rapida'));
    }

    public function update(Request $request, Rapida $rapida)
    {
        $request->validate([
            'img' => 'required|image|nullable|max:2048',
            'url' => 'required',
            'estado' => 'required'
        ]);

        $rapida->update($request->all());

        return redirect()->route('admin.rapidas.index')->with('info', 'El enlace rapido se actualizó con éxito');
    }

    public function destroy(Rapida $rapida)
    {
        $rapida->delete();

        return redirect()->route('admin.rapidas.index')->with('info', 'El enlace rapido se eliminó con éxito');
    }
}
