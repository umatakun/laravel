<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::post('/recover', ['as' => 'top_recover', 'uses' => 'Web\TopController@recoverAction']);
Route::post('/delete', ['as' => 'top_delete', 'uses' => 'Web\TopController@deleteAction']);
Route::post('/publish', ['as' => 'top_publish', 'uses' => 'Web\TopController@publishAction']);
Route::get('/get_image', ['as' => 'top_get_image', 'uses' => 'Web\TopController@getImageAction']);
Route::post('/upload', ['as' => 'top_upload', 'uses' => 'Web\TopController@uploadAction']);
Route::get('/', ['as' => 'top_index', 'uses' => 'Web\TopController@indexAction']);
