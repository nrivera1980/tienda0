<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Baner extends Model
{
    use HasFactory;

    protected $table = "baners";
    protected $fillable = ['titulo', 'posicion', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function detallebaners()
    {
        return $this->hasMany(Detallebaner::class, 'baners_id');
    }
}
