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
        Schema::create('places', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 100);
            $table->longText('description');
            $table->string('latitude', 100);
            $table->string('longitude', 100);
            $table->string('street', 100);
            $table->string('neighborhood', 100);
            $table->string('number', 15);
            $table->string('complement', 100);

            $table->bigInteger('city_id', false, true)->nullable(false);
            $table->bigInteger('user_id', false, true)->nullable(false);

            $table->timestamps();

            $table->foreign('city_id')
                ->references('id')
                ->on('cities');
            $table->foreign('user_id')
                ->references('id')
                ->on('users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('places');
    }
};
