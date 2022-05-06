@extends('adminlte::page')

@section('title_prefix', 'PUBLICIDAD: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar Publicidad</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($publicidad, ['route' => ['admin.publicidads.update', $publicidad], 'autocomplete' => 'off', 'files' => true, 'method' => 'put']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del canal', 'autofocus']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            @if ($publicidad->superior)
                                <img id="picture1" src="{{Storage::url($publicidad->superior)}}">
                            @else
                                <img id="picture1" src="https://cdn.pixabay.com/photo/2016/09/30/21/29/web-site-1706400_960_720.png" alt="">
                            @endif
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('superior', 'Imagen que se mostrará en la pagina de inicio') !!}
                            {!! Form::file('superior', ['class' => 'form-control-file textoBase', 'accept' => 'image/*']) !!}
                            @error('superior')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                        <span style="color: #f83636">Importante:</span> Antes de subir la imagen, debera de renombrar a la imagen con un nombre enumerado, por ejemplo: " 1.jpg o 1.png", ademas solo puede albergar cinco imagenes como maximo y las dimensiones de la imagen a subir debera de ser como minimo de 456 pixeles de ancho y 606 pixeles de alto.
                    </div>
                </div>
                <div class="form-group">
                    {{ Form::label('urlsuperior', 'Url a donde va direccionar') }}
                    {{ Form::text('urlsuperior', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la url']) }}
                    @error('urlsuperior')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            @if ($publicidad->slider)
                                <img id="picture2" src="{{Storage::url($publicidad->slider)}}">
                            @else
                                <img id="picture2" src="https://cdn.pixabay.com/photo/2016/09/30/21/29/web-site-1706400_960_720.png" alt="">
                            @endif
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('slider', 'Imagen que se mostrará en la pagina de inicio') !!}
                            {!! Form::file('slider', ['class' => 'form-control-file textoBase', 'accept' => 'image/*']) !!}
                            @error('slider')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                        <span style="color: #f83636">Importante:</span> Antes de subir la imagen, debera de renombrar a la imagen con un nombre enumerado, por ejemplo: " 1.jpg o 1.png", ademas solo puede albergar cinco imagenes como maximo y las dimensiones de la imagen a subir debera de ser como minimo de 456 pixeles de ancho y 606 pixeles de alto.
                    </div>
                </div>
                <div class="form-group">
                    {{ Form::label('urlslider', 'Url a donde va direccionar') }}
                    {{ Form::text('urlslider', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la url']) }}
                    @error('urlslider')
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
                    {!! form::submit('Actualizar publicidad', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.publicidads.index')}}">Cancelar</a>
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

        document.getElementById("superior").addEventListener('change', cambiarImagen);

        function cambiarImagen(event){
            var file = event.target.files[0];

            var reader = new FileReader();
            reader.onload = (event) => {
                document.getElementById("picture1").setAttribute('src', event.target.result);
            };

            reader.readAsDataURL(file);
        }

    </script>
    <script>

        document.getElementById("slider").addEventListener('change', cambiarImagen2);

        function cambiarImagen2(event){
            var file = event.target.files[0];

            var reader = new FileReader();
            reader.onload = (event) => {
                document.getElementById("picture2").setAttribute('src', event.target.result);
            };

            reader.readAsDataURL(file);
        }

    </script>
@endsection