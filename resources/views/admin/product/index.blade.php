@extends('layouts.admin')
@section('content')

<div style="margin-bottom: 10px;" class="row">
    <div class="col-lg-12">
        @can('Product_create')
        <a class="btn btn-success" href="{{ url('admin/product/create') }}">
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
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script>
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
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
                        "data": "image",
                        className: "text-center"
                    },
                    {
                        "data": "name"
                    },
                    {
                        "data": "category_name"
                    },
                    {
                        "data": "cost"
                    },
                    {
                        "data": "discount"
                    },{
                        "data": "price",
                        className: "text-center"
                    }
                    ,{
                        "data": "details",
                        className: "text-center"
                    },
                    {
                        "data": "id",
                        className: "text-center"
                    }
                ],

                "columnDefs": [{
                    "targets": -1,
                    "data": "id",
                    "render": function(data, type, row, meta) {

                        return '<a href="{{ Request::url() }}/edit/' + data +
                            '" class="btn btn-xs btn-info"><i class="fa fa-edit" aria-hidden="true"></i></a>' +
                            '<a href="javascript:;" data-id=' + data +
                            ' class="btn btn-xs btn-danger delete-action"><i class="fa fa-trash" aria-hidden="true"></i></a>';
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