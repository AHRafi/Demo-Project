@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        Edit Product
    </div>

    <div class="card-body">
        <form action="{{ url('admin/product/update') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group ">
                <label for="name">Product Name</label>
                <input type="text" id="service_name" name="service_name" class="form-control"
                    value="{{ $data->name ?? '' }}" required>
                <input type="hidden" id="service_name" name="id" class="form-control"
                    value="{{ $data->id ?? '' }}">


            </div>

            <div class="form-group ">
                <label for="name">Product Category</label>
                <select id="category_name" name="category_name" class="form-control" value="{{ $data->category_name }}"
                    required>
                    <option value>Select an option</option>
                    @foreach ($category as $val)
                    <option value="{{ $val->category_id }}"
                        {{ ($val->category_id) == $data->category_name ? 'selected' : '' }}>{{ $val->category_name }}
                    </option>
                    @endforeach

                </select>

            </div>
            <div class="form-group ">
                <label for="name">Product Cost</label>
                <input type="number" id="service_cost" name="service_cost" class="form-control"
                    value="{{ $data->cost ?? '' }}" required>
            </div>
            <div class="form-group ">
                <label for="name">Product Price</label>
                <input type="number" id="price" name="price" class="form-control" value="{{ $data->price ?? '' }}"
                    required>
            </div>
            <div class="form-group ">
                <label for="name">Discount</label>
                <input type="number" id="discount" name="discount" class="form-control"
                    value="{{ $data->discount ?? '' }}" required>
            </div>
            <div class="form-group ">
                <label for="name">Details</label>
                <textarea type="text" id="details" name="details" class="form-control"
                    value="">{{ $data->details ?? '' }}</textarea>
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