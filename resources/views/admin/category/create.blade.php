@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        Add Category
    </div>

    <div class="card-body">
        <form action="{{ url('admin/category/save') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group ">
                <label for="name">Category Name*</label>
                <input type="text" id="name" name="category_name" class="form-control" value="" required>

            </div>

            <div class="form-group ">
                <label for="name">Image</label>
                <input type="file" id="file" name="file" class="form-control" value="" required>
            </div>

            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection