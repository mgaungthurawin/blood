<table class="table table-responsive" id="hs-table">
    <thead>
        <th>Name</th>
        <th>Image</th>
        <th>Blood Type</th>
        <th>Donated Date</th>
    </thead>
    <tbody>
    <tr>
        <td>{{ $user->name }}</td>
        <td><img src="{{ url($donar->image) }}" style="width: 100px;"></td>
        <td>
            <select class="form-control">
                @foreach($bloods as $blood)
                    <option value="{{ $blood->id }}">{{ $blood->group }}</option>
                @endforeach
            </select>
        </td>
        <td>{{ $donar->created_at }}</td>
    </tr>
    </tbody>
</table>