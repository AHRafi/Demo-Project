@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.edit') }} {{ trans('cruds.user.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.users.update", [$user->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.user.fields.name') }}*</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($user) ? $user->name : '') }}" required>
                <input type="hidden" id="autoid" name="autoid" class="form-control" value="{{ $user->id }}" required>
                @if($errors->has('name'))
                    <p class="help-block">
                        {{ $errors->first('name') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            <!-- <div class="form-group {{ $errors->has('image') ? 'has-error' : '' }}">
                <label for="name">Image*</label>
                <input type="text" id="name" name="image" class="form-control" value="{{ old('image', isset($user) ? $user->image : '') }}" required>
                @if($errors->has('image'))
                    <p class="help-block">
                        {{ $errors->first('image') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div> -->
            <div class="form-group {{ $errors->has('mobile') ? 'has-error' : '' }}">
                <label for="name">Mobile*</label>
                <input type="text" id="mobile" name="mobile" class="form-control" value="{{ old('mobile', isset($user) ? $user->mobile : '') }}" required>
                @if($errors->has('mobile'))
                    <p class="help-block">
                        {{ $errors->first('mobile') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('designation') ? 'has-error' : '' }}">
                <label for="name">Designation*</label>
                <input type="text" id="name" name="designation" class="form-control" value="{{ old('designation', isset($user) ? $user->designation : '') }}" required>
                @if($errors->has('designation'))
                    <p class="help-block">
                        {{ $errors->first('designation') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('designation') ? 'has-error' : '' }}">
                <label for="name">Address*</label>
                <input type="text" id="address" name="address" class="form-control" value="{{ old('address', isset($user) ? $user->address : '') }}" required>
                @if($errors->has('address'))
                    <p class="help-block">
                        {{ $errors->first('address') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            
            <div class="form-group {{ $errors->has('branch') ? 'has-error' : '' }}">
                <label for="name">Branch*</label>
                <input type="text" id="branch" name="branch" class="form-control" value="{{ old('branch', isset($user) ? $user->branch : '') }}" required>
                @if($errors->has('branch'))
                    <p class="help-block">
                        {{ $errors->first('branch') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('emergency_contact') ? 'has-error' : '' }}">
                <label for="name">Emergency Contact*</label>
                <input type="text" id="emergency_contact" name="emergency_contact" class="form-control" value="{{ old('emergency_contact', isset($user) ? $user->emergency_contact : '') }}" required>
                @if($errors->has('emergency_contact'))
                    <p class="help-block">
                        {{ $errors->first('emergency_contact') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('emergency_mobile') ? 'has-error' : '' }}">
                <label for="name">Emergency Mobile*</label>
                <input type="text" id="emergency_mobile" name="emergency_mobile" class="form-control" value="{{ old('branch', isset($user) ? $user->emergency_mobile : '') }}" required>
                @if($errors->has('emergency_mobile'))
                    <p class="help-block">
                        {{ $errors->first('emergency_mobile') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.name_helper') }}
                </p>
            </div>
            
            <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
                <label for="email">{{ trans('cruds.user.fields.email') }}*</label>
                <input type="email" id="email" name="email" class="form-control" value="{{ old('email', isset($user) ? $user->email : '') }}" required>
                @if($errors->has('email'))
                    <p class="help-block">
                        {{ $errors->first('email') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.email_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('password') ? 'has-error' : '' }}">
                <label for="password">{{ trans('cruds.user.fields.password') }}</label>
                <input type="password" id="password" name="password" class="form-control">
                @if($errors->has('password'))
                    <p class="help-block">
                        {{ $errors->first('password') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.password_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('roles') ? 'has-error' : '' }}">
                <label for="roles">{{ trans('cruds.user.fields.roles') }}*
                    <span class="btn btn-info btn-xs select-all">{{ trans('global.select_all') }}</span>
                    <span class="btn btn-info btn-xs deselect-all">{{ trans('global.deselect_all') }}</span></label>
                <select name="roles[]" id="roles" class="form-control select2" multiple="multiple" required>
                    @foreach($roles as $id => $roles)
                        <option value="{{ $id }}" {{ (in_array($id, old('roles', [])) || isset($user) && $user->roles->contains($id)) ? 'selected' : '' }}>{{ $roles }}</option>
                    @endforeach
                </select>
                @if($errors->has('roles'))
                    <p class="help-block">
                        {{ $errors->first('roles') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.user.fields.roles_helper') }}
                </p>
            </div>
            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection