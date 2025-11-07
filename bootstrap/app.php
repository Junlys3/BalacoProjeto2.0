<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->web(append: [
            // 1. Inicia a Sessão (Onde os erros ficam)
            \Illuminate\Session\Middleware\StartSession::class,
            
            // 2. Compartilha os Erros da Sessão (Necessário para o Inertia)
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            
            // 3. Middleware do Inertia (Este é o seu HandleInertiaRequests.php)
            \App\Http\Middleware\HandleInertiaRequests::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
