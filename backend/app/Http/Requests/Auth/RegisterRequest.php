<?php

namespace App\Http\Requests\Auth;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class RegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return !Auth::check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'name' => 'required|string',
            'email' => 'required|string|unique:users,email',
            'password' => 'required|string|confirmed'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Digite o seu nome.',
            'email.required' => 'Digite um email válido.',
            'email.unique' => 'Email já esta em uso.',
            'password.required' => 'Digite sua senha.',
            'password.confirmed' => 'Senhas não conferem.',
        ];
    }
}
