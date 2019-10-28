<?php
namespace App\Http\ViewComposers;
use Illuminate\View\View;

/**
 * @param  View  $view
 * @return void
 */
class ProfilesViewComposer
{
	
	public function compose( View $view)
	{
		$view->with('profiles', [])

	}



}

namespace App\Http\View\Composers;
use Illuminate\View\View;
class NavigationComposer
{
    /**
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        $view->with('navigation', [
            'items1', 'items2', 'item3'
        ]);
    }
}
