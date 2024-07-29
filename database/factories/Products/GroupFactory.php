<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Group;

class GroupFactory extends Factory
{
    protected $model = Group::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
        ];
    }
}
