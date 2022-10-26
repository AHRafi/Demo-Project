<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use File;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index()
    {
        $data = array();
        $data['product'] = DB::table('product')->count();
        $data['category'] = DB::table('category')->count();
        


        return view('home', ['data' => $data]);
    }

    public function homePage(Request $request)
    {
        if ($request->isMethod('post')) {
            $resData =  $this->homePageDataSave($request);
        }
        $data = array();
        $data = DB::table('home_page')->where('id', 1)->first();

        return view('admin/pages/home', ['data' => $data]);
    }

    public function homePageDataSave($data = null)
    {
        unset($data['_token']);
        $insertData = json_encode($data->all());
        $pushData = array(
            'slider' =>  $insertData,
        );
        $res = DB::table('home_page')->where('id', 1)->update($pushData);
        return $res;
    }
}
