<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HotelController;

Route::post('hotels', [HotelController::class, 'store']);
Route::get('get-data', [HotelController::class, 'getData']);
