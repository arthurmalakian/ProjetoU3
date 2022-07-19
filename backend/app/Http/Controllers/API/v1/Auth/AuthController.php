<?php

namespace App\Http\Controllers\API\v1\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use App\Services\Auth\AuthServiceImpl as AuthService;

class AuthController extends Controller
{
    /**
     * Login request.
     * @param  App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function login(LoginRequest $request)
    {
        $authService = app(AuthService::class);
        $response = $authService->login($request->email,$request->password);
        return response($response,$response['code']);
    }

    /**
     * Logout.
     *
     * @return \Illuminate\Http\Response
     */
    public function logout()
    {
        $authService = app(AuthService::class);
        $response = $authService->logout();
        return response($response,$response['code']);
    }

    /**
     * Register new user.
     *
     * @param  App\Http\Requests\Auth\RegisterRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function register(RegisterRequest $request)
    {
        $authService = app(AuthService::class);
        $data = $request->only('name','email');
        $data['password'] = bcrypt($request->password);
        $response = $authService->register($data);
        return response($response,$response['code']);
    }
}
