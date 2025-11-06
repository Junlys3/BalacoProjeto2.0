<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\Post;

Route::inertia('/', 'Home',['posts' => Post::with('user')->get()]); //Carrega os posts com os dados do usuário relacionado, visto que vue 3 precisa disso para acessar os dados do usuário em cada post ao contrario do laravel blade que acessa direto via relacionamento

route::get('details/{id}', function($id){
    $post = Post::with('user')->findorFail($id);
    return inertia::render('Details/Details', ['post' => $post] ); //Passando o prop post para a view Details via rota
});

route::inertia('posts/create', 'Posts/Create'); //Rota para criar novo post



Route::inertia('about', 'About');

Route::inertia('contact', 'Contact');