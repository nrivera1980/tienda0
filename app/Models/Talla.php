<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Talla extends Model
{
    use HasFactory;

    protected $table = "tallas";
    protected $fillable = ['nombre', 'descripcion', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function productos()
    {
        return $this->belongsToManyMany(Producto::class, 'productos_id');
    }

}
