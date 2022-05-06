@extends('adminlte::page')

@section('title_prefix', 'COLORES: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear colores</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.colors.store']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del color', 'autofocus']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('descripcion', 'Descripción') !!}
                    {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion del color']) !!}
                    @error('descripcion')
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
                    {!! form::submit('Crear color', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.colors.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
