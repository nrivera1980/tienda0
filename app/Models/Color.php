<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    use HasFactory;

    protected $table = "colors";
    protected $fillable = ['nombre', 'descripcion', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function productos()
    {
        return $this->hasMany(Producto::class);
    }
}
