<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    use HasFactory;
    protected $table = "empresas";
    protected $fillable = ['id', 'razon', 'direccion', 'telefono', 'email', 'nosotros', 'preguntas', 'terminos', 'politicas', 'baselegales'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function tiendas()
    {
        return $this->hasMany(Tienda::class);
    }
}
