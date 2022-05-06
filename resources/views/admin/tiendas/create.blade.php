@extends('adminlte::page')

@section('title_prefix', 'TIENDA: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear tienda</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.tiendas.store', 'autocomplete' => 'off', 'files' => true]) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre de la tienda') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre de la tienda', 'autofocus']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('empresa', 'Razón Social') }}
                    {{ Form::text('empresa', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la razon social']) }}
                    @error('empresa')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('ruc', 'RUC') }}
                    {{ Form::text('ruc', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el RUC']) }}
                    @error('ruc')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('direccion', 'Dirección') }}
                    {{ Form::text('direccion', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la direccion']) }}
                    @error('direccion')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('urldireccion', 'Ubicación en google maps') }}
                    {{ Form::text('urldireccion', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la ubiación en google maps']) }}
                    @error('urldireccion')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('detalle', 'Detalle (opcional)') }}
                    {!! Form::textarea('detalle', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese un detalle']) !!}
                    @error('detalle')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            <img id="picture" src="https://cdn.pixabay.com/photo/2021/06/28/10/15/coffee-6371149_960_720.jpg" alt="">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('imagen', 'Imagen que se mostrará en la tienda') !!}
                            {!! Form::file('imagen', ['class' => 'form-control-file textoBase', 'accept' => 'image/*']) !!}
                            @error('imagen')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                        <span style="color: #f83636">Importante:</span> Antes de subir la imagen, debera de renombrar a la imagen con un nombre enumerado, por ejemplo: " 1.jpg o 1.png", ademas solo puede albergar cinco imagenes como maximo y las dimensiones de la imagen a subir debera de ser como minimo de 1583 pixeles de ancho y 530 pixeles de alto.
                    </div>
                </div>
                
                <div class="row mb-3">
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('estado', 'Estado') !!}
                            {!! Form::select('estado', ['1' => 'ACTIVO', '0' => 'INACTIVO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                            @error('estado')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {{ Form::label('telefono', 'Teléfono') }}
                            {{ Form::text('telefono', null, ['class' => 'form-control', 'placeholder' => 'Ingrese telefono']) }}
                            @error('telefono')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    {!! Form::label('empresas_id', 'Empresa') !!}
                    {!! Form::select('empresas_id', $select, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('empresas_id')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! form::submit('Crear tienda', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.tiendas.index')}}">Cancelar</a>
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
    
    </script>
@stop