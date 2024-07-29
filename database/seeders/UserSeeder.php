<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        User::create([
            'name' => 'Adjaime Naito',
            'email' => 'adjnaito@gmail.com',
            'password' => Hash::make('12345678'),
            'role' => 'admin',
            'email_verified_at' => now(),
        ]);

        User::create([
            'name' => 'User Customer',
            'email' => 'customer@example.com',
            'password' => Hash::make('12345678'),
            'role' => 'customer',
            'email_verified_at' => now(),
        ]);

        User::create([
            'name' => 'User Finance',
            'email' => 'finance@example.com',
            'password' => Hash::make('12345678'),
            'role' => 'finance',
            'email_verified_at' => now(),
        ]);

        User::create([
            'name' => 'User Sale',
            'email' => 'sale@example.com',
            'password' => Hash::make('12345678'),
            'role' => 'sale',
            'email_verified_at' => now(),
        ]);
    }
}
