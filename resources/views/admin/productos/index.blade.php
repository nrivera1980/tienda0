@extends('adminlte::page')

@section('title_prefix', 'PRODUCTOS | ')

@section('Plugins.Sweetalert2')

@section('content_header')
    <h1>Lista de productos</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-header">
            <a class="btn btn-success" href="{{route('admin.productos.create')}}">Agregar productos</a>
        </div>
        <div class="card-body">
            <table class="table table-striped table-bordered" style="width:100%" id="productos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>SKU</th>
                        <th>NOMBRE</th>
                        <th>DESCRIPCION BREVE</th>
                        <th>PRECIO</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($productos as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{!!$item->sku!!}</td>
                            <td>{{$item->nombre}}</td>
                            <td>{!!$item->breve!!}</td>
                            <td style="text-align:right;">{!! number_format($item->precio, 2, '.', ',') !!}</td>
                            <td>{{($item->estado == '1') ? 'ACTIVO' : 'INACTIVO'}}</td>
                            <td>
                                <div class="row justify-content-center">
                                    <div style="margin-right:5px"><a class="btn btn-success btn-sm" href="" title="Administrar fotos"><i class="fas fa-camera"></i></a></div>
                                    <div style="margin-right:5px"><a class="btn btn-primary btn-sm" href="{{route('admin.productos.edit', $item)}}" title="Editar"><i class="fa fa-edit"></i></a></div>
                                    <div>
                                        <form action="{{route('admin.productos.destroy', $item)}}" method="POST">
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
        $('#productos').DataTable({
            responsive: true,
            "language": {
                "lengthMenu": "Mostrar _MENU_ registros por página",
                "zeroRecords": "Nada encontrado - disculpa",
                "info": "Mostrando la página _PAGE_ de _PAGES_",
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