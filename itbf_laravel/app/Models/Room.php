<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Room extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'hotel_id', 'room_type_id', 'accommodation_id', 'quantity'
    ];

    public function hotel()
    {
        return $this->belongsTo(Hotel::class);
    }

}
