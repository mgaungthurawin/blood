<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DonerHistory extends Model
{
	protected $table='donar_history';

    protected $fillable = [
        'user_id', 'location_id', 'group', 'type', 'quantity',
    ];
}
