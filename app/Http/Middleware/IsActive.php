<?php

namespace App\Http\Middleware;

use Closure;

class IsActive
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $envPath = base_path('.env');
        $SYSMAC = env('SYSTEM_MAC','');

        ob_start(); // Turn on output buffering
        system('ipconfig /all'); //Execute external program to display output
        $mycom=ob_get_contents(); // Capture the output into a variable
        ob_clean(); // Clean the output buffer
 //print_r($mycom);
//exit;
        $find_word = "Physical";
        $pmac = strpos($mycom, $find_word); // Find the position of Physical text in array
        $mac=substr($mycom,($pmac+36),17); // Get Physical Address

  //   echo $mac;
//exit;
        if (!($SYSMAC == $mac)) {
            return redirect()->route('first');
        }
        
        return $next($request);
    }
}
