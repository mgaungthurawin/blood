@extends('layouts.master')
@section('content')
    <div class="wrap-sm text-center">
        <h3>Sorry!</h3>
        <p>You need to wait after 4 month! You can not donate the blood now! Thanks</p>
        <div class="row">
            <a href="{{ url('/donarhistory') }}" class="btn">OK</a>
        </div>
    </div>
@endsection

