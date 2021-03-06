@extends('donar.layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-right">
           <a class="btn btn-primary pull-right" href="{!! route('donarhistory.create') !!}">Add New</a>
        </h1>
        <div class="row">
            
        </div>
    </section>
    <div class="content">
        <div class="clearfix"></div>
        <div class="clearfix"></div>

        @include('flash::message')

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                    @include('donar.history.table')
            </div>
            <div class="pull-right">{{ $history->render() }}</div>
        </div>
    </div>
@endsection