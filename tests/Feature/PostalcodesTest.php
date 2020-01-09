<?php
namespace Tests\Feature;

use Tests\TestCase;
// for every test we will migrate the database into memory
// using sqlite.  Then roll it back once completed.
use Illuminate\Foundation\Testing\DatabaseMigrations;


class PostalcodesTest extends TestCase
{
    use DatabaseMigrations;
    /**
     * A basic test example.
     * Tests against phpunit.xml's test database.
     *
     * @return void
     */
    public function a_datingprofile_can_search_profiles_by_zipcode_radius()
    {
        //endpoint:
        $response = $this->get('/search/datingprofiles/postalcode/'.$postalcode.'/'.$radialMiles);

        $response->assertStatus(200);
    }
}
