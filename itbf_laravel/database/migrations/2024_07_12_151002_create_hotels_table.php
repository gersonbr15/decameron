<?php

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
        Schema::create('hotels', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique()->comment('Name of the hotel');
            $table->string('address')->comment('Address of the hotel');
            $table->string('city')->comment('City where the hotel is located');
            $table->string('tax_id')->unique()->comment('Tax identification number of the hotel');
            $table->integer('number_of_rooms')->comment('Maximum number of rooms in the hotel');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hotels');
    }
};
