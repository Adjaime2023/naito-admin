<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Brand;

class BrandFactory extends Factory
{
    protected $model = Brand::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
        ];
    }
}

