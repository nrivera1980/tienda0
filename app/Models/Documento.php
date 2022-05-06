<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Documento extends Model
{
    use HasFactory;

    protected $table = "documentos";
    protected $fillable = ['id', 'nombre', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function reclamos()
    {
        return $this->hasMany(Reclamo::class);
    }
}
