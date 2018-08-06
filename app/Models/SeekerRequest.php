<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SeekerRequest extends Model
{
	protected $table='seeker_request';

    protected $fillable = [
        'seeker_id', 'blood_id', 'location_id', 'quantity', 'status', 
    ];
}
