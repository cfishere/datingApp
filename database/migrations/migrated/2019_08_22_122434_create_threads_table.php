<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateThreadsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('threads', function (Blueprint $table) {
            $table->bigIncrements('id'); 
            //content JSON:
            /*
            json of all messages sent, received, having the ids of the parties as receiver and sender.  
            {0:{'from':'2' 'to':'14', 'subj':'blah', 'content':'foobar', 'status':'set to bool true once read by recipient'}, 1:{'from':'14' 'to':'2', 'subj':'re: blah', 'content':'barfoo', 'status':'set to bool true once read by recipient'}, etc}   
             */            
            $table->json('content');
            //user.id of last person to access this thread
            $table->integer('accessed_by')->unsigned()->nullabe();
            $table->datetime('accessed_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('threads');
    }
}
