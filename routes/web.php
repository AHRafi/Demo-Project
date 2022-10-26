<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

if (version_compare(PHP_VERSION, '7.3.16', '>=')) {
    error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
}
Auth::routes();


Route::get('/admin', function () {
    return redirect('login');
});
Route::get('/', function () {
    return redirect('login');
});
//============================================
//==== for  website customers start here =====
//============================================

Route::group(['as' => 'user.', 'namespace' => 'Auth'], function () {
    Route::get('registration', 'LoginController@registration')->name('register-user');
    Route::post('custom-registration', 'LoginController@customRegistration')->name('register.custom');
});


//============================================
//=== for  website customers end here ========
//============================================


//============================================
//==== For admin routes start here =========== 
//============================================
Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth']], function () {

    // Permissions
    Route::delete('permissions/destroy', 'PermissionsController@massDestroy')->name('permissions.massDestroy');
    Route::resource('permissions', 'PermissionsController');

    // Roles
    Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');
    Route::resource('roles', 'RolesController');

    // Users 
    Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');
    Route::resource('users', 'UsersController');

    // customers 
    Route::get('customers', 'UsersController@customers')->name('customers');

    //******* projects routes start here=============
    //dashboard
    Route::get('/', 'AdminController@index')->name('admin');
    Route::any('homePage', 'AdminController@homePage')->name('homePage');

    //Category
    Route::get('/category', 'CategoryController@index')->name('category');;
    Route::get('/category/create', 'CategoryController@create');
    Route::get('/category/edit/{id}', 'CategoryController@edit');
    Route::any('/category/update', 'CategoryController@update');
    Route::any('/category/save', 'CategoryController@save');
    Route::get('/category/delete/{id}', 'CategoryController@delete');



    //service
    Route::any('/product', 'ProductController@index')->name('product.list');
    Route::get('/product/create', 'ProductController@create');
    Route::get('/product/edit/{id}', 'ProductController@edit');
    Route::any('/product/update', 'ProductController@update');
    Route::any('/product/save', 'ProductController@save');
    Route::post('/product/delete', 'ProductController@delete')->name('product.delete');

    

   

   
});

//============================================
//===== For admin routes end here ============
//============================================