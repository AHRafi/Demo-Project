@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        Edit Category
    </div>

    <div class="card-body">
        <form action="{{ url('admin/category/update') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group ">
                <label for="name">Category Name*</label>
                <input type="text" id="name" name="category_name" class="form-control" value="{{ $data->category_name}}"
                    required>
                <input type="hidden" id="autoid" name="id" class="form-control" value="{{ $data->category_id}}"
                    required>

            </div>

            <div class="form-group ">
                <img src="{{ url($data->image)}}" style="height:100px;width:100px"><br />
                <label for="name">New Image</label>
                <input type="file" id="file" name="file" class="form-control" value="">
            </div>

            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection