<div class="form-group col-sm-6">
    {!! Form::label('group', 'Blood Group:') !!} <span class="text-danger">*</span>
    {!! Form::text('group', null, ['class' => 'form-control']) !!}
    @if ($errors->has('group'))
        <span class="text-danger">
            <strong>{{ $errors->first('group') }}</strong>
        </span>
    @endif
</div>

<div class="form-group col-sm-6">
    {!! Form::label('type', 'Blood Type:') !!} <span class="text-danger">*</span>
    {!! Form::text('type', null, ['class' => 'form-control']) !!}
    @if ($errors->has('type'))
        <span class="text-danger">
            <strong>{{ $errors->first('type') }}</strong>
        </span>
    @endif
</div>

<div class="form-group col-sm-6">
    {!! Form::label('quantity', 'Quantity:') !!} <span class="text-danger">*</span>
    {!! Form::number('quantity', null, ['class' => 'form-control', "min" => 1, "step" => 1]) !!}
    @if ($errors->has('quantity'))
        <span class="text-danger">
            <strong>{{ $errors->first('quantity') }}</strong>
        </span>
    @endif
</div>