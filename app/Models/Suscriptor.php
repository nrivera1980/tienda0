<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Suscriptor extends Model
{
    use HasFactory;

    protected $table = "suscriptors";
    protected $fillable = ['email', 'fecnac', 'genero', 'ninos', 'politicaproteccion', 'fecreg'];
    protected $guarded = ['id'];
    public $timestamps = false;
}
