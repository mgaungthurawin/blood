<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/info', function () {
	return view('info');
});
Route::get('/donar', 'Donar\DonarController@index');
Route::post('/donarRegister', 'Donar\DonarController@register');
Route::get('/seeker', 'Seeker\SeekerController@index');

Route::get('/profile', 'Donar\DonarController@profile');
Route::get('/editprofile', 'Donar\DonarController@editprofile');
Route::post('/updateprofile', 'Donar\DonarController@updateprofile');
Route::get('/donardashboard', 'Donar\DonarController@dashboard');
Route::resource('donarhistory', 'DonerHistoryController');

Route::get('/seekerdashboard', 'Seeker\SeekerController@index');
Route::post('/bloodsearch', 'Seeker\SeekerController@search');
Route::get('/donarlist', 'Seeker\SeekerController@donarlist');
Route::get('/bloodreqeust/{blood_id}/{location_id}', 'Seeker\SeekerController@request');
Route::get('/requestsuccess', 'Seeker\SeekerController@requestsuccess');


Auth::routes();

Route::group(['middleware' => 'App\Http\Middleware\AuthMiddleware'], function(){
	Route::get('/home', 'HomeController@index')->name('home');
});
Route::resource('bloodtype', 'BloodtypeController');
Route::resource('location', 'LocationController');
Route::resource('donated', 'DonatedController');
Route::resource('requested', 'RequestedController');



