@extends('adminlte::page')

@section('title_prefix', 'TIPOS DE PRENDA | ')

@section('Plugins.Sweetalert2')

@section('content_header')
    <h1>Lista de tipos de prenda</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-header">
            <a class="btn btn-success" href="{{route('admin.tipos.create')}}">Agregar tipos de prenda</a>
        </div>
        <div class="card-body">
            <table class="table table-striped table-bordered" style="width:100%" id="tipos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>GUIAS</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($tipos as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->nombre}}</td>
                            <td>{{$item->imagen}}</td>
                            <td>{{($item->estado == '1') ? 'ACTIVO' : 'INACTIVO'}}</td>
                            <td width="10px">
                                <div class="row justify-content-center">
                                    <div style="margin-right: 3px">
                                        <a class="btn btn-primary btn-sm" href="{{route('admin.tipos.edit', $item)}}" title="Editar"><i class="fa fa-edit"></i></a>
                                    </div>
                                    <div>
                                        <form action="{{route('admin.tipos.destroy', $item)}}" method="POST">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-danger btn-sm" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@stop
@section('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css">
@endsection
@section('js')
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.0/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#tipos').DataTable({
            responsive: true,
            "language": {
                "lengthMenu": "Mostrar _MENU_ registros por p??gina",
                "zeroRecords": "Nada encontrado - disculpa",
                "info": "Mostrando la p??gina _PAGE_ de _PAGES_",
                "infoEmpty": "No hay registros disponibles",
                "infoFiltered": "(filtrado de from _MAX_ registros totales)",
                'search': 'Buscar:',
                'paginate': {
                    'next': 'Siguiente',
                    'previous': 'Anterior'
                }
            }
        });
    </script>
@endsection