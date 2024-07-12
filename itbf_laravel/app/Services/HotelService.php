<?php

namespace App\Services;

use App\Models\Hotel;
use App\Models\Room;
use App\Models\RoomType;
use Illuminate\Support\Facades\Validator;

class HotelService
{
    protected $accommodationRules = [
        1 => [1, 2],
        2 => [3, 4],
        3 => [1, 2, 3]
    ];

    public function validateAndCreateHotel(array $data)
    {
        // Validar los datos del hotel
        $validator = Validator::make($data, [
            'name' => 'required|string',
            'address' => 'required|string',
            'city' => 'required|string',
            'tax_id' => 'required|string',
            'number_of_rooms' => 'required|integer|min:1',
            'rooms' => 'required|array',
            'rooms.*.quantity' => 'required|integer|min:1',
            'rooms.*.room_type_id' => 'required|in:1,2,3',
            'rooms.*.accommodation_id' => 'required|in:1,2,3,4'
        ]);

        // Verificar si la validación falla
        if ($validator->fails()) {
            return [
                'status' => 'error',
                'errors' => $validator->errors()
            ];
        }

        if(Hotel::where('name', $data['name'])->exists()){
            return [
                'status' => 'error',
                'message' => 'El hotel ya se encuentra registrado en el sistema'
            ];
        }

        // Validar la regla de acomodación para cada tipo de habitación
        foreach ($data['rooms'] as $room) {
            if (!in_array($room['accommodation_id'], $this->accommodationRules[$room['room_type_id']])) {
                return [
                    'status' => 'error',
                    'message' => 'Acomodación inválida para el tipo de habitación: ' . RoomType::find($room['room_type_id'])->description
                ];
            }
        }

        // Sumar el total de habitaciones
        $totalRooms = array_sum(array_column($data['rooms'], 'quantity'));

        // Verificar si el total de habitaciones excede el máximo permitido
        if ($totalRooms > (int)$data['number_of_rooms']) {
            return [
                'status' => 'error',
                'message' => 'El número total de habitaciones excede el máximo permitido para este hotel'
            ];
        }

        try {
            // Crear el hotel
            $hotel = Hotel::create($data);

            // Crear las habitaciones del hotel
            foreach ($data['rooms'] as $room) {
                $hotel->rooms()->create([
                    'room_type_id' => $room['room_type_id'],
                    'accommodation_id' => $room['accommodation_id'],
                    'quantity' => $room['quantity']
                ]);
            }

            // Retornar el hotel creado con las habitaciones cargadas
            return [
                'status' => 'success',
                'data' => $hotel->load('rooms')
            ];
        } catch (\Exception $e) {
            // Manejar la excepción y retornar un mensaje de error
            return [
                'status' => 'error',
                'message' => 'Falló la creación del hotel',
                'error' => $e->getMessage()
            ];
        }
    }
}
