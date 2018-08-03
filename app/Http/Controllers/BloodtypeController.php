<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BloodType;
use Flash;
use App\Http\Requests\BloodtypeRequest;

class BloodtypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bloodtypes = BloodType::orderby('id', 'DESC')->paginate(15);
        return view('admin.bloodtype.index', compact('bloodtypes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.bloodtype.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BloodtypeRequest $request)
    {
        BloodType::create($request->all());
        Flash::success('successfully save the blood');
        return redirect(route('bloodtype.index'));
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
        $bloodtype = BloodType::find($id);
        if (empty($bloodtype)) {
            Flahs::error('blood type not found');
            return view('admin.bloodtype.index');
        }
        return view('admin.bloodtype.edit', compact('bloodtype'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(BloodtypeRequest $request, $id)
    {
        Bloodtype::find($id)->update($request->all());
        Flash::success('successfully update the blood');
        return redirect(route('bloodtype.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        BloodType::find($id)->delete();
        Flash::success('successfully delete the blood');
        return redirect(route('bloodtype.index'));
    }
}
