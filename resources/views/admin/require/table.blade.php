<table class="table table-responsive" id="requires-table">
    <thead>
        <th>Blood Require Place</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($requires as $require)
        <tr>
            <td>{!! $require->text !!}</td>
            <td>
                {!! Form::open(['route' => ['require.destroy', $require->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>