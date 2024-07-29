<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\products\Color;


class ColorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $colors = [
            ['name' => 'Azul Marinho', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Branco', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Preto', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Azul Marinho E Branco', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Branca E Vermelho', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Preto E Vermelho', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Turquesa E Rosa', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Rosa E Branco', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Azul E Branco', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Branco E Azul', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Preto E Branco', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Branco E Preto', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Night - Azul', 'description' => 'Preta-Manga Camuflada Azul', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Urban - Cinza', 'description' => 'Preta-Manga Camuflada Cinza', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Jungle - Verde', 'description' => 'Preta-Manga Camuflada Verde', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Volcano - Vermelho', 'description' => 'Preta-Manga Camuflada Vermelha', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Rosa', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Azul Claro', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Azul Claro E Preto', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Preto E Azul Claro', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Rosa E Preto', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Preto E Rosa', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Camuflada Azul', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Camuflada Vermelha', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Camuflada Cinza', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            ['name' => 'Camuflada Verde', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
            // Adicione outras cores conforme necessário
        ];

        foreach ($colors as $color) {
            Color::create($color);
        }
    }
}
