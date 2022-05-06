<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tienda extends Model
{
    use HasFactory;

    protected $table = "tiendas";
    protected $fillable = ['nombre', 'empresa', 'ruc', 'direccion', 'urldireccion', 'telefono', 'estado', 'empresas_id', 'imagen', 'detalle'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'empresas_id');
    }
    
    public function reclamos()
    {
        return $this->hasMany(Reclamo::class);
    }
}
