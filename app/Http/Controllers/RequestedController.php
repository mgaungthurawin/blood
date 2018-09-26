<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Seeker;
use App\Models\SeekerRequest;

class RequestedController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $requesteds = SeekerRequest::join('seekers', 'seeker_request.seeker_id', 'seekers.id')
                                ->join('blood_type', 'blood_type.id', 'seeker_request.blood_id')
                                ->join('locations', 'locations.id', 'seeker_request.location_id')
                            ->select('seekers.name as seeker_name', 'seekers.email', 'seekers.address', 'blood_type.type', 'seeker_request.quantity', 'seeker_request.status', 'locations.name as location_name', 'seeker_request.status')
                            ->paginate(10);
        return view('admin.requested.index', compact('requesteds'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
