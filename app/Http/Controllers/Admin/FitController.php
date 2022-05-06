<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Fit;

class FitController extends Controller
{
    public function index()
    {
        $fits = Fit::all();

        return view('admin.fits.index', compact('fits'));
    }

    public function create()
    {
        return view('admin.fits.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $fit = Fit::create($request->all());

        return redirect()->route('admin.fits.index')->with('info', 'El fit se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Fit $fit)
    {
        return view('admin.fits.edit', compact('fit'));
    }

    public function update(Request $request, Fit $fit)
    {
        $request->validate([
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $fit->update($request->all());

        return redirect()->route('admin.fits.index')->with('info', 'El fit se actualizó con éxito');
    }

    public function destroy(Fit $fit)
    {
        $fit->delete();

        return redirect()->route('admin.fits.index')->with('info', 'El fit se eliminó con éxito');
    }
}
