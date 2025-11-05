<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::inertia('/', 'Home');

Route::inertia('about', 'About');

Route::inertia('contact', 'Contact');