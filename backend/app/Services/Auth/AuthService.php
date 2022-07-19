<?php

namespace App\Services\Auth;

interface AuthService {
    public function login($email,$password);
    public function logout();
    public function register($data);
}
