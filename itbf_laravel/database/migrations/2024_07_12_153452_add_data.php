<?php

use App\Models\Accommodation;
use App\Models\RoomType;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        RoomType::create(['description' => 'Estandar']);
        RoomType::create(['description' => 'Junior']);
        RoomType::create(['description' => 'Suite']);

        Accommodation::create(['description' => 'Sencilla']);
        Accommodation::create(['description' => 'Doble']);
        Accommodation::create(['description' => 'Triple']);
        Accommodation::create(['description' => 'Quadruple']);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
