<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publicidad extends Model
{
    use HasFactory;

    protected $table = "publicidads";
    protected $fillable = ['nombre', 'superior', 'urlsuperior', 'slider', 'urlslider', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

}
