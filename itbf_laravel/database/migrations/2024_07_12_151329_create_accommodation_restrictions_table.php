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
        Schema::create('accommodation_restrictions', function (Blueprint $table) {
            $table->foreignId('room_type_id')->constrained()->onDelete('cascade');
            $table->foreignId('accommodation_id')->constrained()->onDelete('cascade');
            $table->primary(['room_type_id', 'accommodation_id']);
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('accommodation_restrictions');
    }
};
