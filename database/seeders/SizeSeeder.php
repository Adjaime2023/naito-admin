<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Products\Product;
use App\Models\Products\Size;

class SizeSeeder extends Seeder
{
    public function run()
    {
        // Lista de tamanhos padrão
        $sizes = ['P', 'M', 'G', 'GG'];

        // Recupera todos os produtos
        $products = Product::all();

        // Para cada produto, cria os tamanhos
        foreach ($products as $product) {
            foreach ($sizes as $sizeName) {
                Size::create([
                    'product_id' => $product->id,
                    'name' => $sizeName,
                    'stock' => 0, // Definindo estoque padrão como 0
                    'description' => null,
                    'size' => null,
                    'image' => null,
                    'action_user' => null,
                    'discontinued' => false,
                   
                ]);
            }
        }
    }
}
