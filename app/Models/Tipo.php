<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tipo extends Model
{
    use HasFactory;

    protected $table = "tipos";
    protected $fillable = ['nombre', 'descripcion', 'estado', 'imagen'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function productos()
    {
        return $this->hasMany(Producto::class);
    }
}
