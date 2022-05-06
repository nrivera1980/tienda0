<div class="d-inline">
    <div class="form-group">
        {!! Form::label('departamentos_id', 'Departamento') !!}
        {!! Form::select('departamentos_id', $departamentos, null, ['wire:model' => 'departamentos_id', 'class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
        @error('departamentos_id')
            <span class="text-danger">{{$message}}</span>
        @enderror
    </div>
    <div class="form-group">
        {!! Form::label('provincias_id', 'Provincias') !!}
        {!! Form::select('provincias_id', $provincias, null, ['wire:model' => 'provincias_id', 'class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
        @error('provincias_id')
            <span class="text-danger">{{$message}}</span>
        @enderror
    </div>
    {{-- @if (!is_null($provincias))
        <div class="form-group">
            {!! Form::label('provincias_id', 'Provincias') !!}
            {!! Form::select('provincias_id', $provincias, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
            @error('provincias_id')
                <span class="text-danger">{{$message}}</span>
            @enderror
        </div>
    @else
        <div class="form-group">
            {!! Form::label('provincias_id', 'Provincias') !!}
            {!! Form::select('provincias_id', $provincias, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
            @error('provincias_id')
                <span class="text-danger">{{$message}}</span>
            @enderror
        </div>
    @endif --}}
    
</div>
