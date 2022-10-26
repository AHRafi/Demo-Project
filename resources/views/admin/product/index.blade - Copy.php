@extends('layouts.admin')
@section('content')

<div style="margin-bottom: 10px;" class="row">
    <div class="col-lg-12">
        @can('Product_create')
        <a class="btn btn-success" href="{{ url('admin/service/create') }}">
            Add Product
        </a>
        @endcan
    </div>
</div>

<div class="card">
    <div class="card-header">
        Product List
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-User data-table" id="datatable">
                <thead>
                    <tr>
                        <th width="10"> #</th>
                        <th> Image</th>
                        <th> Product Name</th>
                        <th> Category Name</th>
                        <th> Product Cost</th>
                        <th> Discount</th>
                        <th> Price</th>
                        <th> Details</th>

                        <th> Action</th>
                    </tr>
                </thead>
                <tbody>
                    @php $cc = 0; @endphp
                    @foreach($data as $key => $val)
                    @php $cc++; @endphp
                    <tr data-entry-id="{{ $val->service_id  }}">
                        <td>{{ $cc }}</td>
                        <td>
                            <img src="{{url($val->image)}}" class="social-icon" style="height:60px;width:60px">

                        </td>
                        <td>{{ $val->service_name ?? '' }}</td>
                        <td>{{ $val->category_name ?? '' }}</td>
                        <td>{{ $val->service_cost ?? '' }}</td>
                        <td>{{ $val->discount ?? '' }}%</td>
                        <td>
                            @php
                            $discountval = number_format(($val->price*$val->discount)/100);
                            $discountprice = $val->price - $discountval;
                            @endphp
                            @if($discountval > 0 )
                            <strike style="color:red;">{{ $val->price ?? '' }}</strike>
                            <b style="color:green;"> {{ $discountprice ?? '' }} Tk </b>
                            @else
                            <b style="color:green;"> {{ $val->price ?? '' }} Tk </b>
                            @endif
                        </td>
                        <td>{{ $val->details ?? '' }}</td>

                        <td>
                            @can('Product_edit')
                            <a class="btn btn-xs btn-info" href="{{ url('admin/service/edit/'.$val->service_id )}}">
                                edit
                            </a>
                            @endcan
                            @can('Product_delete')
                            <a class="btn btn-xs btn-danger" href="{{ url('admin/service/delete/'.$val->service_id )}}">
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
<script>
        $(document).ready(function() {

            var dataTable = $('#datatable').DataTable({
                "sDom": "ltipr", // For removeing default Search bar //
                "processing": true,
                "serverSide": true,
                "ordering": false,

                "ajax": {
                    "url": "{{ Request::url() }}",
                    "type": "POST",
                    "data": function(d) {
                        var inputs = {};
                        d.filter = inputs;
                    }
                },

                "columns": [{
                        "data": "sl"
                    },
                    {
                        "data": "name",
                        className: "text-center"
                    },
                    {
                        "data": "name"
                    },
                    {
                        "data": "name",
                        className: "text-align-right"
                    },
                    {
                        "data": "name",
                        className: "text-align-right"
                    },
                    {
                        "data": "name"
                    },
                    {
                        "data": "name",
                        className: "text-center"
                    },{
                        "data": "name",
                        className: "text-center"
                    }
                    ,{
                        "data": "name",
                        className: "text-center"
                    }
                ],

                "columnDefs": [{
                    "targets": -1,
                    "data": "id",
                    "render": function(data, type, row, meta) {

                        return '--';
                    }
                }]


            });

            $("#searchForm").submit(function(e) {
                e.preventDefault();
                dataTable.draw();
            });



             //delete function
            $(document).on('click', '.delete-action', function() {
                
                Swal.fire({
                  title: 'Are you sure?',
                  text: "Once delete you won't be able to revert this!",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#d33',
                  cancelButtonColor: '#7e7979',
                  confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                  if (result.isConfirmed) {

                    $.ajax({
                        type: 'post',
                        url: '{{ Request::url() }}/delete',
                        data: {
                          '_token': $('input[name=_token]').val(),
                          'id': $(this).data('id')
                        },
                        success: function(_response) {
                          if(_response.responseTitle == 'success') {
                            Swal.fire({
                              icon: 'success',
                              title: 'Deleted!',
                              text: 'This data has been deleted.',
                              showConfirmButton: false,
                              timer: 1500
                            })

                            setTimeout(function(){
                              dataTable.ajax.reload();
                            }, 1000);

                            
                          }
                          else {
                            Swal.fire({
                              icon: 'error',
                              title: 'Failed to delete!',
                              text: 'This data has not been deleted.',
                              showConfirmButton: true,
                            })
                          }

                          
                          // setTimeout(function(){
                          //   window.location.reload(1);
                          // }, 1000);
                        }
                    });

                    

                  }
                })


            });

        });
    </script>
@parent

@endsection