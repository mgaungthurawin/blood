<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DonerHistory;
use App\Models\BloodType;
use App\Models\Doner;
use App\Models\Location;
use Flash;
use Auth;

class DonerHistoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $donar = Doner::where('user_id', $user->id)->first();
        $history = DonerHistory::join('locations', 'locations.id', 'donar_history.location_id')
                        ->where('donar_history.user_id', $user->id)
                        ->orderby('donar_history.id', 'DESC')->paginate(15);
        // $history = DonerHistory::orderby('id', 'DESC')->paginate(15);
        return view('donar.history.index', compact('history', 'donar'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = Auth::user();
        $donar = Doner::where('user_id', $user->id)->first();
        $blood = BloodType::all();
        $locations = Location::all();
        return view('donar.history.create', compact('blood', 'donar', 'locations'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $blood = BloodType::find($data['blood_id']);
        BloodType::find($data['blood_id'])->update([
            'quantity' => $blood->quantity + $data['quantity']
        ]);

        DonerHistory::create([
            'user_id' => Auth::user()->id,
            'location_id' => $data['location_id'],
            'group' => $blood->group,
            'type' => $blood->type,
            'quantity' => $data['quantity'],
        ]);

        Flash::success('successfully donate the blood');
        return redirect(route('donarhistory.index'));
        

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
        $user = Auth::user();
        $donar = Doner::where('user_id', $user->id)->first();

        $blood = BloodType::all();
        $donarhistory = DonerHistory::find($id);
        return view('donar.history.edit', compact('donarhistory','blood', 'donar'));
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
        $data = $request->all();

        $history = DonerHistory::find($id);
        $blood = BloodType::find($data['blood_id']);
        $qty = $blood->quantity - $history->quantity + $data['quantity'];

        BloodType::find($data['blood_id'])->update([
            'quantity' => $blood->quantity + $data['quantity']
        ]);

        DonerHistory::find($id)->update([
            'user_id' => Auth::user()->id,
            'group' => $blood->group,
            'type' => $blood->type,
            'quantity' => $data['quantity'],
        ]);

        Flash::success('successfully donate the blood');
        return redirect(route('donarhistory.index'));
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
