<li class="{{ Request::is('bloodtype*') ? 'active' : '' }}">
    <a href="{!! route('bloodtype.index') !!}"><i class="fa fa-edit"></i><span>Blood Type</span></a>
</li>
<li class="{{ Request::is('location*') ? 'active' : '' }}">
    <a href="{!! route('location.index') !!}"><i class="fa fa-edit"></i><span>Location</span></a>
</li>
<li class="{{ Request::is('donated*') ? 'active' : '' }}">
    <a href="{!! route('donated.index') !!}"><i class="fa fa-edit"></i><span>Blood Donated</span></a>
</li>
<li class="{{ Request::is('requested*') ? 'active' : '' }}">
    <a href="{!! route('requested.index') !!}"><i class="fa fa-edit"></i><span>Blood Requested</span></a>
</li>