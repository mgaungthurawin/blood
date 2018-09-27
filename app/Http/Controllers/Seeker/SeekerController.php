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
use App\Models\BloodRequire;
use App\User;
use Session;
use Flash;

class SeekerController extends Controller
{
    public function index() {
    	$bloods = BloodType::all();
    	$locations = Location::all();
    	return view('seeker.blood_search', compact('locations','bloods'));
    }

    public function search(Request $request) {
    	$data = $request->all();
        // $donars = User::join('doners', 'doners.user_id', 'users.id')
        //                 ->join('blood_type', 'blood_type.id', 'doners.blood_id')
        //                 ->join('locations', 'location_id', 'doners.location_id')
        //                 ->where('blood_type.id', $data['blood_id'])
        //                 ->where('doners.location_id', $data['location_id'])
        //                 ->select('users.id','users.name as user_name', 'users.email', 'doners.address', 'doners.phone', 'doners.image', 'locations.id as location_id', 'locations.name as location_name', 'blood_type.group', 'doners.blood_id as blood_id')
        //                 ->get();
        $donars = Doner::join('donar_history', 'donar_history.user_id', 'doners.user_id')
                        ->join('users', 'users.id', 'doners.user_id')
                        ->join('locations', 'locations.id', 'doners.location_id')
                        ->where('doners.blood_id', $data['blood_id'])
                        ->where('doners.location_id', $data['location_id'])
                        ->select('users.id','users.name as user_name', 'users.email', 'doners.address', 'doners.phone', 'doners.image', 'locations.id as location_id', 'locations.name as location_name', 'doners.blood_id as blood_id', 'donar_history.created_at as donated_date', 'donar_history.type as type')
                        ->get();
        if (count($donars) == 0) {

            $row = BloodRequire::where('blood_id', $data['blood_id'])
                        ->where('location_id', $data['location_id'])
                        ->first();

            if (!$row) {
                $location = Location::where('id', $data['location_id'])->first();
                $blood = BloodType::where('id',$data['blood_id'])->first();
                $text = 'Blood Type ' . $blood->type . ' is require in ' . $location->name;
                BloodRequire::create([
                    'blood_id' => $data['blood_id'], 
                    'location_id' => $data['location_id'],
                    'text' => $text]);
            }
            
            Flash::success('Sorry! We did not have this blood type.');
            return redirect('/seeker');
        }

    	return view('donarlist', compact('donars', 'userids'));
    }

    public function request($blood_id, $location_id) {
        Session::put('blood_id', $blood_id);
        Session::put('location_id', $location_id);
        return redirect('/seekerLogin');

    }

    public function seekerregister() {
        return view('seeker.register');
    }

    public function seekerlogin() {
        return view('seeker.login');
    }

    public function requestsuccess() {
    	return view('success');
    }

    public function requested() {
        return view('seeker.seekerlogin');
    }

    public function register(Request $request) {
        $this->validate($request, [
            'name' => "required",
            'email' => "required | email | unique:users,email",
            'address' => "required",
        ]);
        $data = $request->all();
        $data['location_id'] = Session::get('location_id');
        $row = Seeker::create($data);

        SeekerRequest::create([
            'seeker_id' => $row->id,
            'blood_id' => Session::get('blood_id'),
            'location_id' => Session::get('location_id'),
            'quantity' => 1,
            'status' => 0,
        ]);

        Session::put('seeker_id', $row->id);
        Session::put('seeker_logged_in', 1);

        return redirect('/requestsuccess');
    }

    public function login(Request $request) {
        $this->validate($request, [
            'email' => "required",
        ]);

        $row = Seeker::where('email', $request->email)
                    ->first();
        if($row) {
            SeekerRequest::create([
                'seeker_id' => $row->id,
                'blood_id' => Session::get('blood_id'),
                'location_id' => Session::get('location_id'),
                'quantity' => 1,
                'status' => 0,
            ]);
            Session::put('seeker_id', $row->id);
            Session::put('seeker_logged_in', 1);
            return redirect('/requestsuccess');
        } else {
            Flash::error('User not found!');
            return redirect('/seekerLogin');
        }
    }

    public function requestlogin(Request $request) {
        $this->validate($request, [
            'email' => "required",
        ]);
        $row = Seeker::where('email', $request->email)->first();
        if (!$row) {
            Flash::error('User not found!');
            return redirect('/bloodrequested');
        }

        $detail = Seeker::join('seeker_request', 'seekers.id', 'seeker_request.seeker_id')
                        ->join('blood_type', 'blood_type.id', 'seeker_request.blood_id')
                        ->join('locations', 'locations.id', 'seekers.location_id')
                        ->select('seekers.name', 'seekers.email', 'blood_type.type', 'seeker_request.quantity', 'locations.name as location_name','seeker_request.id', 'seekers.address')
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






