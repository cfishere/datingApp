<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDatingProfileTagTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //a pivot tbl to manage a many-to-many rel betw/ profiles:tags tables:
         Schema::create('dating_profile_tag', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('tag_id');
            $table->unsignedBigInteger('dating_profile_id');
            $table->timestamps();
            $table->unique(['dating_profile_id', 'tag_id']);
            $table->foreign('dating_profile_id')->nullable()->unsigned()->references('id')
                ->on('profiles')
                ->onDelete('CASCADE');
            $table->foreign('tag_id')->nullable()->unsigned()->references('id')
                ->on('tags')
                ->onDelete('CASCADE');
        });   
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dating_profile_tag');
    }
}
