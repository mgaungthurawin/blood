@extends('admin.layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Blood TYpe
        </h1>
   </section>
   <div class="content">
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($bloodtype, ['route' => ['bloodtype.update', $bloodtype->id], 'method' => 'patch']) !!}

                        @include('admin.bloodtype.fields')

                        <div class="form-group col-sm-12">
                            {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
                            <a href="{!! route('bloodtype.index') !!}" class="btn btn-default">Cancel</a>
                        </div>

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection