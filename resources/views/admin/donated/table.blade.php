<table class="table table-responsive" id="donateds-table">
    <thead>
        <th>Donar Name</th>
        <th>Blood Group</th>
        <th>Donar Address</th>
        <th>Donar Phone</th>
    </thead>
    <tbody>
    @foreach($donateds as $donated)
        <tr>
            <td>{!! $donated->name !!}</td>
            <td>{!! $donated->group !!}</td>
            <td>{!! $donated->address !!}</td>
            <td>{!! $donated->phone !!}</td>
        </tr>
    @endforeach
    </tbody>
</table>