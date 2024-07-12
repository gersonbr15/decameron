<?php

namespace App\Http\Controllers;

use App\Models\Accommodation;
use App\Models\Hotel;
use App\Models\Room;
use App\Models\RoomType;
use App\Services\HotelService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;


class HotelController extends Controller
{
    protected $hotelService;

    public function __construct(HotelService $hotelService)
    {
        $this->hotelService = $hotelService;
    }


    public function getData(Request $request): JsonResponse
    {
        $roomTypes = RoomType::get(['id', 'description']);
        $accommodations = Accommodation::get(['id', 'description']);

        return response()->json([
            'roomTypes' => $roomTypes,
            'accommodations' => $accommodations
        ], 200);
    }

    public function store(Request $request): JsonResponse
    {
        $result = $this->hotelService->validateAndCreateHotel($request->all());

        if ($result['status'] === 'error') {
            return response()->json($result, 422);
        }

        return response()->json($result, 200);
    }
}
