<aside class="main-sidebar sidebar-dark-primary elevation-4" style="min-height: 917px;">
    <!-- Brand Logo -->
    <a href="{{ url('admin/') }}" class="brand-link">
        <span class="brand-text font-weight-light">Dashboard</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                @can('dashboard_access')
                <li class="nav-item">
                    <a href="{{ url('/admin') }}" class="nav-link {{ request()->is('admin') ? 'active' : '' }}">
                        <i class="fa-fw fas fa-chart-line">

                        </i>
                        <p>
                            <span>Dashboard</span>
                        </p>
                    </a>
                </li>
                @endcan


                


                @can('Category_access')
                <li class="nav-item has-treeview ">
                    <a class="nav-link nav-dropdown-toggle" href="#">
                        <i class="fa-fw fas fa-users">

                        </i>
                        <p>
                            <span>Category</span>
                            <i class="right fa fa-fw fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('Category_create')
                        <li class="nav-item">
                            <a href="{{ url('admin/category/create')}}" class="nav-link ">
                                <i class="fa-fw fas fa-unlock-alt">

                                </i>
                                <p>
                                    <span>Add Category</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('Category_show')
                        <li class="nav-item">
                            <a href="{{ url('admin/category')}}" class="nav-link ">
                                <i class="fa-fw fas fa-unlock-alt">

                                </i>
                                <p>
                                    <span>Manage Category</span>
                                </p>
                            </a>
                        </li>
                        @endcan


                    </ul>
                </li>
                @endcan

                
                @can('Product_access')
                <li class="nav-item has-treeview ">
                    <a class="nav-link nav-dropdown-toggle" href="#">
                        <i class="fa-fw fas fa-users">

                        </i>
                        <p>
                            <span>Product</span>
                            <i class="right fa fa-fw fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('Product_create')
                        <li class="nav-item">
                            <a href="{{ url('admin/product/create')}}" class="nav-link ">
                                <i class="fa-fw fas fa-unlock-alt">

                                </i>
                                <p>
                                    <span>Add Product</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('Product_show')
                        <li class="nav-item">
                            <a href="{{ url('admin/product')}}" class="nav-link ">
                                <i class="fa-fw fas fa-unlock-alt">

                                </i>
                                <p>
                                    <span>Manage Product</span>
                                </p>
                            </a>
                        </li>
                        @endcan

                    </ul>
                </li>
                @endcan

                

                @can('user_management_access')
                <li
                    class="nav-item has-treeview {{ request()->is('admin/permissions*') ? 'menu-open' : '' }} {{ request()->is('admin/roles*') ? 'menu-open' : '' }} {{ request()->is('admin/users*') ? 'menu-open' : '' }}">
                    <a class="nav-link nav-dropdown-toggle" href="#">
                        <i class="fa-fw fas fa-users">

                        </i>
                        <p>
                            <span>{{ trans('cruds.userManagement.title') }}</span>
                            <i class="right fa fa-fw fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('permission_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.permissions.index") }}"
                                class="nav-link {{ request()->is('admin/permissions') || request()->is('admin/permissions/*') ? 'active' : '' }}">
                                <i class="fa-fw fas fa-unlock-alt">

                                </i>
                                <p>
                                    <span>{{ trans('cruds.permission.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('role_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.roles.index") }}"
                                class="nav-link {{ request()->is('admin/roles') || request()->is('admin/roles/*') ? 'active' : '' }}">
                                <i class="fa-fw fas fa-briefcase">

                                </i>
                                <p>
                                    <span>{{ trans('cruds.role.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('user_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.users.index") }}"
                                class="nav-link {{ request()->is('admin/users') || request()->is('admin/users/*') ? 'active' : '' }}">
                                <i class="fa-fw fas fa-user">

                                </i>
                                <p>
                                    <span>{{ trans('cruds.user.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                    </ul>
                </li>
                @endcan

               

                <li class="nav-item">
                    <a href="#" class="nav-link"
                        onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                        <p>
                            <i class="fas fa-fw fa-sign-out-alt">

                            </i>
                            <span>{{ trans('global.logout') }}</span>
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>