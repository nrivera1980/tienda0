@extends('adminlte::page')

@section('title_prefix', 'PROVINCIAS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear provincia</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.provincias.store']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre de la provincia', 'autofocus']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {{ Form::label('ubigeo', 'Ubigeo') }}
                    {{ Form::text('ubigeo', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el ubigeo de la provincia']) }}
                    @error('ubigeo')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('departamentos_id', 'Departamento') !!}
                    {!! Form::select('departamentos_id', $select, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('departamentos_id')
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
                    {!! form::submit('Crear provincia', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.provincias.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
