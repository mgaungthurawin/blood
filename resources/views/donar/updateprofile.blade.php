@extends('donar.layouts.app')
@section('content')
    <style type="text/css">
        .btn-primary {
            background-color: #a52a2a;
        }

        .btn-primary:hover, .btn-primary:active, .btn-primary.hover {
            background-color: #a52a2a;
        }
    </style>
    <section class="content-header">
        <h1 class="pull-right">
           <a class="btn btn-primary pull-right" href="{{ url('/profile') }}">Back</a>
        </h1>
        <div class="row">
            <div class="pull-left">
                
            </div>
        </div>
    </section>
    <div class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row" style="padding-left: 20px">
                    {!! Form::open(['url' => 'updateprofile', 'files' => 'true']) !!}
                        <div class="col-md-6 form-group">
                            {!! Form::label('name', 'Donar Name:') !!}
                            <input type="text" name="name" class="form-control" value="{!! $user->name !!}">
                        </div>  
                        <div class="col-md-6 form-group">
                            {!! Form::label('dob', 'Date of Birth:') !!}
                            <input type="text" name="dob" class="form-control" value="{!! $donar->dob !!}">
                        </div> 
                        <div class="col-md-6 form-group">
                            {!! Form::label('group', 'Blood Group:') !!}
                            <select name="group" class="form-control">
                                @foreach($bs as $b)
                                    <option value="{{$b->id}}" 
                                    @if($b->id == $bloods->id)
                                    selected
                                    @endif
                                    >{{$b->group}}</option>
                                @endforeach
                            </select>
                            
                        </div>    
                        <div class="col-md-6 form-group">
                            {!! Form::label('type', 'Blood Type:') !!}
                            <select name="type" class="form-control">
                                @foreach($bs as $b)
                                    <option value="{{$b->id}}" 
                                    @if($b->id == $bloods->id)
                                    selected
                                    @endif
                                    >{{$b->type}}</option>
                                @endforeach
                            </select>
                        </div>    
                        <div class="col-md-6 form-group">
                            {!! Form::label('phone', 'Phone:') !!}
                            <input type="text" name="phone" class="form-control" value="{!! $donar->phone !!}">
                        </div> 
                        <div class="col-md-6 form-group">
                            {!! Form::label('address', 'Donar Address:') !!}
                            <input type="text" name="address" class="form-control" value="{!! $donar->address !!}">
                        </div> 
                        <div class="col-md-6 form-group">
                            {!! Form::label('location', 'Location:') !!}
                            <select name="location_id" id="location_id" class="form-control">
                                @foreach($los as $lo)
                                    <option value="{{$lo->id}}" 
                                    @if($lo->id == $location->id)
                                    selected
                                    @endif
                                    >{{$lo->name}}</option>
                                @endforeach
                            </select>
                        </div> 
                        <div class="col-md-6 form-group">
                            {!! Form::label('image', 'Image:') !!}
                            {!! Form::file('image', null, ['class' => 'form-control']) !!}
                            <input type="hidden" name="img" value="{{ $donar->image }}">
                        </div> 
                        <div class="col-md-12 form-group">
                            <img src="{{ url($donar->image )}}"/>
                        </div>
                        <div class="form-group col-sm-12">
                           {!! Form::submit('Update', ['class' => 'btn btn-primary']) !!}
                        </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection