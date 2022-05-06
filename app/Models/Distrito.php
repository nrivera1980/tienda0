<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Distrito extends Model
{
    use HasFactory;

    protected $table = "distritos";
    protected $fillable = ['nombre', 'ubigeo', 'estado', 'provincias_id'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function reclamos()
    {
        return $this->hasMany(Reclamo::class);
    }

    public function provincia()
    {
        return $this->belongsTo(Provincia::class, 'provincias_id');
    }
}
