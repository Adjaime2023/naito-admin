<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\products\Collection;
use Illuminate\Database\Seeder;

class CollectionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $collections = [
            ['name' => '24', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(), 'discontinued' => false, 'deleted' => false,],
            // Adicione outras coleções conforme necessário
        ];

        foreach ($collections as $collection) {
            Collection::create($collection);
        }
    }
}
