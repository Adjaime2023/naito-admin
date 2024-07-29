<?php

namespace Database\Factories\Products;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Products\Collection;

class CollectionFactory extends Factory
{
    protected $model = Collection::class;

    public function definition()
    {
        return [
            'name' => $this->faker->word,
        ];
    }
}
