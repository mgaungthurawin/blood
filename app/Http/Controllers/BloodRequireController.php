<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BloodRequire;

class BloodRequireController extends Controller
{
    public function index() {
    	$requires = BloodRequire::all();	
    	return view('bloodrequire', compact('requires'));
    }
}
