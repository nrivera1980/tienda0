@extends('adminlte::page')

@section('title_prefix', 'CANALES: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar canal</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($canal, ['route' => ['admin.canals.update', $canal], 'method' => 'put']) !!}

            <div class="form-group">
                {{ Form::label('nombre', 'Nombre') }}
                {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del canal', 'autofocus']) }}
                @error('nombre')
                    <span class="text-danger">{{$message}}</span>
                @enderror
            </div>
            <div class="form-group">
                {!! Form::label('descripcion', 'Descripción') !!}
                {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion del canal']) !!}
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
                    {!! form::submit('Actualizar canal', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.canals.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
