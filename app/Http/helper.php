<?php
use Illuminate\Support\Facades\Input;

function setusertype($user_type) {
	Session::put('user_type', $user_type);
};

function getusertype() {
	return Session::get('user_type');
}

function imageUpload($request, $filename, $folder) {
	if (Input::hasFile($filename)) {
        $image = Input::file($filename);
        $name = time() . '.' . $image->getClientOriginalName();
        $name = str_replace(' ', '', $name);
        $name = preg_replace('/\s+/', '', $name);
        $path = public_path($folder .'/' . $name);  
        Image::make($image->getRealPath())->resize(400, 400)->save($path);
        $insertpath = $folder . '/' . $name;
        return $insertpath;
    }
	return null;
}

