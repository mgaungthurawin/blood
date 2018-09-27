<?php

namespace App\Http\Controllers\Donar;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Hash;
use App\Models\BloodType;
use App\Models\Doner;
use App\Models\Location;
use Auth;
use Illuminate\Validation\Rule;
use DB;

class DonarController extends Controller
{
    public function profile() {
        $user = Auth::user();
        $donar = Doner::where('user_id', $user->id)->first();
        $bloods = BloodType::where('id', $donar->blood_id)->first();
        $location = Location::where('id', $donar->location_id)->first();
        return view('donar.profile', compact('user', 'donar', 'bloods', 'location'));
    }

    public function editprofile() {
        $user = Auth::user();
        $donar = Doner::where('user_id', $user->id)->first();
        $bloods = BloodType::where('id', $donar->blood_id)->first();
        $location = Location::find($donar->location_id)->first();
        $bs = BloodType::all();
        $los = Location::all();
        return view('donar.updateprofile', compact('user', 'donar', 'bloods', 'location', 'bs', 'los'));   
    }

    public function index() {
    	setusertype(2);
        $groups = DB::table('blood_type')
                         ->select('group')
                         ->groupBy('group')
                         ->get();
        $types = BloodType::all();
        $locations = Location::all();
    	return view('donar.register', compact('groups', 'types', 'locations'));
    }

    public function register(Request $request) {

        $this->validate($request, [
            'name' => "required",
            'email' => "required | email | unique:users,email",
            'image' => "required",
            'password' => 'required|string|min:6|confirmed',
        ]);

    	$data = $request->all();
        $image = imageUpload($request, 'image', 'images');

    	$row = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'user_type' => getusertype(),
        ]);

    	Doner::create([
    		'user_id' => $row->id,
            'blood_id' => $data['blood_id'],
    		'location_id' => $data['location_id'],
    		'address' => $data['address'],
    		'phone' => $data['phone'],
    		'dob' => $data['dob'],
            'image' => $image,
    	]);
    	
    	return redirect(route('login'));

    }

    public function updateprofile(Request $request) {
        $user_id = Auth::user()->id;
        $data = $request->all();
        if (empty($data['image'])) {
            $data['image'] = $data['img'];
        } else {
            $image = imageUpload($request, 'image', 'images');
            $data['image'] = $image;
        }

        User::find($user_id)->update([
            'name' => $data['name'],
        ]);

        Doner::where('user_id', $user_id)
            ->update([
                'blood_id' => $data['group'],
                'location_id' => $data['location_id'],
                'address' => $data['address'],
                'phone' => $data['phone'],
                'dob' => $data['dob'],
                'image' => $data['image'],
            ]);
        return redirect('/profile');
    }

    public function dashboard() {
    	return view('donar.dashboard');
    }
}






