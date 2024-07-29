<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Subcategory;

class SubcategoryFactory extends Factory
{
    protected $model = Subcategory::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
        ];
    }
}
