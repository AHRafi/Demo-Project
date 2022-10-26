<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use File;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController
{
    public function index()
    {
        $data = array();
        $servicedata = DB::table('services')->orderBy('service_id', 'DESC')->take(3)->get();

        return view('home/index', compact('servicedata'));
    }

    public function service()
    {
        $data = array();
        $servicedata = DB::table('services')->orderBy('service_id', 'DESC')->get();

        return view('home/service', compact('servicedata'));
    }

    public function categories()
    {
        $data = array();
        $servicedata = DB::table('category')->orderBy('category_id', 'DESC')->get();

        return view('home/category', compact('servicedata'));
    }

    public function serviceDetails($id)
    {
        $data = array();
        $servicedata = DB::table('services')->where('service_id', $id)->first();

        return view('home/serviceDetails', compact('servicedata', 'data'));
    }

    public function appointment($name = null, $id = null)
    {
        if ($name == "service") {
            $data = 'service';
            $servicedata = DB::table('services')->where('service_id', $id)->get();

            return view('home/appointment', compact('servicedata', 'data'));
        } else if ($name == "package") {

            $data = 'package';
            $servicedata = DB::table('package')->where('id', $id)->get();

            return view('home/appointment', compact('servicedata', 'data'));
        } else {
            $data = 'all';
            $servicedata = DB::table('services')->orderBy('service_id', 'DESC')->get();

            return view('home/appointment', compact('servicedata', 'data'));
        }
    }
}