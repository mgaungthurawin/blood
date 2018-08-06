<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Seeker extends Model
{
	protected $table='seekers';

    protected $fillable = [
        'name', 'email', 'location_id', 'address', 
    ];
}
