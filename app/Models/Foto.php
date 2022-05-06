<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Foto extends Model
{
    use HasFactory;
    
    protected $table = "fotos";
    protected $fillable = ['ruta', 'estado', 'productos_id'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'productos_id');
    }
}
