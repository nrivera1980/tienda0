<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Reclamo;

class ReclamacionesMailable extends Mailable
{
    use Queueable, SerializesModels;

    public $subject = "LA TIENDA : Libro de Reclamaciones";
    public $libro;

    public function __construct(Reclamo $libro)
    {
        $this->libro = $libro;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.confirmacion');
    }
}
