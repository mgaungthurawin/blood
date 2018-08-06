<div class="form-group col-sm-6">
    {!! Form::label('group', 'Blood Group:') !!} <span class="text-danger">*</span>
    <select class="form-control" name="blood_id">
        @foreach($blood as $b)
            <option value="{{$b->id}}">{{ $b->group }}</option>
        @endforeach
    </select>
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

<div class="form-group col-sm-6">
    {!! Form::label('location_id', 'Location:') !!} <span class="text-danger">*</span>
    <select id="location_id" name="location_id" class="form-control">
        @foreach($locations as $location)
            <option value="{{$location->id}}">{{$location->name}}</option>
        @endforeach
    </select>
</div>