<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SectorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $sectors = [
            ['name' => 'Liderança', 'description' => 'Liderança é a habilidade de motivar, influenciar e gerenciar pessoas. Nas empresas, esse tipo de função é fundamental para fazer com que os colaboradores trabalhem de maneira focada e atinjam os objetivos desejados pelo negócio.'],
            ['name' => 'Administrativos', 'description' => 'Um setor administrativo é uma divisão ou departamento dentro de uma organização ou empresa que é responsável por lidar com as atividades relacionadas à gestão, organização e coordenação dos recursos e processos internos.'],
            ['name' => 'Financeiros', 'description' => 'O setor financeiro é responsável por tratar de todos os assuntos relacionados a finanças da empresa, visando a realização dos objetivos da mesma. Isso contribui para a tomada de decisões, como corte de custos ou investimentos.'],
            ['name' => 'Recursos Humanos', 'description' => 'A área de Recursos Humanos é a junção de colaboradores de uma determinada empresa. A base do segmento responsável são as ações de seleção, recrutamento, treinamento, remuneração e fornecimento de vantagens aos trabalhadores. O setor de RH surgiu no início do século XX, ainda como resultado da Revolução Industrial.'],
            ['name' => 'Comercial', 'description' => 'O que é setor comercial de uma empresa? Em resumo, o setor comercial é responsável por gerar receita para a empresa, por meio da venda de produtos ou serviços. Um setor comercial eficiente pode impulsionar as vendas, aumentar a fidelidade dos clientes e, consequentemente, contribuir para o crescimento do negócio.'],
            ['name' => 'Operacionais', 'description' => 'O setor operacional é aquele que lida com o fazer da empresa. Isso inclui diversas atividades de acordo com o tipo de negócio. Alguns exemplos são a produção, logística, gestão de recursos materiais e vendas. Dessa maneira, ele é o que dá a forma final ao produto ou serviço até a entrega ao cliente.'],
        ];

        // Insert the roles into the roles table
        DB::table('sectors')->insert($sectors);
    }

}
