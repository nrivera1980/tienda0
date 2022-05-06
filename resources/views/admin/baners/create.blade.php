@extends('adminlte::page')

@section('title_prefix', 'CANALES: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear baner</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.baners.store']) !!}

                <div class="form-group">
                    {{ Form::label('titulo', 'Titulo') }}
                    {{ Form::text('titulo', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el titulo del baner', 'autofocus']) }}
                    @error('titulo')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    {!! Form::label('posicion', 'Posición') !!}
                    {!! Form::number('posicion', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la posicion del baner']) !!}
                    @error('posicion')
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
                    {!! form::submit('Crear baner', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.baners.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
