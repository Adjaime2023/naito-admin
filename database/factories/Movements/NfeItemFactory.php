<?php

namespace Database\Factories\Movements;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Movements\NfeItem;
use App\Models\Products\Product;

class NfeItemFactory extends Factory
{
    protected $model = NfeItem::class;

    public function definition()
    {
        return [
            'nfe_entrada_id' => \App\Models\Movements\NfeEntrada::factory(),
            'product_id' => Product::factory(), // Use the Product factory to create a product
            'codigo_produto' => $this->faker->numerify('######'),
            'descricao' => $this->faker->sentence,
            'ncm' => $this->faker->numerify('########'),
            'cst' => $this->faker->numerify('###'),
            'cfop' => $this->faker->numerify('####'),
            'unidade' => $this->faker->randomElement(['kg', 'm', 'un']),
            'quantidade' => $this->faker->randomFloat(2, 1, 1000),
            'valor_unitario' => $this->faker->randomFloat(2, 1, 1000),
            'valor_total' => $this->faker->randomFloat(2, 10, 10000),
        ];
    }
}
