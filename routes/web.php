<?php

use App\Http\Controllers\Admin\LibroController;
use App\Http\Controllers\InicioController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

Route::get('/', [InicioController::class, 'index'])->name('inicio');

Route::get('storage-link', function(){
    Artisan::call('storage:link');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

Route::get('terminos', function () {
    return view('terminos');
})->name('terminos');

Route::get('tiendas', function () {
    return view('tiendas');
})->name('tiendas');

Route::get('nosotros', function () {
    return view('nosotros');
})->name('nosotros');

Route::get('contactanos', function () {
    return view('contactanos');
})->name('contactanos');

Route::get('preguntas-frecuentes', function () {
    return view('preguntas-frecuentes');
})->name('preguntas-frecuentes');

Route::get('terminos-y-condiciones', function () {
    return view('terminos-y-condiciones');
})->name('terminos-y-condiciones');

Route::get('politica-y-proteccion-de-datos', function () {
    return view('politica-y-proteccion-de-datos');
})->name('politica-y-proteccion-de-datos');

Route::get('bases-legales', function () {
    return view('bases-legales');
})->name('bases-legales');

Route::get('catalogo', [InicioController::class, 'catalogo'])->name('catalogo');

Route::get('catalogo/{id}', [InicioController::class, 'categoria'])->name('categoria');

Route::get('catalogo/producto/{prd}', [InicioController::class, 'producto_detalle'])->name('detalle.producto');

Route::get('reclamos', [LibroController::class, 'create'])->name('reclamos');

Route::post('reclamos', [LibroController::class, 'store'])->name('reclamos.store');

Route::get('reclamos/{id}', [LibroController::class, 'show'])->name('reclamos.show');

require __DIR__.'/auth.php';
