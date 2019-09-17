<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatebillingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('billings', function (Blueprint $table) {
            $table->bigIncrements('id');
             $table->integer('user_id')
                ->unsigned()
                ->nullable();
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onDelete('SET NULL');            
            $table->string('addr1');
            $table->string('addr2');
            $table->string('city');
            $table->integer('region_id')
                ->unsigned()
                ->nullable();
            $table->foreign('region_id')
                ->references('id')
                ->on('regions');
            $table->integer('country_id')
                ->unsigned()
                ->nullable();
            $table->foreign('country_id')
                ->references('id')
                ->on('countries')
                ->onDelete('SET NULL');
            $table->string('postalcode');
            $table->json('payment_method')
                ->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billings');
    }
}
