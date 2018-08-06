<table class="table table-responsive" id="donateds-table">
    <thead>
        <th>Donar Name</th>
        <th>Blood Group</th>
        <th>Donar Address</th>
        <th>Donar Phone</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($donateds as $donated)
        <tr>
            <td>{!! $donated->name !!}</td>
            <td>{!! $donated->group !!}</td>
            <td>{!! $donated->address !!}</td>
            <td>{!! $donated->phone !!}</td>
            <td>
                {!! Form::open(['route' => ['donated.destroy', $donated->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('donated.edit', [$donated->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>