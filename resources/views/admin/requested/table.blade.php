<table class="table table-responsive" id="requesteds-table">
    <thead>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Requested Blood</th>
        <th>Request Location</th>
        <th>Request Status</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($requesteds as $requested)
        <tr>
            <td>{!! $requested->seeker_name !!}</td>
            <td>{!! $requested->email !!}</td>
            <td>{!! $requested->address !!}</td>
            <td>{!! $requested->group !!}</td>
            <td>{!! $requested->location_name !!}</td>
            <td>{!! $requested->status !!}</td>
            <td>
                {!! Form::open(['route' => ['requested.destroy', $requested->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('requested.edit', [$requested->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>