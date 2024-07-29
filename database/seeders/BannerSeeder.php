<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Banner;


class BannerSeeder extends Seeder
{
     /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $banners = [
            [
                'title' => 'Camisa Manga Longa ',
                'alt' => '01',
                'description' => 'UV50+',
                'description2' =>'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/1/CamisaMangaLonga_image_url_mobile_202407071514.jpg',
                'image_url_tablet' => 'banners/1/CamisaMangaLonga_image_url_tablet_202407071514.jpg', 
                'image_url_laptop' => 'banners/1/CamisaMangaLonga_image_url_laptop_202407071515.jpg',
                'image_url_desktop' => 'banners/1/CamisaMangaLonga_image_url_desktop_202407071515.jpg',
                'logo_light' => 'banners/1/CamisaMangaLonga_logo_light_202407071514.png',
                'logo_dark' => 'banners/1/CamisaMangaLonga_logo_dark_202407071514.png',
                'horizontal_alignment' => 'left',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => true,
                'banner' => false,
                'discontinued' => false,
            ],
            [
                'title' => 'Camisa Manga Longa ',
                'alt' => '02',
                'description' => 'UV50+',
                'description2' => 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/2/CamisaMangaLonga_image_url_mobile_202407071517.jpg',
                'image_url_tablet' => 'banners/2/CamisaMangaLonga_image_url_tablet_202407071517.jpg',
                'image_url_laptop' => 'banners/2/CamisaMangaLonga_image_url_laptop_202407071518.jpg',
                'image_url_desktop' => 'banners/2/CamisaMangaLonga_image_url_desktop_202407071518.jpg',
                'logo_light' => 'banners/2/CamisaMangaLonga_logo_light_202407071516.png',
                'logo_dark' => 'banners/2/CamisaMangaLonga_logo_dark_202407071516.png',								
                 'horizontal_alignment' => 'left',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => true,
                'banner' => false,
                'discontinued' => false,
            ],
            [
                'title' => 'Blusa Light Running',
                'alt' => '03',
                'description' => 'UV50+',
                'description2' => 'Feita em Poliamida e Elastano Garantindo Conforto Térmico Mesmo em Climas Mais Frios',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/3/BlusaLightRunning_image_url_mobile_202407071520.jpg',
                'image_url_tablet' => 'banners/3/BlusaLightRunning_image_url_tablet_202407071520.jpg',
                'image_url_laptop' => 'banners/3/BlusaLightRunning_image_url_laptop_202407071522.jpg',
                'image_url_desktop' => 'banners/3/BlusaLightRunning_image_url_desktop_202407071522.jpg',
                'logo_light' => 'banners/3/BlusaLightRunning_logo_light_202407071531.png',
                'logo_dark' => 'banners/3/BlusaLightRunning_logo_dark_202407071531.png',					
                'horizontal_alignment' => 'left',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => true,
                'banner' => false,
                'discontinued' => false,
            ],
            [
                'title' => 'Camisa Manga Longa ',
                'alt' => '04',
                'description' => 'UV50+',
                'description2' => 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/4/CamisaMangaLonga_image_url_mobile_202407071524.jpg',
                'image_url_tablet' => 'banners/4/CamisaMangaLonga_image_url_tablet_202407071524.jpg',
                'image_url_laptop' => 'banners/4/CamisaMangaLonga_image_url_laptop_202407071524.jpg',
                'image_url_desktop' => 'banners/4/CamisaMangaLonga_image_url_desktop_202407071524.jpg',
                'logo_light' => 'banners/4/CamisaMangaLonga_logo_light_202407071523.png',
                'logo_dark' => 'banners/4/CamisaMangaLonga_logo_dark_202407071523.png',												
                'horizontal_alignment' => 'right',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => true,
                'banner' => false,
                'discontinued' => false,
            ],
            [
               'title' => 'Blusa Light Running',
                'alt' => '05',
                'description' => 'UV50+',
                'description2' => 'Feita em Poliamida e Elastano Garantindo Conforto Térmico Mesmo em Climas Mais Frios',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/5/BlusaLightRunning_image_url_mobile_202407071525.jpg',
                'image_url_tablet' => 'banners/5/BlusaLightRunning_image_url_tablet_202407071525.jpg', 
                'image_url_laptop' => 'banners/5/BlusaLightRunning_image_url_laptop_202407071526.jpg',
                'image_url_desktop' => 'banners/5/BlusaLightRunning_image_url_desktop_202407071526.jpg',
                'logo_light' => 'banners/5/BlusaLightRunning_logo_light_202407071532.png',
                'logo_dark' => 'banners/5/BlusaLightRunning_logo_dark_202407071532.png',  
                'horizontal_alignment' => 'left',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => true,
                'banner' => false,
                'discontinued' => false,

            ],
            [
                'title' => 'Camisa Manga Longa ',
                'alt' => '06',
                'description' => 'UV50+',
                'description2' => 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/6/CamisaMangaLonga_image_url_mobile_202407071527.jpg',
                'image_url_tablet' => 'banners/6/CamisaMangaLonga_image_url_tablet_202407071527.jpg',
                'image_url_laptop' => 'banners/6/CamisaMangaLonga_image_url_laptop_202407071526.jpg',
                'image_url_desktop' => 'banners/6/CamisaMangaLonga_image_url_desktop_202407071526.jpg',
                'logo_light' => 'banners/6/CamisaMangaLonga_logo_light_202407071528.png',
                'logo_dark' => 'banners/6/CamisaMangaLonga_logo_dark_202407071528.png',
                'horizontal_alignment' => 'left',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => true,
                'banner' => false,
                'discontinued' => false,

            ],
            [
                'title' => 'Manguitos',
                'alt' => '07',
                'description' => 'UV50+',
                'description2' => 'Proteção Extra em Diversas Opções de Acessórios para Suas Atividades Fisicas',
                'url' => 'http://127.0.0.1:8000/',
                'image_url_mobile' => 'banners/7/Manguitos_image_url_mobile_202407071529.jpg',
                'image_url_tablet' => 'banners/7/Manguitos_image_url_tablet_202407071529.jpg',
                'image_url_laptop' => 'banners/7/Manguitos_image_url_laptop_202407071529.jpg',
                'image_url_desktop' => 'banners/7/Manguitos_image_url_desktop_202407071529.jpg',
                'logo_light' => 'banners/7/Manguitos_logo_light_202407071528.png',
                'logo_dark' => 'banners/7/Manguitos_logo_dark_202407071528.png',
                'horizontal_alignment' => 'right',
                'vertical_alignment' => 'center',
                'date' => now(), // Define a data atual
                'slide' => false,
                'banner' => true,
                'discontinued' => false,

            ],

            // Adicione outras Parceiros conforme necessário
        ];

        foreach ($banners as $banner) {
            Banner::create($banner);
        }
    }
}
