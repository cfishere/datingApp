<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */

    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')
                ->unsigned()
                ->nullable();
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onDelete('SET NULL');
            $table->integer('message_id')
                ->unsigned()
                ->nullable()
                ->onDelete('Cascade');
            $table->foreign('message_id')
                ->references('id')
                ->on('messages')
                ->onDelete('Cascade');
            $table->integer('state')
                ->unsigned()
                ->nullable();
            $table->foreign('state')
                ->references('id')
                ->on('regions')
                ->onDelete('SET NULL');
            $table->integer('country')
                ->unsigned()
                ->nullable();
            $table->foreign('country')
                ->references('id')
                ->on('countries')
                ->onDelete('SET NULL');
            $table->integer('gallery_id')
                ->unsigned()
                ->nullable();
            $table->foreign('gallery_id')
                ->references('id')
                ->on('galleries')
                ->onDelete('CASCADE');
            $table->date('dob');
            $table->text('bio')
                ->nullable();
            $table->boolean('gender');
            $table->boolean('seeking_gender');    
            $table->text('seeking_desc')
                ->nullable();
            $table->json('interests')
                ->nullable();
            $table->json('values')
                ->nullable();
            $table->json('likes')
                ->nullable();
            $table->json('matches')
                ->nullable();
            $table->json('favorites')
                ->nullable();
            $table->string('city')
                ->nullable();            
            $table->string('postalcode')
                ->nullable();
            $table->boolean('active')
                ->default('0');
            $table->string('account')
                ->default('guest');
            $table->json('appearance')
                ->nullable();  
            $table->json('notes')
                ->nullable();     
            $table->boolean('online')
                ->nullable();   
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
        //Schema::dropIfExists('profiles');           
        $table->dropColumn('dob');
        $table->dropColumn('bio');
        $table->dropColumn('seeking');
        $table->dropColumn('interests');
        $table->dropColumn('values');
        $table->dropColumn('likes');
        $table->dropColumn('matches');
        $table->dropColumn('favorites');
        $table->dropColumn('city'); 
        $table->dropColumn('state');         
    }
}
