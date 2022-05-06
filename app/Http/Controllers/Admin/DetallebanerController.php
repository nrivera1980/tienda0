<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Detallebaner;
use App\Models\baner;

use Illuminate\Support\Facades\Storage;

class DetallebanerController extends Controller
{
    public function index()
    {
        $detallebaners = Detallebaner::all();

        return view('admin.detallebaners.index', compact('detallebaners'));
    }

    public function create()
    {
        $baners = Baner::all();
        $select = $baners->pluck('titulo', 'id');
        return view('admin.detallebaners.create', compact('select'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'img' => 'required',
            'url' => 'required',
            'estado' => 'required',
            'baners_id' => 'required',
            'ancho' => 'required',
            'alto' => 'required'
        ]);

        if($request->file('img')){

            $name = $request->file('img')->getClientOriginalName();

            $url = Storage::putFileAs('public/baners', $request->file('img'), $name);

            Detallebaner::create([
                'img' => $url,
                'url' => $request->url,
                'estado' => $request->estado,
                'baners_id' => $request->baners_id,
                'ancho' => $request->ancho,
                'alto' => $request->alto
            ]);
        }

        return redirect()->route('admin.detallebaners.index')->with('info', 'El detalle de baner se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Detallebaner $detallebaner)
    {
        $baners = Baner::all();
        $select = $baners->pluck('titulo', 'id');
        return view('admin.detallebaners.edit', compact('detallebaner', 'select'));
    }

    public function update(Request $request, Detallebaner $detallebaner)
    {
        $request->validate([
            'img' => 'image',
            'url' => 'required',
            'estado' => 'required',
            'baners_id' => 'required',
            'ancho' => 'required',
            'alto' => 'required'
        ]);

        $detallebaner->update($request->all());

        return redirect()->route('admin.detallebaners.index')->with('info', 'El detalle de baner se actualizó con éxito');
    }

    public function destroy(Detallebaner $detallebaner)
    {
        $detallebaner->delete();

        return redirect()->route('admin.detallebaners.index')->with('info', 'El detalle de baner se eliminó con éxito');
    }
}
