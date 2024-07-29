<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Subgroup;

class SubgroupFactory extends Factory
{
    protected $model = Subgroup::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
        ];
    }
}
