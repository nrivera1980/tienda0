@extends('adminlte::page')

@section('title_prefix', 'DISTRITOS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear distrito</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.distritos.store']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del distrito', 'required' => 'required', 'autofocus']) }}
                    @error('nombre')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {{ Form::label('ubigeo', 'Ubigeo') }}
                    {{ Form::text('ubigeo', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el ubigeo del distrito']) }}
                    @error('ubigeo')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                @livewire('show-dpto')

                <div class="form-group">
                    {!! Form::label('estado', 'Estado') !!}
                    {!! Form::select('estado', ['1' => 'ACTIVO', '0' => 'INACTIVO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('estado')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! form::submit('Crear distrito', ['class' => 'btn btn-primary']) !!}
                    <a class="btn btn-danger" href="{{route('admin.distritos.index')}}">Cancelar</a>
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
