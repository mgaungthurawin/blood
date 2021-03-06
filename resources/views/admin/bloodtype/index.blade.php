@extends('admin.layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-right">
           <a class="btn btn-primary pull-right" href="{!! route('bloodtype.create') !!}">Add New</a>
        </h1>
        <div class="row">
            <form method="GET">
                <div class="form-group col-md-3">
                    <input type="text" name="name" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </section>
    <div class="content">
        <div class="clearfix"></div>
        <div class="clearfix"></div>

        @include('flash::message')

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                    @include('admin.bloodtype.table')
            </div>
            <div class="pull-right">{{ $bloodtypes->render() }}</div>
        </div>
    </div>
@endsection