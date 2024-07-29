<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OfficeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $offices = [
            ['sector_id'=> 1,'name' => 'Diretor', 'description' => 'diretor executivo (CEO), diretor financeiro (CFO), diretor de operações (COO) e outros cargos de diretoria.'],
            ['sector_id'=> 1,'name' => 'Gerente', 'description' => ' gerencia um departamento ou área da empresa, define estratégias, aloca recursos e lidera equipes.'],
            ['sector_id'=> 1,'name' => 'Coordenador', 'description' => 'coordena o trabalho de diferentes equipes, garante a comunicação entre os setores e resolve conflitos.'],
            ['sector_id'=> 1,'name' => 'Supervisor', 'description' => 'supervisiona o trabalho de uma equipe, define metas, acompanha o desempenho dos funcionários e fornece feedback.'],
            ['sector_id'=> 2,'name' => 'Gerente administrativo', 'description' => 'gerencia o setor administrativo da empresa, definindo estratégias, liderando equipes e supervisionando o andamento dos trabalhos.'],
            ['sector_id'=> 2,'name' => 'Analista administrativo', 'description' => 'responsável por analisar e otimizar processos administrativos, além de implementar novas tecnologias e procedimentos.'],
            ['sector_id'=> 2,'name' => 'Assistente administrativo', 'description' => ' realiza tarefas administrativas mais complexas, como elaboração de relatórios, contoffice de processos e gestão de documentos.'],
            ['sector_id'=> 2,'name' => 'Auxiliar administrativo', 'description' => 'responsável por tarefas administrativas gerais, como atendimento ao público, organização de arquivos, digitação e suporte ao RH.'],
            ['sector_id'=> 3,'name' => 'Gerente financeiro', 'description' => 'gerencia o setor financeiro da empresa, definindo estratégias de investimento, controlando o fluxo de caixa e supervisionando o trabalho da equipe.'],
            ['sector_id'=> 3,'name' => 'Analista financeiro', 'description' => 'responsável por analisar a situação financeira da empresa, identificar oportunidades de investimento e desenvolver estratégias para otimizar o uso dos recursos financeiros.'],
            ['sector_id'=> 3,'name' => 'Assistente financeiro', 'description' => 'realiza tarefas financeiras mais complexas, como análise de demonstrativos financeiros, elaboração de orçamentos e contoffice de custos.'],
            ['sector_id'=> 3,'name' => 'Auxiliar financeiro', 'description' => 'responsável por tarefas financeiras básicas, como lançamento de pagamentos e recebimentos, conciliação bancária e digitação de notas fiscais.'],
            ['sector_id'=> 4,'name' => 'Gerente de RH', 'description' => 'gerencia o setor de RH da empresa, definindo estratégias de recrutamento e seleção, treinamento e desenvolvimento e gestão de pessoas.'],
            ['sector_id'=> 4,'name' => 'Analista de RH', 'description' => 'responsável por analisar dados de RH, identificar oportunidades de melhoria e desenvolver políticas e procedimentos para a área.'],
            ['sector_id'=> 4,'name' => 'Assistente de RH', 'description' => 'realiza tarefas de RH mais complexas, como admissão e demissão de funcionários, treinamento e desenvolvimento e gestão de benefícios.'],
            ['sector_id'=> 4,'name' => 'Auxiliar de RH', 'description' => ' responsável por tarefas básicas de RH, como recrutamento e seleção, folha de pagamento e benefício'],
            ['sector_id'=> 5,'name' => 'Prospecção de Clientes', 'description' => 'Identificar potenciais clientes: Buscar novos clientes em potencial através de diversas fontes, como listas telefônicas, sites, eventos, networking e parcerias estratégicas. Qualificar leads: Avaliar o interesse e a capacidade de compra dos leads, priorizando aqueles com maior potencial de conversão em clientes. Criar e manter um banco de dados de leads: Organizar e gerenciar as informações dos leads de forma eficiente, para acompanhamento e nutrição.'],
            ['sector_id'=> 5,'name' => 'Vendas', 'description' => 'Apresentar produtos ou serviços: Demonstrar as características, benefícios e diferenciais dos produtos ou serviços para os clientes potenciais. Negociar preços e condições de pagamento: Buscar o melhor acordo para ambas as partes, considerando os objetivos da empresa e as necessidades do cliente. Fechar vendas: Concluir o processo de venda, formalizando o pedido e garantindo o pagamento.'],
            ['sector_id'=> 5,'name' => 'Atendimento ao Cliente', 'description' => 'Fornecer suporte pré-venda: Esclarecer dúvidas, fornecer informações adicionais e auxiliar os clientes na escolha do produto ou serviço ideal. Gerenciar o relacionamento com os clientes: Manter contato com os clientes, construir relacionamentos duradouros e fidelizá-los. Resolver problemas e reclamações: Lidar com os problemas e reclamações dos clientes de forma eficiente e profissional, buscando soluções satisfatórias para ambas as partes.'],
            ['sector_id'=> 5,'name' => 'Pós-venda', 'description' => 'Garantir a satisfação do cliente: Monitorar a experiência do cliente após a compra, identificar oportunidades de melhoria e garantir que o cliente esteja satisfeito com o produto ou serviço adquirido. Coletar feedback: Obter feedback dos clientes sobre os produtos, serviços e atendimento, para aprimorar as ofertas da empresa. Oferecer suporte técnico: Auxiliar os clientes na utilização dos produtos ou serviços, solucionar problemas técnicos e fornecer treinamento quando necessário.'],
            ['sector_id'=> 5,'name' => 'Marketing e Vendas:', 'description' => 'Desenvolver estratégias de marketing e vendas: Criar e implementar planos de ação para atrair novos clientes, aumentar as vendas e alcançar os objetivos da empresa. Gerenciar campanhas de marketing: Planejar, executar e monitorar campanhas de marketing para promover os produtos ou serviços da empresa. Utilizar ferramentas de marketing e vendas: Empregar ferramentas de CRM, marketing digital, automação de marketing e outras tecnologias para otimizar o processo de vendas.'],
            ['sector_id'=> 5,'name' => 'Análise de Dados', 'description' => 'Coletar e analisar dados de vendas: Obter e analisar dados sobre as vendas, clientes, mercado e concorrência para identificar oportunidades e tomar decisões estratégicas. Monitorar indicadores de desempenho: Acompanhar indicadores de desempenho (KPIs) como taxa de conversão, ticket médio e churn rate para avaliar o desempenho do setor comercial. Gerar relatórios e dashboards: Criar relatórios e dashboards para visualizar os dados de forma clara e concisa, auxiliando na tomada de decisões.'],
            ['sector_id'=> 5,'name' => 'Gestão da Equipe', 'description' => 'Liderar e motivar a equipe de vendas: Motivar e inspirar a equipe para alcançar os objetivos do setor comercial. Treinar e desenvolver a equipe: Fornecer treinamento e desenvolvimento profissional para a equipe, aprimorando suas habilidades e conhecimentos. Gerenciar o desempenho da equipe: Monitorar o desempenho individual e da equipe, oferecendo feedback e reconhecendo conquistas.'],
            ['sector_id'=> 5,'name' => 'Outras Funções', 'description' => 'Participar de feiras e eventos: Representar a empresa em feiras, eventos e congressos do setor para divulgar os produtos ou serviços e captar novos clientes. Manter-se atualizado sobre o mercado: Monitorar as tendências do mercado, as ações da concorrência e as mudanças no comportamento do consumidor para adaptar as estratégias de vendas. Cumprir as leis e normas regulatórias: Assegurar o cumprimento das leis e normas regulatórias relacionadas às atividades de vendas e marketing.'],
            ['sector_id'=> 6,'name' => 'Supervisor operacional', 'description' => 'supervisiona as atividades da equipe operacional, garante a qualidade do trabalho e a segurança dos funcionários.'],
            ['sector_id'=> 6,'name' => 'Técnico', 'description' => 'realiza reparos e manutenções em equipamentos, instalações e máquinas.'],
            ['sector_id'=> 6,'name' => 'Operador de máquina', 'description' => ' opera máquinas e equipamentos, seguindo instruções e procedimentos de segurança.'],
            ['sector_id'=> 6,'name' => 'Auxiliar operacional', 'description' => 'responsável por tarefas operacionais básicas, como limpeza, organização e recepção.'],
        ];

        // Insert the offices into the offices table
        DB::table('offices')->insert($offices);
    }
}
