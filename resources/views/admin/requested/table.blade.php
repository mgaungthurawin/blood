<table class="table table-responsive" id="requesteds-table">
    <thead>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Requested Blood</th>
        <th>Request Location</th>
        <th>Request Status</th>
    </thead>
    <tbody>
    @foreach($requesteds as $requested)
        <tr>
            <td>{!! $requested->seeker_name !!}</td>
            <td>{!! $requested->email !!}</td>
            <td>{!! $requested->address !!}</td>
            <td>{!! $requested->type !!}</td>
            <td>{!! $requested->location_name !!}</td>
            <td>
                @if($requested->status == 0)
                    Pending
                @else
                    Successful
                @endif
            </td>
        </tr>
    @endforeach
    </tbody>
</table>