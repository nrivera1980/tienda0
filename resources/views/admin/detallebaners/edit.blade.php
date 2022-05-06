@extends('adminlte::page')

@section('title_prefix', 'DETALLE DE BANER: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar Detalle de baner</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($detallebaner, ['route' => ['admin.detallebaners.update', $detallebaner], 'autocomplete' => 'off', 'files' => true, 'method' => 'put']) !!}

            <div class="row mb-3">
                <div class="col">
                    <div class="image-wrapper">
                        @if ($detallebaner->img)
                            <img id="picture" src="{{Storage::url($detallebaner->img)}}">
                        @else
                            <img id="picture" src="https://cdn.pixabay.com/photo/2016/09/30/21/29/web-site-1706400_960_720.png">
                        @endif
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        {!! Form::label('img', 'Imagen que se mostrará en la pagina de inicio') !!}
                        {!! Form::file('img', ['class' => 'form-control-file textoBase', 'accept' => 'image/*']) !!}
                        @error('img')
                            <span class="text-danger">{{$message}}</span>
                        @enderror
                    </div>
                    <span style="color: #f83636">Importante:</span> Antes de subir la imagen, debera de renombrar a la imagen con un nombre enumerado, por ejemplo: " 1.jpg o 1.png", ademas solo puede albergar cinco imagenes como maximo y las dimensiones de la imagen a subir debera de ser como minimo de 456 pixeles de ancho y 606 pixeles de alto.
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <div class="form-group">
                        {{ Form::label('ancho', 'Ancho de presentación') }}
                        {{ Form::text('ancho', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el ancho de la imagen']) }}
                        @error('ancho')
                            <span class="text-danger">{{$message}}</span>
                        @enderror
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        {{ Form::label('alto', 'Alto de presentacion') }}
                        {{ Form::text('alto', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el alto de la imagen']) }}
                        @error('alto')
                            <span class="text-danger">{{$message}}</span>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="form-group">
                {{ Form::label('url', 'Url a donde va direccionar') }}
                {{ Form::text('url', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la url']) }}
                @error('url')
                    <span class="text-danger">{{$message}}</span>
                @enderror
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
                        {!! Form::label('baners_id', 'Baner') !!}
                        {!! Form::select('baners_id', $select, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                        @error('baners_id')
                            <span class="text-danger">{{$message}}</span>
                        @enderror
                    </div>
                </div>
            </div>

                <div class="form-group">
                    {!! form::submit('Actualizar Detalle de baner', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.detallebaners.index')}}">Cancelar</a>
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

        document.getElementById("img").addEventListener('change', cambiarImagen);

        function cambiarImagen(event){
            var file = event.target.files[0];

            var reader = new FileReader();
            reader.onload = (event) => {
                document.getElementById("picture").setAttribute('src', event.target.result);
            };

            reader.readAsDataURL(file);
        }

    </script>
@endsection