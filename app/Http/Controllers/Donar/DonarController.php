<?php

namespace App\Http\Controllers\Donar;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Hash;
use App\Models\BloodType;
use App\Models\Doner;

class DonarController extends Controller
{
    public function index() {
    	setusertype(2);
    	$blood = BloodType::all();
    	return view('donar.register', compact('blood'));
    }

    public function register(Request $request) {
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
    		'address' => $data['address'],
    		'phone' => $data['phone'],
    		'dob' => $data['dob'],
            'image' => $image,
    	]);
    	
    	return redirect(route('login'));

    }

    public function dashboard() {
    	return view('donar.dashboard');
    }
}
