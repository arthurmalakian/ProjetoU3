<?php

namespace App\Services\Auth;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthServiceImpl implements AuthService {

    public function login($email,$password)
    {
        try{
            $user = User::where('email',$email)->first();
            if(!$user || !Hash::check($password, $user->password)){
                return [
                    'message' => 'Dados de login inválidos.',
                    'code' => 401,
                    'data' => []
                ];
            }
            $token = $user->createToken('authtoken')->plainTextToken;
            return [
                'message' => 'Bem vindo!',
                'code' => 200,
                'data' => [
                    'user' => $user,
                    'token'=> $token
                ]
            ];
        }catch(\Exception $exception){
            return [
                'message' => 'Erro no login.',
                'code' => 500,
                'data' => [
                    'exception' => $exception
                ]
            ];
        }
    }
    public function logout()
    {
        try{
            Auth::user()->tokens()->delete();
            return [
                'message' => 'Deslogado',
                'code' => 200,
                'data' => []
            ];
        }catch(\Exception $exception){
            return [
                'message' => 'Erro no logout.',
                'code' => 500,
                'data' => [
                    'exception' => $exception
                ]
            ];
        }
    }
    public function register($data)
    {
        try{
            $user = User::create($data);
            $token = $user->createToken('authtoken')->plainTextToken;
            return [
                'message' => 'Usuário cadastrado',
                'code' => 201,
                'data' => [
                    'user' => $user,
                    'token'=> $token
                ]
            ];
        }catch(\Exception $exception){
            return [
                'message' => 'Erro no registro.',
                'code' => 500,
                'data' => [
                    'exception' => $exception
                ]
            ];
        }
    }
}
