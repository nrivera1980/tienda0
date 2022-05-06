<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $table = "productos";
    protected $fillable = ['sku', 'nombre', 'descripcion', 'detalles', 'estado', 'imagen', 'categorias_id', 'facebook', 'compartir', 'marcas_id', 'tipos_id', 'fits_id', 'colors_id', 'breve', 'precio'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function fotos()
    {
        return $this->hasMany(Foto::class);
    }

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }

    public function categorias()
    {
        return $this->belongsTo(Categoria::class, 'categorias_id');

    }
    
    public function color()
    {
        return $this->belongsTo(Color::class, 'colores_id');

    }

    public function marca()
    {
        return $this->belongsTo(Marca::class, 'marcas_id');

    }

    public function tallas()
    {
        return $this->belongsToMany(Talla::class, 'tallas_id');

    }

    public function tipo()
    {
        return $this->belongsTo(Tipo::class, 'tipos_id');

    }

    public function fit()
    {
        return $this->belongsTo(Fit::class, 'fits_id');

    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'wishes', 'productos_id', 'users_id');
    }

}
