<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tienda;
use App\Models\Empresa;

use Illuminate\Support\Facades\Storage;

class TiendaController extends Controller
{
    public function index()
    {
        $tiendas = Tienda::all();

        return view('admin.tiendas.index', compact('tiendas'));
    }

    public function create()
    {
        $empresas = Empresa::all();
        $select = $empresas->pluck('razon', 'id');
        return view('admin.tiendas.create', compact('select'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'empresa' => 'required|min:3',
            'ruc' => 'required|size:11',
            'direccion' => 'required',
            'urldireccion' => 'required',
            'telefono' => 'required|min:6|max:9',
            'estado' => 'required',
            'empresas_id' => 'required'
        ]);

        if($request->file('imagen')){

            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/tiendas', $request->file('imagen'), $name);

            Tienda::create([
                'imagen' => $url,
                'nombre' => $request->nombre,
                'empresa' => $request->empresa,
                'estado' => $request->estado,
                'empresas_id' => $request->empresas_id,
                'ruc' => $request->ruc,
                'telefono' => $request->telefono,
                'urldireccion' => $request->urldireccion,
                'direccion' => $request->direccion,
                'detalle' => $request->detalle
            ]);
        }

        return redirect()->route('admin.tiendas.index')->with('info', 'La tienda se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Tienda $tienda)
    {
        $empresas = Empresa::all();
        $select = $empresas->pluck('razon', 'id');
        return view('admin.tiendas.edit', compact('tienda', 'select'));
    }

    public function update(Request $request, Tienda $tienda)
    {
        $request->validate([
            'nombre' => "required",
            'empresa' => 'required',
            'ruc' => 'required|size:11',
            'direccion' => 'required',
            'urldireccion' => 'required',
            'telefono' => 'required|min:6|max:9',
            'estado' => 'required',
            'empresas_id' => 'required'
        ]);

        $urlpasado = $tienda->imagen;

        $tienda->update($request->all());
        
        if($request->file('imagen')){
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/tiendas', $request->file('imagen'), $name);

            if($urlpasado){
                Storage::delete($urlpasado);
            }

            $tienda->update([
                'imagen' => $url
            ]);
        }

        return redirect()->route('admin.tiendas.index')->with('info', 'La tienda se actualizó con éxito');
    }

    public function destroy(Tienda $tienda)
    {
        $tienda->delete();

        return redirect()->route('admin.tiendas.index')->with('info', 'La tienda se eliminó con éxito');
    }
}
