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

Route::get('/relations/omake', ['as' => 'omake', 'uses' => 'Web\RelationsController@omakeAction']);
Route::get('/relations/morphedByMany', ['as' => 'morphedByMany', 'uses' => 'Web\RelationsController@morphedByManyAction']);
Route::get('/relations/morphMany', ['as' => 'morphMany', 'uses' => 'Web\RelationsController@morphManyAction']);
Route::get('/relations/morphOne', ['as' => 'morphOne', 'uses' => 'Web\RelationsController@morphOneAction']);
Route::get('/relations/hasManyThrough', ['as' => 'hasManyThrough', 'uses' => 'Web\RelationsController@hasManyThroughAction']);
Route::get('/relations/hasOneThrough', ['as' => 'hasOneThrough', 'uses' => 'Web\RelationsController@hasOneThroughAction']);
Route::get('/relations/manybymany', ['as' => 'manybymany', 'uses' => 'Web\RelationsController@manybyManyAction']);
Route::get('/relations/onebymany', ['as' => 'onebymany', 'uses' => 'Web\RelationsController@onebyManyAction']);
Route::get('/relations/onebyone', ['as' => 'onebyone', 'uses' => 'Web\RelationsController@onebyoneAction']);
Route::get('/relations', ['as' => 'relations_top', 'uses' => 'Web\TopController@indexAction']);


Route::post('/recover', ['as' => 'top_recover', 'uses' => 'Web\TopController@recoverAction']);
Route::post('/delete', ['as' => 'top_delete', 'uses' => 'Web\TopController@deleteAction']);
Route::post('/publish', ['as' => 'top_publish', 'uses' => 'Web\TopController@publishAction']);
Route::get('/get_image', ['as' => 'top_get_image', 'uses' => 'Web\TopController@getImageAction']);
Route::post('/upload', ['as' => 'top_upload', 'uses' => 'Web\TopController@uploadAction']);
Route::get('/', ['as' => 'top_index', 'uses' => 'Web\TopController@indexAction']);
