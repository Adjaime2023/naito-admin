<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Company;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $company = [
            'name' => 'Naifer',
            'contact' => 'Adjaime Naito',
            'support_message' => 'Descrição: Uma mensagem direcionada aos clientes que destaca a disponibilidade e prontidão da empresa em fornecer suporte técnico e assistência com produtos. Por exemplo, "Estamos prontos para ajudar com suas necessidades de impressoras e balanças. Entre em contato conosco para suporte técnico, informações sobre produtos ou qualquer outra dúvida."',
            'description' => 'Descrição: Um texto detalhado que descreve a empresa, sua história, produtos e serviços oferecidos. Esse campo deve proporcionar uma visão geral clara e abrangente sobre o que a empresa faz e quais são suas principais áreas de atuação.',
            'slogan' => 'Descrição: Uma frase curta e memorável que captura a essência da empresa e seu valor único. O slogan deve ser cativante e refletir a identidade da marca. Por exemplo, "Tecnologia que transforma."',
            'portifolio' => 'Descrição: A declaração de missão da empresa, que descreve o propósito fundamental e a razão de ser da empresa. Deve explicar de forma clara e concisa o que a empresa busca alcançar e como pretende impactar positivamente seus clientes e a sociedade.',
            'mission' => 'Descrição: A declaração de missão da empresa, que descreve o propósito fundamental e a razão de ser da empresa. Deve explicar de forma clara e concisa o que a empresa busca alcançar e como pretende impactar positivamente seus clientes e a sociedade.',
            'vision' => 'Descrição: A visão da empresa, que projeta o futuro desejado pela empresa. Deve ser uma declaração inspiradora que define onde a empresa quer estar em um determinado período de tempo e o impacto que deseja causar no mercado e na sociedade.',
            'values' => 'Descrição: Uma lista de princípios e crenças fundamentais que guiam as ações e decisões da empresa. Estes valores devem refletir a cultura da empresa e os padrões éticos pelos quais a empresa opera. Por exemplo, integridade, inovação, respeito ao cliente, responsabilidade social, etc.',
            'image_about' => 'company/1/Naifer_image1.jpg',
            'image_about_right' => 'company/1/Naifer_image2.jpg',
            'experience1' => 'Temos',
            'experience2' => '12',
            'experience3' => 'anos de experiência',
            'email' => 'lojanaifer@gmail.com',
            'website' => 'lojanaifer.com.br',
            'phone' => '(38) 99753-4565',
            'whatsapp' => '(38) 99753-4565',
            'facebook' => 'https://facebook.com/lojanaifer',
            'x' => 'https://twitter.com/lojanaifer',
            'tiktok' => 'https://tiktok.com/@lojanaifer',
            'instagram' => 'https://instagram',
            'cep' => '38616-048',
            'city' => 'Unaí',
            'uf' => 'MG',
            'address' => 'Rua Júlio Borges',
            'number' => 61,
            'complement' => 'Apto 103',
            'neighborhood' => 'Barroca',
            'latitude' => '-16.3681',
            'longitude' => '-46.8986',
            'nivel_zoon' => '13',
            'favicon' => 'company/1/Naifer_favicon.png',
            'logo_light' => 'company/1/Naifer_logo_light.svg',
            'logo_dark' => 'company/1/Naifer_logo_dark.svg',
            'image_footer' => 'company/1/Naifer_image3.png',
            'description1'   => ' Por que a Calibração da Balança é Importante?',
            'link1'  => 'https://www.mt.com/br/pt/home/library/FAQ/laboratory-weighing/Balance-Scale-Service-Calibration.html#:~:text=Utilizar%20equipamentos%20calibrados%20garante%20que,Conformidade.',
            'image_footer_botton'   => 'company/1/Naifer_image4.png',
            'description2' => 'Para que serve uma impressora térmica?',
            'link2'  => 'https://www.controlid.com.br/blog/automacao-comercial/impressora-termica',
            'discontinued' => false,
            'created_at' => now(),
            'updated_at' => now(),
        ];

        Company::create($company);
    }
}

//php artisan db:seed --class=CompanySeeder
