<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;

    protected $table = "sliders";
    protected $fillable = ['imagen', 'mensaje', 'boton', 'enlace', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;
}
