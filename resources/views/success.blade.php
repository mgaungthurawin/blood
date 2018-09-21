@extends('layouts.master')
@section('content')
    <div class="wrap-sm text-center">
        <h3>Yay!</h3>
        <p>Successfully request the blood! <br/>
        Please ensure the feedback to administrator</p>

        <div class="row">
            <a href="{{ url('/') }}" class="btn">Continue</a>
        </div>
    </div>
@endsection

