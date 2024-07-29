<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\CustomerType;

class CustomerTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $types = [
            ['name' => 'Consumidor Final', 'description' => 'Consumidor final para vendas diretas.'],
            ['name' => 'Revendedor', 'description' => 'Revendedor autorizado dos produtos.'],
            ['name' => 'Representante', 'description' => 'Representante comercial que atua na venda dos produtos.'],
            ['name' => 'Distribuidor', 'description' => 'Distribui produtos para revendedores ou varejistas.'],
            ['name' => 'Atacadista', 'description' => 'Compra produtos em grandes quantidades e os vende em quantidades menores para revendedores.'],
            ['name' => 'Varejista', 'description' => 'Vende produtos diretamente aos consumidores finais.'],
            ['name' => 'Institucional', 'description' => 'Compra produtos para uso institucional, como escolas, hospitais ou governos.'],
            ['name' => 'Corporativo', 'description' => 'Grandes empresas que compram produtos para uso interno ou para seus funcionários.'],
            ['name' => 'E-commerce', 'description' => 'Vende produtos exclusivamente online.'],
            ['name' => 'Franquia', 'description' => 'Opera sob uma franquia de uma marca conhecida, seguindo padrões estabelecidos pela franqueadora.'],
        ];

        foreach ($types as $type) {
            CustomerType::create($type);
        }
    }
}
