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
           <a class="btn btn-primary pull-right" href="{{ url('/editprofile') }}">Update Profile</a>
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
                    <div class="col-md-6 form-group">
                        {!! Form::label('name', 'Donar Name:') !!}
                        <p>{!! $user->name !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('dob', 'Date of Birth:') !!}
                        <p>{!! $donar->dob !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('group', 'Blood Group:') !!}
                        <p>{!! $bloods->group !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('type', 'Blood Type:') !!}
                        <p>{!! $bloods->type !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('phone', 'Donar Phone:') !!}
                        <p>{!! $donar->phone !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('dob', 'Date of Birth:') !!}
                        <p>{!! $donar->dob !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('address', 'Donar Address:') !!}
                        <p>{!! $donar->address !!}</p>
                    </div>

                    <div class="col-md-6 form-group">
                        {!! Form::label('location', 'Location:') !!}
                        <p>{!! $location->name !!}</p>
                    </div>

                    <div class="col-md-12 form-group">
                        <img src="{{ url($donar->image )}}"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection