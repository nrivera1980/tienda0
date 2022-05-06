<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reclamo extends Model
{
    use HasFactory;

    protected $table = "reclamos";
    protected $fillable = ['fecha', 'hora', 'documento', 'cliente', 'domicilio', 'email', 'celular', 'telefono', 'menor', 'docpadre', 'numpadre', 'padre', 'emailpadre', 'telefonopadre', 'bien', 'fechapedido', 'detalle', 'importe', 'pedido', 'estado', 'responsable', 'fecharspta', 'distritos_id', 'canals_id', 'conceptos_id', 'tiendas_id', 'documentos_id', 'ano'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function tienda()
    {
        return $this->belongsTo(Tienda::class, 'tiendas_id');
    }

    public function tipodocumento()
    {
        return $this->belongsTo(Documento::class, 'documentos_id');
    }

    public function distrito()
    {
        return $this->belongsTo(Distrito::class, 'distritos_id');
    }

    public function concepto()
    {
        return $this->belongsTo(Concepto::class, 'conceptos_id');
    }

    public function canal()
    {
        return $this->belongsTo(Canal::class, 'canals_id');
    }

    public function respuestas()
    {
        return $this->hasMany(Respuesta::class);
    }
}
