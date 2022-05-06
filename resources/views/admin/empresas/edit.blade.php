@extends('adminlte::page')

@section('title_prefix', 'EMPRESAS: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar empresa</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($empresa, ['route' => ['admin.empresas.update', $empresa], 'method' => 'put']) !!}

                <div class="form-group">
                    {{ Form::label('razon', 'Razón social') }}
                    {{ Form::text('razon', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la razón social', 'autofocus']) }}
                    @error('razon')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('direccion', 'Dirección') !!}
                    {!! Form::text('direccion', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la direccion de la empresa']) !!}
                    @error('direccion')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('telefono', 'Teléono') !!}
                    {!! Form::text('telefono', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el telefono de la empresa']) !!}
                    @error('telefono')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('email', 'Correo electrónico') !!}
                    {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el email de la empresa']) !!}
                    @error('email')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('nosotros', 'Nosotros con formato Html') !!}
                    {!! Form::textarea('nosotros', null, ['class' => 'form-control', 'placeholder' => 'Ejemplo: parrafo 1<br> parrafo 2 <p> ...', 'autofocus']) !!}
                    @error('nosotros')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('preguntas', 'Preguntas frecuentes con formato Html') !!}
                    {!! Form::textarea('preguntas', null, ['class' => 'form-control', 'placeholder' => 'Ejemplo: parrafo 1<br> parrafo 2 <p> ...', 'autofocus']) !!}
                    @error('preguntas')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('terminos', 'Términos y condiciones con formato Html') !!}
                    {!! Form::textarea('terminos', null, ['class' => 'form-control', 'placeholder' => 'Ejemplo: parrafo 1<br> parrafo 2 <p> ...', 'autofocus']) !!}
                    @error('terminos')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('politicas', 'Política y proteccion de datos con formato Html') !!}
                    {!! Form::textarea('politicas', null, ['class' => 'form-control', 'placeholder' => 'Ejemplo: parrafo 1<br> parrafo 2 <p> ...', 'autofocus']) !!}
                    @error('politicas')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('baselegales', 'Bases legales con formato Html') !!}
                    {!! Form::textarea('baselegales', null, ['class' => 'form-control', 'placeholder' => 'Ejemplo: parrafo 1<br> parrafo 2 <p> ...', 'autofocus']) !!}
                    @error('baselegales')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! form::submit('Actualizar Empresa', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.empresas.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
@section('js')
    <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script>
    
    <script>
        CKEDITOR.replace( 'nosotros' );
        CKEDITOR.replace( 'preguntas' );
        CKEDITOR.replace( 'terminos' );
        CKEDITOR.replace( 'politicas' );
        CKEDITOR.replace( 'baselegales' );
    </script>
@stop