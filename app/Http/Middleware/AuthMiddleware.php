<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class AuthMiddleware
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
        if (Auth::user()->user_type == 2) {
            return redirect('donardashboard');
        } else if(Auth::user()->user_type == 3) {
            return redirect('seekerdashboard');
        }

        return $next($request);
    }
}
