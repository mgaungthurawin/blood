<table class="table table-responsive" id="hs-table">
    <thead>
        <th>Blood Group</th>
        <th>Blood Type</th>
        <th>Blood Quantity</th>
        <th>Location</th>
        <th>Donated Date</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($history as $h)
        <tr>
            <td>{!! $h->group !!}</td>
            <td>{!! $h->type !!}</td>
            <td>{!! $h->quantity !!}</td>
            <td>{!! $h->name !!}</td>
            <td>{!! $h->created_at !!}</td>
            <td>
                {!! Form::open(['route' => ['donarhistory.destroy', $h->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('donarhistory.edit', [$h->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    <!-- {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
 -->                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>