<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detallebaner extends Model
{
    use HasFactory;

    protected $table = "detallebaners";
    protected $fillable = ['img', 'url', 'estado', 'baners_id', 'ancho', 'alto'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function baner()
    {
        return $this->belongsTo(Baner::class, 'baners_id');
    }
}
