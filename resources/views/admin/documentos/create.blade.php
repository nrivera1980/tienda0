@extends('adminlte::page')

@section('title_prefix', 'DOCUMENTOS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear documentos</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.documentos.store']) !!}

                <div class="form-group">
                    {{ Form::label('id', 'Código') }}
                    {{ Form::text('id', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el codigo de documento', 'autofocus']) }}
                    @error('id')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre de documento']) }}
                    @error('nombre')
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
                    {!! form::submit('Crear documento', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.documentos.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
