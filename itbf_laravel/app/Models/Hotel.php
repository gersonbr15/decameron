<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hotel extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name', 'address', 'city', 'tax_id', 'number_of_rooms'
    ];

    public function rooms()
    {
        return $this->hasMany(Room::class);
    }
}
