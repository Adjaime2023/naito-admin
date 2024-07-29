<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\products\Subcategory;

class SubcategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
          $subCategories = [
            [ 'name' => 'Roupas Esportivas', 'description' => 'Academia,Pesca, Agricola, Ciclista, etc', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],
            [ 'name' => 'Roupas de Banho', 'description' => '', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],
            [ 'name' => 'Roupas de Ocasião', 'description' => '', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],
            [ 'name' => 'Roupas Íntimas e Pijamas', 'description' => '', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],
            [ 'name' => 'Vestidos e Macacões', 'description' => '', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],
            [ 'name' => 'Acessórios', 'description' => 'Acessórios variados de moda', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],
            [ 'name' => 'Calçados', 'description' => 'Calçados para todas as idades e gêneros', 'category_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false,],

            // Adicione outras categorias conforme necessário
        ];

        foreach ($subCategories as $subCategory) {
            Subcategory::create($subCategory);
        }
    }
}
