<table class="table table-responsive" id="bloodtypes-table">
    <thead>
        <th>Blood Group</th>
        <th>Blood Type</th>
        <th>Blood Quantity</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($bloodtypes as $bloodtype)
        <tr>
            <td>{!! $bloodtype->group !!}</td>
            <td>{!! $bloodtype->type !!}</td>
            <td>{!! $bloodtype->quantity !!}</td>
            <td>
                {!! Form::open(['route' => ['bloodtype.destroy', $bloodtype->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('bloodtype.edit', [$bloodtype->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>