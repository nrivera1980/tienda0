<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Reclamo;

use App\Mail\ReclamacionesMailable;
use Illuminate\Support\Facades\Mail;

class LibroController extends Controller
{
    public function index()
    {
        return view('reclamos');
    }

    public function create()
    {
        return view('reclamos');
    }

    public function store(Request $request)
    {
        $libro = new Reclamo();

        $libro->fecha = $request->fecharegistro;
        $libro->hora = $request->horaregistro;
        $libro->documento = $request->documento;
        $libro->cliente = $request->cliente;
        $libro->domicilio = $request->domicilio;
        $libro->email = $request->email;
        $libro->celular = $request->celular;
        $libro->telefono = $request->telefono;
        $libro->menor = $request->menor;
        $libro->docpadre = $request->tipodocumentoapoderado;
        $libro->numpadre = $request->documentoapoderado;
        $libro->padre = $request->apoderado;
        $libro->emailpadre = $request->emailapoderado;
        $libro->telefonopadre = $request->telefonoapoderado;
        $libro->bien = $request->tipobien;
        $libro->fechapedido = $request->fecha;
        $libro->detalle = $request->reclamo;
        $libro->importe = $request->monto;
        $libro->pedido = $request->pedidocliente;
        $libro->estado = 'I';
        $libro->distritos_id = $request->distrito;
        $libro->canals_id = $request->canal;
        $libro->conceptos_id = $request->detalle;
        $libro->tiendas_id = $request->tienda;
        $libro->documentos_id = $request->tipodocumento;
        $libro->ano = date('Y');

        $libro->save();

        $correo = new ReclamacionesMailable($libro);

        Mail::to($request->email)->cc('informes@sysapp.dev')->send($correo);

        return redirect()->route('reclamos.show', $libro);
    }

    public function show($id)
    {
        $libro = Reclamo::find($id);

        return view('confirmacion', compact('libro'));
    }

    public function edit(Reclamo $libro)
    {
        //
    }

    public function update(Request $request, Reclamo $libro)
    {
        //
    }

    public function destroy(Reclamo $libro)
    {
        //
    }
}
