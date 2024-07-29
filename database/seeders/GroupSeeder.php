<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\products\Group;
use Carbon\Carbon;

class GroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $groups = [
            ['name' => 'Camisa', 'description' => '', 'subcategory_id' => 1, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
            ['name' => 'Camiseta', 'description' => '', 'subcategory_id' => 1, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
            ['name' => 'Blusa', 'description' => '', 'subcategory_id' => 1, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
            ['name' => 'Jaqueta', 'description' => '', 'subcategory_id' => 1, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
            ['name' => 'Manguito', 'description' => '', 'subcategory_id' => 6, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
            ['name' => 'Bandana', 'description' => '', 'subcategory_id' => 6, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
            ['name' => 'Pernito', 'description' => '', 'subcategory_id' => 6, 'action_user' => 'Criado por:Seeder em ' . Carbon::now(), 'discontinued' => false, ],
        ];

        foreach ($groups as $group) {
            Group::create($group);
        }
    }
}
