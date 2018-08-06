<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Doner extends Model
{
    protected $fillable = [
        'user_id', 'blood_id', 'location_id', 'address', 'phone', 'dob', 'image',
    ];
}
