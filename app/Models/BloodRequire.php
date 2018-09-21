<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BloodRequire extends Model
{
    protected $table='blood_require';

    protected $fillable = [
        'blood_id', 'location_id', 'text',
    ];
}
