@extends('adminlte::page')

@section('title_prefix', 'PRODUCTOS: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar producto</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($producto, ['route' => ['admin.productos.update', $producto], 'autocomplete' => 'off', 'files' => true, 'method' => 'put']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre del producto') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del producto']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('sku', 'Código SKU') }}
                    {{ Form::text('sku', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el SKU del producto']) }}
                    @error('sku')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('breve', 'Breve descripción') }}
                    {{ Form::text('breve', null, ['class' => 'form-control', 'placeholder' => 'Ingrese breve descripción del producto']) }}
                    @error('breve')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('precio', 'Precio del producto') }}
                    {{ Form::number('precio', null, ['class' => 'form-control', 'pattern' => '/^\d+\.\d{0,2}$/', 'min' => '0', 'step' => '0.01', 'style' => 'text-align:right', 'placeholder' => 'Ingrese el precio del producto']) }}
                    @error('precio')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('descripcion', 'Descripción') !!}
                    {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion del producto']) !!}
                    @error('descripcion')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('detalles', 'Detalles') !!}
                    {!! Form::textarea('detalles', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese detalles del producto']) !!}
                    @error('detalles')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            @if ($producto->imagen)
                                <img id="picture" src="{{Storage::url($producto->imagen)}}">
                            @else
                                <img id="picture" src="https://cdn.pixabay.com/photo/2016/09/30/21/29/web-site-1706400_960_720.png">
                            @endif
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('imagen', 'Imagen que representa al producto') !!}
                            {!! Form::file('imagen', ['class' => 'form-control-file textoBase', 'accept' => 'image/*']) !!}
                            @error('imagen')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                        <span style="color: #f83636">Importante:</span> las imagenes deberan tener un promedio de 1000px de ancho y 1248px de alto, con la finalidad de mostrar todo los detalles del producto.
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('categorias_id', 'Categoria') !!}
                            {!! Form::select('categorias_id', $select, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('categorias_id')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('colors_id', 'Color') !!}
                            {!! Form::select('colors_id', $selectCol, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('colors_id')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('tipos_id', 'Tipo de prenda') !!}
                            {!! Form::select('tipos_id', $selectTip, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('tipos_id')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('tallas_id', 'Talla') !!}
                            {!! Form::select('tallas_id', $selectTal, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('tallas_id')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('fits_id', 'Tipo de prenda') !!}
                            {!! Form::select('fits_id', $selectFit, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('fits_id')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('marcas_id', 'Marca') !!}
                            {!! Form::select('marcas_id', $selectMar, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('marcas_id')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                </div>
    
                <div class="form-group">
                    {{ Form::label('facebook', 'Url de facebook') }}
                    {{ Form::text('facebook', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la url de facebook']) }}
                    @error('facebook')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('compartir', 'Url de compartir') }}
                    {{ Form::text('compartir', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la url de compartir']) }}
                    @error('compartir')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                
                <div class="form-group">
                    {!! Form::label('estado', 'Estado') !!}
                    {!! Form::select('estado', ['1' => 'ACTIVO', '0' => 'INACTIVO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('estado')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! form::submit('Actualizar producto', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.productos.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
@section('css')
    <style>
        .image-wrapper {
            position: relative;
            padding-bottom: 56.25%;
        }

        .image-wrapper img {
            position: absolute;
            object-fit: cover;
            width: 100%;
            height: 100%;
        }

    </style>
@stop

@section('js')
    <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script>

    <script>

        document.getElementById("imagen").addEventListener('change', cambiarImagen);

        function cambiarImagen(event){
            var file = event.target.files[0];

            var reader = new FileReader();
            reader.onload = (event) => {
                document.getElementById("picture").setAttribute('src', event.target.result);
            };

            reader.readAsDataURL(file);
        }

        CKEDITOR.replace( 'descripcion' );

        CKEDITOR.replace( 'detalles' );

    </script>
@endsection