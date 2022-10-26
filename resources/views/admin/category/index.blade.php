@extends('layouts.admin')
@section('content')

<div style="margin-bottom: 10px;" class="row">
    <div class="col-lg-12">
        @can('Category_create')
        <a class="btn btn-success" href="{{ url('admin/category/create') }}">
            Add Category
        </a>
        @endcan
    </div>
</div>

<div class="card">
    <div class="card-header">
        Service Category
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-User">
                <thead>
                    <tr>
                        <th width="10">
                            #
                        </th>
                        <th>
                            Image
                        </th>
                        <th>
                            Category Name
                        </th>
                        <th>
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @php $cc = 0; @endphp
                    @foreach($data as $key => $val)
                    @php $cc++; @endphp
                    <tr data-entry-id="{{ $val->category_id }}">
                        <td>
                            {{ $cc }}
                        </td>
                        <td>
                            <img src="{{url($val->image)}}" class="social-icon" style="height:60px;width:60px">

                        </td>

                        <td>
                            {{ $val->category_name ?? '' }}
                        </td>
                        <td>
                            @can('Category_edit')
                            <a class="btn btn-xs btn-info" href="{{ url('admin/category/edit/'.$val->category_id)}}">
                                edit
                            </a>
                            @endcan

                            @can('Category_delete')
                            <a class="btn btn-xs btn-danger"
                                href="{{ url('admin/category/delete/'.$val->category_id)}}">
                                delete
                            </a>
                            @endcan


                        </td>

                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@section('scripts')
@parent

@endsection