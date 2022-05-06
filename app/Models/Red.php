<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Red extends Model
{
    use HasFactory;

    protected $table = "reds";
    protected $fillable = ['nombre', 'ruta', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;
}
