<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Publicidad;

use Illuminate\Support\Facades\Storage;

class PublicidadController extends Controller
{
    public function index()
    {
        $publicidades = Publicidad::all();

        return view('admin.publicidads.index', compact('publicidades'));
    }

    public function create()
    {
        return view('admin.publicidads.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'superior' => 'required|image|nullable|max:2048',
            'urlsuperior' => 'required',
            'slider' => 'required|image|nullable|max:2048',
            'urlslider' => 'required',
            'estado' => 'required'
        ]);

        if($request->file('superior')){

            $name = $request->file('superior')->getClientOriginalName();

            $url = Storage::putFileAs('public/publicidad', $request->file('superior'), $name);

        }

        if($request->file('slider')){

            $namedos = $request->file('slider')->getClientOriginalName();

            $urldos = Storage::putFileAs('public/publicidad', $request->file('slider'), $namedos);

        }

        Publicidad::create([
            'nombre' => $request->nombre,
            'superior' => $url,
            'urlsuperior' => $request->urlsuperior,
            'slider' => $urldos,
            'urlslider' => $request->urlslider,
            'estado' => $request->estado
        ]);

        return redirect()->route('admin.publicidads.index')->with('info', 'La publicidad se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Publicidad $publicidad)
    {
        return view('admin.publicidads.edit', compact('publicidad'));
    }

    public function update(Request $request, Publicidad $publicidad)
    {
        $request->validate([
            'nombre' => 'required',
            'superior' => 'required|image|nullable|max:2048',
            'urlsuperior' => 'required',
            'slider' => 'required|image|nullable|max:2048',
            'urlslider' => 'required',
            'estado' => 'required'
        ]);

        if($request->file('superior')){

            $name = $request->file('superior')->getClientOriginalName();

            $url = Storage::putFileAs('public/publicidad', $request->file('superior'), $name);

        }

        if($request->file('slider')){

            $namedos = $request->file('slider')->getClientOriginalName();

            $urldos = Storage::putFileAs('public/publicidad', $request->file('slider'), $namedos);

        }

        $publicidad->update($request->all());

        return redirect()->route('admin.publicidads.index')->with('info', 'El registro se actualizó con éxito');
    }

    public function destroy(Publicidad $publicidad)
    {
        $publicidad->delete();

        return redirect()->route('admin.publicidads.index')->with('info', 'La publicidad se eliminó con éxito');
    }
}
