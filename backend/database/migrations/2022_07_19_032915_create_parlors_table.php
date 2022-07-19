<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parlors', function (Blueprint $table) {
            $table->id();
            $table->string('name')->require();
            $table->text('description')->require();
            $table->double('long')->require();
            $table->double('lati')->require();
            $table->unsignedBigInteger('user_id')->require();
            $table->foreign('user_id')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parlors');
    }
};
