<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Canal extends Model
{
    use HasFactory;

    protected $table = "canals";
    protected $fillable = ['nombre', 'descripcion', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function reclamos()
    {
        return $this->hasMany(Reclamo::class);
    }
}
