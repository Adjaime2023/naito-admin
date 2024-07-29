<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProjectsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       
        // Exemplo de projetos fictícios
        $projects = [
            [
                'project_title' => 'E-commerce Website Redesign',
                'project_description' => 'We revamped the entire website of ABC Retailers to improve user experience and increase sales. The project included redesigning the homepage, product pages, and checkout process.',
                'client' => 'ABC Retailers',
                'start_date' => '2023-01-01',
                'end_date' => '2023-03-31',
                'category' => 'Web Development',
                'technologies_used' => 'HTML, CSS, JavaScript, React, Node.js',
                'project_images' => json_encode(['project-image1.jpg', 'project-image2.jpg', 'project-image3.jpg']),
                'project_url' => 'https://www.abcretailers.com',
                'client_testimonial' => 'The redesign has significantly boosted our sales and improved our customer satisfaction. Great job!',
                'project_team' => 'John Doe (Project Manager), Jane Smith (Lead Developer), Bob Johnson (Designer)',
                'results_metrics' => '30% increase in sales, 50% increase in user engagement',
                'tags' => '#WebDevelopment, #Ecommerce, #Redesign',
                'status' => 'Completed',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // Adicione mais projetos conforme necessário
        ];

        // Insere os dados na tabela 'projects'
        DB::table('projects')->insert($projects);
    }
    
}
