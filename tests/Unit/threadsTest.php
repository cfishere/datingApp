<?php

namespace Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ThreadsTest extends TestCase
{
	/* will migrate any tables, if needed to 
	 * complete a test, then roll it back when done.
	 */
	use DatabaseMigrations;

    /**
     * Using a test DB (not our local App DB).
     * See settings in phpunit.php, server tags.
     * And in config/database, 
     *
     * @return void
     */
    public function a_user_can_browse_tests()
    {

    	$response = $this->get('/threads');


        $this->assertTrue(true);
    }
}
