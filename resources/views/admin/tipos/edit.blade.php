@extends('adminlte::page')

@section('title_prefix', 'TIPO DE PRENDAS: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar tipo de prendas</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($tipo, ['route' => ['admin.tipos.update', $tipo], 'autocomplete' => 'off', 'files' => true, 'method' => 'put']) !!}

            <div class="form-group">
                {{ Form::label('nombre', 'Nombre') }}
                {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del tipo de prenda', 'autofocus']) }}
                @error('nombre')
                    <span class="text-danger">{{$message}}</span>
                @enderror
            </div>
            <div class="form-group">
                {!! Form::label('descripcion', 'Descripción') !!}
                {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion del tipo de prenda']) !!}
                @error('descripcion')
                    <span class="text-danger">{{$message}}</span>
                @enderror
            </div>
            <div class="row mb-3">
                <div class="col">
                    <div class="image-wrapper">
                        @if ($tipo->imagen)
                            <img id="picture" src="{{Storage::url($tipo->imagen)}}">
                        @else
                            <img id="picture" src="https://cdn.pixabay.com/photo/2021/06/28/10/15/coffee-6371149_960_720.jpg">
                        @endif
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        {!! Form::label('imagen', 'Imagen de la guia de tallas') !!}
                        {!! Form::file('imagen', ['class' => 'form-control-file', 'accept' => 'image/*']) !!}
                        @error('imagen')
                            <span class="text-danger">{{$message}}</span>
                        @enderror
                    </div>
                    <span style="color: #f83636">Importante:</span> Esta imagen es la que ayudara al cliente en elegir una prenda de vestir segun las medidas exactas, la imagen debera ser un aproximado de 700 px de ancho y 635 px de alto.
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('estado', 'Estado') !!}
                {!! Form::select('estado', ['1' => 'ACTIVO', '0' => 'INACTIVO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                @error('estado')
                    <span class="text-danger">{{$message}}</span>
                @enderror
            </div>

                <div class="form-group">
                    {!! form::submit('Actualizar tipo de prenda', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.tipos.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
@section('css')
    <style>
        .image-wrapper{
            position: relative;
            padding-bottom: 56.25%;
        }

        .image-wrapper img{
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