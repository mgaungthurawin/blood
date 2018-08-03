<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Doner extends Model
{
    protected $fillable = [
        'user_id', 'blood_id', 'address', 'phone', 'dob', 'image',
    ];
}
