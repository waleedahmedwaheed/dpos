{{--<!doctype html>--}}
{{--<html lang="{{ config('app.locale') }}">--}}
    {{--<head>--}}
        {{--<meta charset="utf-8">--}}
        {{--<meta http-equiv="X-UA-Compatible" content="IE=edge">--}}
        {{--<meta name="viewport" content="width=device-width, initial-scale=1">--}}

        {{--<title>{{ config('app.name', 'ultimatePOS') }}</title>--}}

        {{--<!-- Fonts -->--}}
        {{--<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,600" rel="stylesheet" type="text/css">--}}

        {{--<!-- Styles -->--}}
        {{--<style>--}}
            {{--html, body {--}}
                {{--background-color: #fff;--}}
                {{--color: #636b6f;--}}
                {{--font-family: 'Raleway', sans-serif;--}}
                {{--font-weight: 100;--}}
                {{--height: 100vh;--}}
                {{--margin: 0;--}}
                {{--background-color: #ffffff;--}}
                {{--background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%239C92AC' fill-opacity='0.12'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");--}}
            {{--}--}}

            {{--.full-height {--}}
                {{--height: 100vh;--}}
            {{--}--}}

            {{--.flex-center {--}}
                {{--align-items: center;--}}
                {{--display: flex;--}}
                {{--justify-content: center;--}}
            {{--}--}}

            {{--.position-ref {--}}
                {{--position: relative;--}}
            {{--}--}}

            {{--.top-right {--}}
                {{--position: absolute;--}}
                {{--right: 10px;--}}
                {{--top: 18px;--}}
            {{--}--}}

            {{--.content {--}}
                {{--text-align: center;--}}
            {{--}--}}

            {{--.title {--}}
                {{--font-size: 84px;--}}
            {{--}--}}

            {{--.links > a {--}}
                {{--color: #636b6f;--}}
                {{--padding: 0 25px;--}}
                {{--font-size: 12px;--}}
                {{--font-weight: 600;--}}
                {{--letter-spacing: .1rem;--}}
                {{--text-decoration: none;--}}
                {{--text-transform: uppercase;--}}
            {{--}--}}

            {{--.m-b-md {--}}
                {{--margin-bottom: 30px;--}}
            {{--}--}}

            {{--.tagline{--}}
                {{--font-size:25px;--}}
                {{--font-weight: 300;--}}
            {{--}--}}
        {{--</style>--}}
    {{--</head>--}}
    {{--<body>--}}
        {{--<div class="flex-center position-ref full-height">--}}
            {{--<div class="top-right links">--}}

                {{--@if (Route::has('login'))--}}
                    {{--@if (Auth::check())--}}
                        {{--<a href="{{ action('HomeController@index') }}">@lang('home.home')</a>--}}
                    {{--@else--}}
                        {{--<a href="{{ action('Auth\LoginController@login') }}">@lang('lang_v1.login')</a>--}}
                        {{--@if(env('ALLOW_REGISTRATION', true))--}}
                            {{--<a href="{{ route('business.getRegister') }}">@lang('lang_v1.register')</a>--}}
                        {{--@endif--}}
                    {{--@endif--}}
                {{--@endif--}}

                {{--@if(Route::has('pricing') && config('app.env') != 'demo')--}}
                    {{--<a href="{{ action('\Modules\Superadmin\Http\Controllers\PricingController@index') }}">@lang('superadmin::lang.pricing')</a>--}}
                {{--@endif--}}
            {{--</div>--}}

            {{--<div class="content">--}}
                {{--<div class="title m-b-md" style="font-weight: 600 !important">--}}
                    {{--{{ config('app.name', 'ultimatePOS') }}--}}
                {{--</div>--}}
                {{--<p class="tagline">--}}
                    {{--{{ env('APP_TITLE', '') }}--}}
                {{--</p>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</body>--}}
{{--</html>--}}

@extends('layouts.auth')
@section('title', __('lang_v1.login'))

@section('content')

<style>
    .panel-default>.panel-heading {
        color: #fff !important;
        background-color: darkslategray !important;
        border-color: #ddd !important;
    }
    .panel-body {
        background: #F7F7F7 !important;
    }
</style>

    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">@lang('lang_v1.login')</div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="POST" action="{{ route('login') }}">
                            {{ csrf_field() }}

                            <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                                <label for="username" class="col-md-4 control-label">@lang('lang_v1.username')</label>

                                <div class="col-md-6">
                                    @php
                                        $username = old('username');
                                        $password = null;
                                        if(config('app.env') == 'demo'){
                                            $username = 'admin';
                                            $password = '123456';

                                            $demo_types = array(
                                                'all_in_one' => 'admin',
                                                'super_market' => 'admin',
                                                'pharmacy' => 'admin-pharmacy',
                                                'electronics' => 'admin-electronics',
                                                'services' => 'admin-services',
                                                'restaurant' => 'admin-restaurant',
                                                'superadmin' => 'superadmin',
                                                'woocommerce' => 'woocommerce_user'
                                            );
                                            if( !empty($_GET['demo_type']) && array_key_exists($_GET['demo_type'], $demo_types) ){
                                                $username = $demo_types[$_GET['demo_type']];
                                            }
                                        }
                                    @endphp
                                    <input id="username" type="text" class="form-control" name="username" value="{{ $username }}" required autofocus>

                                    @if ($errors->has('username'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                <label for="password" class="col-md-4 control-label">@lang('lang_v1.password')</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" name="password"
                                           value="{{ $password }}" required>

                                    @if ($errors->has('password'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> @lang('lang_v1.remember_me')
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-8 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        @lang('lang_v1.login')
                                    </button>
                                    @if(config('app.env') != 'demo')
                                        <a class="btn btn-link" href="{{ route('password.request') }}">
                                            @lang('lang_v1.forgot_your_password')
                                        </a>
                                    @endif
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
       {{-- <div class="row">
            <div class="col-md-12">
                <div class="header-left-div">
                    <select class="form-control input-sm" id="change_lang">
                        @foreach(config('constants.langs') as $key => $val)
                            <option value="{{$key}}"
                                    @if( (empty(request()->lang) && config('app.locale') == $key)
                                    || request()->lang == $key)
                                    selected
                                    @endif
                            >
                                {{$val}}
                            </option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>--}}
        @if(config('app.env') == 'demo')
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4>Demo Shops <small><i> Demos are for example purpose only, this application <u>can be used in many other similar businesses.</u></i></small></h4></div>
                        <div class="panel-body">
                            <div class="col-md-12 text-center">
                                <a href="?demo_type=all_in_one" class="btn btn-app bg-olive" data-toggle="tooltip" title="Showcases all feature available in the application." >
                                    <i class="fa fa-star"></i>
                                    All In One</a>
                                <a href="?demo_type=pharmacy" class="btn bg-maroon btn-app" data-toggle="tooltip" title="Shops with products having expiry dates." >
                                    <i class="fa fa-medkit"></i>
                                    Pharmacy</a>
                                <a href="?demo_type=services" class="btn bg-orange btn-app" data-toggle="tooltip" title="For all service providers like Web Development, Restaurants, Repairing, Plumber, Salons, Beauty Parlors etc.">
                                    <i class="fa fa-wrench"></i>
                                    Multi-Service Center</a>
                                <a href="?demo_type=electronics" class="btn bg-purple btn-app" data-toggle="tooltip" title="Products having IMEI or Serial number code." >
                                    <i class="fa fa-laptop"></i>
                                    Electronics & Mobile Shop</a>
                                <a href="?demo_type=super_market" class="btn bg-navy btn-app" data-toggle="tooltip" title="Super market & Similar kind of shops." >
                                    <i class="fa fa-shopping-cart"></i>
                                    Super Market</a>
                                <a href="?demo_type=restaurant" class="btn bg-red btn-app" data-toggle="tooltip" title="Restaurants, Salons and other similar kind of shops." >
                                    <i class="fa fa-cutlery"></i>
                                    Restaurant</a>
                            </div>

                            <div class="col-md-12">
                                <hr>
                            </div>
                            <div class="col-md-12">
                                <div class="alert alert-success alert-dismissible">
                                    <i class="icon fa fa-plug"></i> Premium optional modules:
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <a href="?demo_type=superadmin" class="btn bg-red-active btn-app" data-toggle="tooltip" title="SaaS & Superadmin extension Demo">
                                    <i class="fa fa-university"></i>
                                    SaaS / Superadmin</a>

                                <a href="?demo_type=woocommerce" class="btn bg-woocommerce btn-app" data-toggle="tooltip" title="WooCommerce demo user - Open web shop in minutes!!" style="color:white !important">
                                    <i class="fa fa-wordpress"></i>
                                    WooCommerce</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endif
    </div>
@stop
@section('javascript')
    <script type="text/javascript">
        $(document).ready(function(){
            $('#change_lang').change( function(){
                window.location = "{{ route('login') }}?lang=" + $(this).val();
            });
        })
    </script>
@endsection
