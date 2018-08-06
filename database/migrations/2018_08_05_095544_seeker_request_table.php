<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SeekerRequestTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seeker_request', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('seeker_id')->unsigned();
            $table->integer('blood_id')->unsigned();
            $table->integer('location_id')->unsigned();
            $table->integer('quantity');
            $table->boolean('status');
            $table->timestamps();
        });
        
        Schema::table('seeker_request', function($table) {
            $table->foreign('seeker_id')->references('id')->on('seekers')->onDelete('cascade');
            $table->foreign('blood_id')->references('id')->on('blood_type')->onDelete('cascade');
            $table->foreign('location_id')->references('id')->on('locations')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seeker_request');
    }
}
