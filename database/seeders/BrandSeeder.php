<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\products\Brand;
use Illuminate\Database\Seeder;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $brands = [
            ['name' => 'Tempestal', 'description' => '', 'action_user' => 'Criado por: Seeder em ' . now(), 'discontinued' => false, 'deleted' => false,],
            // Adicione outras marcas conforme necessário
        ];

        foreach ($brands as $brand) {
            Brand::create($brand);
        }
    }
}
