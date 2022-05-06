@extends('adminlte::page')

@section('title_prefix', 'CATEGORIAS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear Categoria</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.categorias.store']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre de la categoria', 'autofocus']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! Form::label('slug', 'Slug') !!}
                    {!! Form::text('slug', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el slug de la categoria', 'readonly']) !!}
                    @error('slug')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            <img id="picture" src="https://cdn.pixabay.com/photo/2021/06/28/10/15/coffee-6371149_960_720.jpg">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('imagen', 'Imagen que se mostrará en la cabecera del catalogo') !!}
                            {!! Form::file('imagen', ['class' => 'form-control-file', 'accept' => 'image/*']) !!}
                            @error('imagen')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                        <span style="color: #f83636">Importante:</span> Las dimensiones de la imagen a subir debera de ser como minimo de 1920 pixeles de ancho y 320 pixeles de alto, ademas el formato de la imagen se recomeinda que sea PNG.
                    </div>
                </div>

                <div class="form-group">
                    {!! Form::label('descripcion', 'Descripción') !!}
                    {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion de la categoria']) !!}
                    @error('descripcion')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! Form::label('orden', 'Orden') !!}
                    {!! Form::select('orden', ['1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('orden')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                
                <div class="form-group">
                    {!! Form::label('padre', 'Padre ?') !!}
                    {!! Form::select('padre', ['S' => 'SI', 'N' => 'NO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('padre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! Form::label('categorias_id', 'Categoria padre') !!}
                    {!! Form::select('categorias_id', $select, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('categorias_id')
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
                    {!! form::submit('Crear categoria', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.categorias.index')}}">Cancelar</a>
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
    <script src="{{asset('vendor/jQuery-Plugin-stringToSlug-1.3/jquery.stringToSlug.min.js')}}"></script>

    <script>
        $(document).ready( function() {
            $("#nombre").stringToSlug({
                setEvents: 'keyup keydown blur',
                getPut: '#slug',
                space: '-'
            });
        });
    </script>

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
@endsection
