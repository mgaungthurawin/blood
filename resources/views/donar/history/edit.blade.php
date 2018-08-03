@extends('admin.layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Blood Type
        </h1>
    </section>
    <div class="content">
        <div class="box box-primary">

            <div class="box-body">
            
                <div class="row">
                {!! Form::model($donar, ['route' => ['donarhistory.update', $donar->id], 'method' => 'patch']) !!}

                    @include('donar.history.fields')

                    <div class="form-group col-sm-12">
                       {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
                       <a href="{!! route('donarhistory.index') !!}" class="btn btn-default">Cancel</a>
                    </div>

               {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection