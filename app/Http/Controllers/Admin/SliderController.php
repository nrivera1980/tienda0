<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;

use Illuminate\Support\Facades\Storage;

class SliderController extends Controller
{
    public function index()
    {
        $sliders = Slider::all();

        return view('admin.sliders.index', compact('sliders'));
    }

    public function create()
    {
        return view('admin.sliders.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'imagen' => 'required|image|nullable|max:2048',
            'estado' => 'required'
        ]);

        if($request->file('imagen')){

            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/slider', $request->file('imagen'), $name);

            Slider::create([
                'imagen' => $url,
                'mensaje' => $request->mensaje,
                'estado' => $request->estado,
                'boton' => $request->boton,
                'enlace' => $request->enlace
            ]);
        }else{
            Slider::create($request->all());
        }

        return redirect()->route('admin.sliders.index')->with('info', 'El Slider se creó con éxito');
    }

    public function show($id)
    {
        //
    }

    public function edit(Slider $slider)
    {
        return view('admin.sliders.edit', compact('slider'));
    }

    public function update(Request $request, Slider $slider)
    {
        $urlpasado = $slider->imagen;

        $slider->update($request->all());
        
        if($request->file('imagen')){
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('public/slider', $request->file('imagen'), $name);

            if($urlpasado){
                Storage::delete($urlpasado);
            }

            $slider->update([
                'imagen' => $url
            ]);
        }

        return redirect()->route('admin.sliders.index')->with('info', 'El Slider se actualizó con éxito');
    }

    public function destroy(Slider $slider)
    {
        Storage::delete($slider->imagen);
        
        $slider->delete();

        return redirect()->route('admin.sliders.index')->with('info', 'El Slider se eliminó con éxito');
    }
}
