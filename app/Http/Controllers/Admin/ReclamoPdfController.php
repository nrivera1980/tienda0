<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Reclamo;
use Barryvdh\DomPDF\Facade as PDF;

class ReclamoPdfController extends Controller
{
    public function getReclamo($id)
    {
        $reclamo = Reclamo::where('id', $id)->with('respuestas')->get();
        return view('admin.pdf.reclamo', compact('reclamo'));
    }
    public function downloadPDF($id)
    {
        $reclamo = Reclamo::where('id', $id)->with('respuestas')->get();
        $nombre = 'reclamo-'.$reclamo[0]->ano.'WEB-'.$reclamo[0]->id.'.pdf';
        $pdf = PDF::loadView('admin.pdf.reclamo', compact('reclamo'));
        return $pdf->stream($nombre);
    }
}
