<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\SupplierType;

class SupplierTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $types = [
            ['name' => 'Matéria-Prima', 'description' => 'Fornecedores que fornecem matérias-primas ou componentes para a produção de produtos.'],
            ['name' => 'Produtos Acabados', 'description' => 'Fornecedores que fornecem produtos já acabados para revenda.'],
            ['name' => 'Logística e Transporte', 'description' => 'Fornecedores que lidam com transporte, logística, armazenamento ou frete.'],
            ['name' => 'Tecnologia e Software', 'description' => 'Fornecedores que oferecem soluções tecnológicas, como software, hardware ou serviços de TI.'],
            ['name' => 'Serviços Profissionais', 'description' => 'Fornecedores que oferecem serviços profissionais, como consultoria, design, contabilidade, entre outros.'],
            ['name' => 'Equipamentos e Máquinas', 'description' => 'Fornecedores que fornecem equipamentos e máquinas utilizados na produção ou operações.'],
            ['name' => 'Alimentos e Bebidas', 'description' => 'Fornecedores que fornecem produtos alimentícios, bebidas ou ingredientes.'],
            ['name' => 'Saúde e Farmacêutico', 'description' => 'Fornecedores na área de saúde, medicamentos, produtos farmacêuticos, equipamentos médicos, entre outros.'],
            ['name' => 'Energia e Utilidades', 'description' => 'Fornecedores relacionados à energia, como eletricidade, gás ou água.'],
            ['name' => 'Móveis e Decoração', 'description' => 'Fornecedores de móveis, decoração e itens relacionados.'],
            ['name' => 'Vestuário e Têxtil', 'description' => 'Fornecedores de roupas, tecidos e produtos têxteis.'],
            ['name' => 'Construção e Materiais de Construção', 'description' => 'Fornecedores de materiais de construção, ferramentas e equipamentos de construção.'],
            ['name' => 'Agricultura e Agricultura', 'description' => 'Fornecedores de produtos agrícolas, como sementes, fertilizantes, produtos químicos agrícolas, etc.'],
            ['name' => 'Serviços Tributários e Fiscais', 'description' => 'Profissionais e empresas que oferecem serviços de consultoria fiscal e assessoria tributária.'],
        ];

        foreach ($types as $type) {
            SupplierType::create($type);
        }
    }
}
