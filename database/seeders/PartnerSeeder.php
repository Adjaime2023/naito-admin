<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Partner;

class PartnerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $partners = [
            [
                'name' => 'Naifer',
                'contact' => 'Adjaime Naito',
                'email' => 'naiferemp@gmail.com',
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
                'latitude'=> '-16.3681',
                'longitude'=>'-46.8986',
                'nivel_zoon' => '13',
                'favicon' => 'partner/1/Naifer_favicon_202407081816.png',
                'logo_light' =>	'partner/1/Naifer_logo_light_202407081816.svg',
                'logo_dark' => 'partner/1/Naifer_logo_dark_202407081816.svg',
                'discontinued' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Naito Marketing Digital',
                'contact' => 'Adjaime Naito',
                'email' => 'adjnaito@gmail.com',
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
                'latitude'=> '-16.3681',
                'longitude'=>'-46.8986',
                'nivel_zoon' => '13',
                'favicon' => 'partner/2/NaitoMarketingDigital_favicon_202407081833.png',
                'logo_light' =>	'partner/2/NaitoMarketingDigital_logo_light_202407081818.png',
                'logo_dark' =>	'partner/2/NaitoMarketingDigital_logo_dark_202407081818.png',
                'discontinued' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'JA Assistencia',
                'contact' => 'Josino',
                'email' => 'jassistencia@gmail.com',
                'website' => 'jassistencia.com.br',
                'phone' => '(38)99947-3993',
                'whatsapp' => '(38)9947-3993',
                'facebook' => 'https://facebook.com/',
                'x' => 'https://twitter.com/',
                'tiktok' => 'https://tiktok.com/',
                'instagram' => 'https://instagram',
                'cep' => '38610-316',
                'city' => 'Unaí',
                'uf' => 'MG',
                'address' => 'Rua Frei Cecílio',
                'number' => 175,
                'complement' => '',
                'neighborhood' => 'Cachoeira',
                'latitude'=>'-16.35343',
                'longitude'=>'-46.8928',
                'nivel_zoon' => '13',
                'favicon' => 'partner/3/JAAssistencia_favicon_202407081815.png',
                'logo_light' =>	'partner/3/JAAssistencia_logo_light_202407081814.png',
                'logo_dark' => 'partner/3/JAAssistencia_logo_dark_202407081814.png',
                'discontinued' => false,
                'created_at' => now(),
                'updated_at' => now(),

            ],

            // Adicione outras Parceiros conforme necessário
        ];

        foreach ($partners as $partner) {
            Partner::create($partner);
        }
    }
}
