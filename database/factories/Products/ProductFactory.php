<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Product;

class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
            'description' => $this->faker->sentence,
            'sku' => $this->faker->unique()->word,
            'qr_code' => $this->faker->word,
            'barcode' => $this->faker->word,
            'purchase_price' => $this->faker->randomFloat(2, 1, 1000),
            'stock' => $this->faker->randomNumber(),
            'image' => $this->faker->imageUrl(),
            'category_id' =>1,
            'subcategory_id' => 1,
            'group_id' =>1,
            'subgroup_id' => 1,
            'collection_id' => 1,
            'brand_id' => 1,
            'color_id' => 1,
            'action_user' => 'Created by factory on ' . now(),
            'discontinued' => $this->faker->boolean,
        ];
    }
}
