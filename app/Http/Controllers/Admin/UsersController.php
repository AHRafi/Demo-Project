<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Role;
use App\User;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Hash;


class UsersController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::where('is_admin', 1)->orWhereNull('is_admin')->get();

        return view('admin.users.index', compact('users'));
    }

    public function customers()
    {


        $users = User::where('is_admin', 0)->orWhereNull('is_admin')->get();

        return view('admin.customers.index', compact('users'));
    }



    public function create()
    {
        abort_if(Gate::denies('user_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $roles = Role::all()->pluck('title', 'id');

        return view('admin.users.create', compact('roles'));
    }

    public function store(StoreUserRequest $request)
    {
        unset($request['_token']);
        // dd($request->all());
        
        $user = User::create($request->all());
        $user->roles()->sync($request->input('roles', []));

        return redirect()->route('admin.users.index');
    }

    public function edit(User $user)
    {

        abort_if(Gate::denies('user_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $roles = Role::all()->pluck('title', 'id');

        $user->load('roles');

        return view('admin.users.edit', compact('roles', 'user'));
    }

    public function update(UpdateUserRequest $request, User $user)
    {

        $autoid = $request->autoid;
        $name = $request->name;
        $mobile = $request->mobile;
        $designation = $request->designation;
        $address = $request->address;
        $branch = $request->branch;
        $emergency_contact = $request->emergency_contact;
        $emergency_mobile = $request->emergency_mobile;
        $email = $request->email;
        $password = $request->password;

        $data = User::where('id', $autoid)->update([

            'name' => $name,
            'email' => $email,
            'mobile' => $mobile,
            'designation' => $designation,
            'branch' => $branch,
            'emergency_contact' => $emergency_contact,
            'emergency_mobile' => $emergency_mobile,
            'address' => $address,
            'password' => ($password) ? Hash::make($password) : '',
        ]);

        $user->roles()->sync($request->input('roles', []));

        return redirect()->route('admin.users.index');
    }

    public function show(User $user)
    {
        abort_if(Gate::denies('user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->load('roles');

        return view('admin.users.show', compact('user'));
    }

    public function destroy(User $user)
    {
        abort_if(Gate::denies('user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->delete();

        return back();
    }

    public function massDestroy(MassDestroyUserRequest $request)
    {
        User::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}