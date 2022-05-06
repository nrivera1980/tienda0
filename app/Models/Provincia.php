<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provincia extends Model
{
    use HasFactory;

    protected $table = "provincias";
    protected $fillable = ['nombre', 'ubigeo', 'estado', 'departamentos_id'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function distritos()
    {
        return $this->hasMany(Distrito::class);
    }
    
    public function Departamento()
    {
        return $this->belongsTo(Departamento::class, 'departamentos_id');
    }
}
