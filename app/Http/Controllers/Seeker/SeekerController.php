<?php

namespace App\Http\Controllers\Seeker;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\BloodType;
use App\Models\Location;
use App\Models\Doner;
use App\Models\DonerHistory;
use App\Models\Seeker;
use App\Models\SeekerRequest;
use App\User;
use Session;

class SeekerController extends Controller
{
    public function index() {
    	$bloods = BloodType::all();
    	$locations = Location::all();
    	return view('seeker.register', compact('locations','bloods'));
    }

    public function search(Request $request) {
    	$data = $request->all();

    	$seeker = Seeker::where('email', $data['email'])->first();
    	if (empty($seeker)) {
    		$row = Seeker::create($request->all());
    		Session::put('seeker_id', $row->id);
    	} else {
    		Session::put('seeker_id', $seeker->id);
    	}	
    	
    	Session::put('quantity', $data['quantity']);

    	$donars = DonerHistory::join('users', 'users.id', 'donar_history.user_id')
    							->join('doners', 'users.id', 'doners.user_id')
    							->join('blood_type', 'blood_type.id', 'doners.blood_id')
    							->join('locations', 'locations.id', 'doners.location_id')
		    					->where('doners.location_id', $data['location_id'])
		    					->where('doners.blood_id', $data['blood_id'])
		    					->select('users.id','users.name as user_name', 'users.email', 'doners.address', 'doners.phone', 'doners.image', 'locations.id as location_id', 'locations.name as location_name', 'blood_type.group', 'donar_history.quantity', 'blood_type.id as blood_id')
    							->get();
    	return view('donarlist', compact('donars', 'userids'));
    }

    public function request($blood_id, $location_id) {
    	$seeker_id = Session::get('seeker_id');
    	$quantity = Session::get('quantity');
    	SeekerRequest::create([
    		'seeker_id' => $seeker_id,
    		'blood_id' => $blood_id,
    		'location_id' => $location_id,
    		'quantity' => $quantity,
    		'status' => 0,
		]);

		return redirect('/requestsuccess');
    }

    public function requestsuccess() {
    	return view('success');
    }

    public function requested() {
        return view('seeker.seekerlogin');
    }

    public function login(Request $request) {
        $row = Seeker::where('email', $request->email)->first();
        if (!$row) {
            // To do
        }

        $detail = Seeker::join('seeker_request', 'seekers.id', 'seeker_request.seeker_id')
                        ->join('blood_type', 'blood_type.id', 'seeker_request.blood_id')
                        ->join('locations', 'locations.id', 'seekers.location_id')
                        ->select('seekers.name', 'seekers.email', 'blood_type.group', 'seeker_request.quantity', 'locations.name as location_name','seeker_request.id')
                        ->where('seekers.id', $row->id)
                        ->get();

        return view('seeker.list', compact('detail'));

    }

    public function upgrade($id) {
        SeekerRequest::find($id)->update([
            'status' => 1,
        ]);
        return redirect('/upgradesuccess');
    }

    public function upgradesuccess() {
        return view('seeker.success');
    }

}






