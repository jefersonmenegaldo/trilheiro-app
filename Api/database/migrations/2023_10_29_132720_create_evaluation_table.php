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
        Schema::create('evaluations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title', 100);
            $table->longText('comment');
            $table->smallInteger('note');
            $table->bigInteger('place_id', false, true)->nullable(false);
            $table->bigInteger('user_id', false, true)->nullable(false);
            $table->timestamps();

            $table->foreign('place_id')
                ->references('id')
                ->on('places');
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
        Schema::dropIfExists('evaluations');
    }
};
