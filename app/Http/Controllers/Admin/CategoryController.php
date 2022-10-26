<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use File;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{


    public function index()
    {
        $data = array();
        $data = DB::table('category')->get();

        return view('admin.category.index', compact('data'));
    }

    public function create()
    {
        $data = array();

        return view('admin.category.create', compact('data'));
    }

    public function save(Request $request)
    {

        $targetPath = '';
        if ($_FILES['file']['error'] == 0) {
            $uploaded_name = $_FILES['file']['name'];
            $uploaded_ext  = substr($uploaded_name, strrpos($uploaded_name, '.') + 1);
            $fileEtsn = strtolower($uploaded_ext);
            $data_id = $request->data_id;
            $target_dir = 'public/assets/img/admin/';

            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }

            $sourcePath = $_FILES['file']['tmp_name'];
            $targetPath = $target_dir . $uploaded_name;

            $res = move_uploaded_file($sourcePath, $targetPath);
        }

        $insertArray = array(
            'category_name' => $request->category_name,
            'image' => $targetPath,
        );

        $msg = DB::table('category')->insert($insertArray);
        return redirect('admin/category');
    }

    public function edit($id)
    {

        $data = array();
        $data = DB::table('category')->where('category_id', $id)->first();

        return view('admin.category.edit', compact('data'));
    }

    public function update(Request $request)
    {

        $targetPath = '';
        if ($_FILES['file']['error'] == 0) {
            $uploaded_name = $_FILES['file']['name'];
            $uploaded_ext  = substr($uploaded_name, strrpos($uploaded_name, '.') + 1);
            $fileEtsn = strtolower($uploaded_ext);
            $data_id = $request->data_id;
            $target_dir = 'public/assets/img/admin/';

            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }

            $sourcePath = $_FILES['file']['tmp_name'];
            $targetPath = $target_dir . $uploaded_name;

            $res = move_uploaded_file($sourcePath, $targetPath);
        }

        if ($targetPath == '') {
            $updateArray = array(
                'category_name' => $request->category_name,
            );
        } else {
            $updateArray = array(
                'category_name' => $request->category_name,
                'image' => $targetPath,
            );
        }

        $msg = DB::table('category')->where('category_id', $request->id)->update($updateArray);

        return redirect('admin/category');
    }

    public function show(Request $request)
    {


        return view('admin.users.show', compact('user'));
    }

    public function delete($id)
    {

        $msg = DB::table('category')->where('category_id', $id)->delete();
        return redirect('admin/category');
    }
}