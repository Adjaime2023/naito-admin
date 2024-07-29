<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Color;

class ColorFactory extends Factory
{
    protected $model = Color::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
        ];
    }
}

