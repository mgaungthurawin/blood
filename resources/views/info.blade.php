@extends('layouts.master')
@section('content')
    <div class="wrap-sm text-center">
        <h3>Select Register Type</h3>
        <div class="row input-lg item-options">
            <div class="item">
                <input id="telenor" type="radio" name="type" selected="true" value="donar"/>
                <label for="telenor">
                    <img src="{{url('img/donar.jpg')}}" />
                    <span class="sr-only">Donar</span>
                </label>
            </div>
            <div class="item">
                <input id="wavemoney" type="radio" name="type" value="seeker"/>
                <label for="wavemoney">
                    <img src="{{url('img/seeker.jpg')}}" />
                    <span class="sr-only">Seeker</span>
                </label>
            </div>
        </div>
        <div class="row">
            <button type="submit" id="check">Next</button>
        </div>
    </div>
@endsection

