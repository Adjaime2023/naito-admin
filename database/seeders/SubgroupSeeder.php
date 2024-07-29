<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Products\Subgroup;

class SubgroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subgroups = [
            ['name' => 'UV50 ', 'description' => '',  'group_id' => '1', 'action_user' => 'Criado por: Seeder em ' . now(),  'discontinued' => false, 'deleted' => false,],
      
            // Adicione outras subcategorias de produto conforme necessário
        ];

        foreach ($subgroups as $subgroup) {
            Subgroup::create($subgroup);
        }
    }
}
