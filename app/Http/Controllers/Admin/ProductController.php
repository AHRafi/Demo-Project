<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use File;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{

    public function index(Request $request){        
        $model = DB::table('product');
        $data['model'] = $model;
        if ($request->isMethod('get')) {
            return view('admin.product.index', ['data' => $data]);
        }

        

        

        $recordsTotal = (clone $data['model'])->count();

        $data['model'] = $data['model']->offset($request->start)
            ->limit($request->length)->orderby('id', 'desc')->get();
       

        $sl = (int)$request->start + 1;
        foreach ($data['model'] as $key => $value) {
            $data['model'][$key]->sl = $sl++;
            $data['model'][$key]->id = $value->id;
            $data['model'][$key]->category_name = DB::table('category')->where('category_id',$value->category_name)->first()->category_name;
            $data['model'][$key]->discount = $value->discount."%";
            $data['model'][$key]->image = '<img src="'.url($value->image).'" style="height:40px;width:60px">';
            
        }




        $data = array(
            "draw"             => $request->draw,
            "recordsTotal"     => $recordsTotal,
            "recordsFiltered"  => $recordsTotal,
            "data"             => $data['model']
        );

        return response()->json($data);
    }

    public function create()
    {
        $data = array();
        $data = DB::table('category')->select('category_id', 'category_name')->get();

        return view('admin.product.create', compact('data'));
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
            'name' => $request->service_name,
            'category_name' => $request->category_name,
            'price' => $request->price,
            'cost' => $request->service_cost,
            'discount' => $request->discount,
            'details' => $request->details,
            'image' => $targetPath,
        );

        $msg = DB::table('product')->insert($insertArray);
        return redirect('admin/product');
    }

    public function edit($id)
    {

        $data = array();
        $data = DB::table('product')->where('id', $id)->first();
        $category = DB::table('category')->select('category_id', 'category_name')->get();


        return view('admin.product.edit', compact('data', 'category'));
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
            $insertArray = array(
                'name' => $request->service_name,
                'category_name' => $request->category_name,
                'price' => $request->price,
                'cost' => $request->service_cost,
                'discount' => $request->discount,
                'details' => $request->details,
            );
        } else {
            $insertArray = array(
                'name' => $request->service_name,
                'category_name' => $request->category_name,
                'price' => $request->price,
                'cost' => $request->service_cost,
                'discount' => $request->discount,
                'details' => $request->details,
                'image' => $targetPath,
            );
        }



        $msg = DB::table('product')->where('id', $request->id)->update($insertArray);

        return redirect('admin/product');
    }

    public function show(Request $request)
    {


        return view('admin.product.show', compact('user'));
    }

    
     // Damage item delete 
     public function delete(Request $request) {
        DB::beginTransaction();

        try
        {
            $data_id = $request->id;
            DB::table('product')->where("id",$data_id)->delete();

            DB::commit();

            $notification = array(
                'responseTitle'  => 'success',
                'responseText'   => 'Item deleted successfully!!'
            );
            return response()->json($notification);

        }
        catch (\Exception $e)
        {
            DB::rollback();

            $notification = array(
                'responseTitle'  => 'error',
                'responseText'   => 'Something went wrong',
                'consoleMsg'     => $e->getFile() . ' ' . $e->getLine() . ' ' . $e->getMessage(),
            );

            return response()->json($notification);
        }
    }
}
