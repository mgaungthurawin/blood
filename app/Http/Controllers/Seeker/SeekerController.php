<?php

namespace App\Http\Controllers\Seeker;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SeekerController extends Controller
{
    public function index() {
    	return "seeker";
    }

    public function dashboard() {
    	return 'Donar Dashboard';
    }
}
