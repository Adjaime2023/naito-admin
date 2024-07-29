<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\products\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Vestuários',
            'description' => 'Roupas, calçados e acessórios de moda para todas as idades.',
            'action_user' => 'Criado por: Seeder em ' . now(),
            'discontinued' => false,
        ],
            ['name' => 'Eletrônicos',
            'description' => 'Dispositivos eletrônicos, gadgets e acessórios tecnológicos.',
            'action_user' => 'Criado por: Seeder em ' . now(),
            'discontinued' => false,
        ],
            ['name' => 'Eletrodomésticos',
            'description' => 'Dispositivos eletrônicos, gadgets e acessórios tecnológicos.',
            'action_user' => 'Criado por: Seeder em ' . now(),
            'discontinued' => false,
        ],
            // Adicione outras categorias conforme necessário
        ];

        foreach ($categories as $category) {
            Category::create($category);
        }
    }
}
