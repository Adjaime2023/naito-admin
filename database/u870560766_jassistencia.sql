-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/07/2024 às 22:15
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u870560766_jassistencia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description2` varchar(255) DEFAULT NULL,
  `image_url_mobile` varchar(255) DEFAULT NULL,
  `image_url_tablet` varchar(255) DEFAULT NULL,
  `image_url_laptop` varchar(255) DEFAULT NULL,
  `image_url_desktop` varchar(255) DEFAULT NULL,
  `logo_light` varchar(255) DEFAULT NULL,
  `logo_dark` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `horizontal_alignment` enum('left','right','center') NOT NULL DEFAULT 'center',
  `vertical_alignment` enum('top','center','bottom') NOT NULL DEFAULT 'center',
  `date` datetime DEFAULT NULL,
  `slide` tinyint(1) NOT NULL DEFAULT 0,
  `banner` tinyint(1) NOT NULL DEFAULT 0,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `title`, `alt`, `description`, `description2`, `image_url_mobile`, `image_url_tablet`, `image_url_laptop`, `image_url_desktop`, `logo_light`, `logo_dark`, `url`, `horizontal_alignment`, `vertical_alignment`, `date`, `slide`, `banner`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Camisa Manga Longa ', '01', 'UV50+', 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico', 'banners/1/CamisaMangaLonga_image_url_mobile_202407071514.jpg', 'banners/1/CamisaMangaLonga_image_url_tablet_202407071514.jpg', 'banners/1/CamisaMangaLonga_image_url_laptop_202407071515.jpg', 'banners/1/CamisaMangaLonga_image_url_desktop_202407071515.jpg', 'banners/1/CamisaMangaLonga_logo_light_202407071514.png', 'banners/1/CamisaMangaLonga_logo_dark_202407071514.png', 'http://127.0.0.1:8000/', 'left', 'center', '2024-07-27 16:18:12', 1, 0, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(2, 'Camisa Manga Longa ', '02', 'UV50+', 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico', 'banners/2/CamisaMangaLonga_image_url_mobile_202407071517.jpg', 'banners/2/CamisaMangaLonga_image_url_tablet_202407071517.jpg', 'banners/2/CamisaMangaLonga_image_url_laptop_202407071518.jpg', 'banners/2/CamisaMangaLonga_image_url_desktop_202407071518.jpg', 'banners/2/CamisaMangaLonga_logo_light_202407071516.png', 'banners/2/CamisaMangaLonga_logo_dark_202407071516.png', 'http://127.0.0.1:8000/', 'left', 'center', '2024-07-27 16:18:12', 1, 0, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(3, 'Blusa Light Running', '03', 'UV50+', 'Feita em Poliamida e Elastano Garantindo Conforto Térmico Mesmo em Climas Mais Frios', 'banners/3/BlusaLightRunning_image_url_mobile_202407071520.jpg', 'banners/3/BlusaLightRunning_image_url_tablet_202407071520.jpg', 'banners/3/BlusaLightRunning_image_url_laptop_202407071522.jpg', 'banners/3/BlusaLightRunning_image_url_desktop_202407071522.jpg', 'banners/3/BlusaLightRunning_logo_light_202407071531.png', 'banners/3/BlusaLightRunning_logo_dark_202407071531.png', 'http://127.0.0.1:8000/', 'left', 'center', '2024-07-27 16:18:12', 1, 0, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(4, 'Camisa Manga Longa ', '04', 'UV50+', 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico', 'banners/4/CamisaMangaLonga_image_url_mobile_202407071524.jpg', 'banners/4/CamisaMangaLonga_image_url_tablet_202407071524.jpg', 'banners/4/CamisaMangaLonga_image_url_laptop_202407071524.jpg', 'banners/4/CamisaMangaLonga_image_url_desktop_202407071524.jpg', 'banners/4/CamisaMangaLonga_logo_light_202407071523.png', 'banners/4/CamisaMangaLonga_logo_dark_202407071523.png', 'http://127.0.0.1:8000/', 'right', 'center', '2024-07-27 16:18:12', 1, 0, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(5, 'Blusa Light Running', '05', 'UV50+', 'Feita em Poliamida e Elastano Garantindo Conforto Térmico Mesmo em Climas Mais Frios', 'banners/5/BlusaLightRunning_image_url_mobile_202407071525.jpg', 'banners/5/BlusaLightRunning_image_url_tablet_202407071525.jpg', 'banners/5/BlusaLightRunning_image_url_laptop_202407071526.jpg', 'banners/5/BlusaLightRunning_image_url_desktop_202407071526.jpg', 'banners/5/BlusaLightRunning_logo_light_202407071532.png', 'banners/5/BlusaLightRunning_logo_dark_202407071532.png', 'http://127.0.0.1:8000/', 'left', 'center', '2024-07-27 16:18:12', 1, 0, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(6, 'Camisa Manga Longa ', '06', 'UV50+', 'Feita em Tecido UV com Capacidade de Secagem Rápida e Conforto Térmico', 'banners/6/CamisaMangaLonga_image_url_mobile_202407071527.jpg', 'banners/6/CamisaMangaLonga_image_url_tablet_202407071527.jpg', 'banners/6/CamisaMangaLonga_image_url_laptop_202407071526.jpg', 'banners/6/CamisaMangaLonga_image_url_desktop_202407071526.jpg', 'banners/6/CamisaMangaLonga_logo_light_202407071528.png', 'banners/6/CamisaMangaLonga_logo_dark_202407071528.png', 'http://127.0.0.1:8000/', 'left', 'center', '2024-07-27 16:18:12', 1, 0, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(7, 'Manguitos', '07', 'UV50+', 'Proteção Extra em Diversas Opções de Acessórios para Suas Atividades Fisicas', 'banners/7/Manguitos_image_url_mobile_202407071529.jpg', 'banners/7/Manguitos_image_url_tablet_202407071529.jpg', 'banners/7/Manguitos_image_url_laptop_202407071529.jpg', 'banners/7/Manguitos_image_url_desktop_202407071529.jpg', 'banners/7/Manguitos_logo_light_202407071528.png', 'banners/7/Manguitos_logo_dark_202407071528.png', 'http://127.0.0.1:8000/', 'right', 'center', '2024-07-27 16:18:12', 0, 1, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `action_user`, `discontinued`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Tempestal', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('93652b0c77dd4f556ed2d027e645c6b4', 'i:1;', 1722109511),
('93652b0c77dd4f556ed2d027e645c6b4:timer', 'i:1722109511;', 1722109511);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Vestuários', 'Roupas, calçados e acessórios de moda para todas as idades.', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(2, 'Eletrônicos', 'Dispositivos eletrônicos, gadgets e acessórios tecnológicos.', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(3, 'Eletrodomésticos', 'Dispositivos eletrônicos, gadgets e acessórios tecnológicos.', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `collections`
--

INSERT INTO `collections` (`id`, `name`, `description`, `image`, `action_user`, `discontinued`, `deleted`, `created_at`, `updated_at`) VALUES
(1, '24', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `hex_code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `colors`
--

INSERT INTO `colors` (`id`, `name`, `hex_code`, `description`, `image`, `action_user`, `discontinued`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Azul Marinho', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(2, 'Branco', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(3, 'Preto', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(4, 'Azul Marinho E Branco', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(5, 'Branca E Vermelho', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(6, 'Preto E Vermelho', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(7, 'Turquesa E Rosa', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(8, 'Rosa E Branco', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(9, 'Azul E Branco', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(10, 'Branco E Azul', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(11, 'Preto E Branco', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(12, 'Branco E Preto', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(13, 'Night - Azul', NULL, 'Preta-Manga Camuflada Azul', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(14, 'Urban - Cinza', NULL, 'Preta-Manga Camuflada Cinza', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(15, 'Jungle - Verde', NULL, 'Preta-Manga Camuflada Verde', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(16, 'Volcano - Vermelho', NULL, 'Preta-Manga Camuflada Vermelha', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(17, 'Rosa', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(18, 'Azul Claro', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(19, 'Azul Claro E Preto', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(20, 'Preto E Azul Claro', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(21, 'Rosa E Preto', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(22, 'Preto E Rosa', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(23, 'Camuflada Azul', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(24, 'Camuflada Vermelha', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:17', '2024-07-27 19:16:17'),
(25, 'Camuflada Cinza', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(26, 'Camuflada Verde', NULL, '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:18', '2024-07-27 19:16:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `support_message` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slogan` text DEFAULT NULL,
  `portifolio` text DEFAULT NULL,
  `mission` text DEFAULT NULL,
  `vision` text DEFAULT NULL,
  `values` text DEFAULT NULL,
  `image_about` varchar(255) DEFAULT NULL,
  `image_about_right` varchar(255) DEFAULT NULL,
  `experience1` varchar(255) DEFAULT NULL,
  `experience2` varchar(255) DEFAULT NULL,
  `experience3` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `cep` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `nivel_zoon` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `logo_light` varchar(255) DEFAULT NULL,
  `logo_dark` varchar(255) DEFAULT NULL,
  `image_footer` varchar(255) DEFAULT NULL,
  `description1` varchar(255) DEFAULT NULL,
  `link1` varchar(255) DEFAULT NULL,
  `image_footer_botton` varchar(255) DEFAULT NULL,
  `description2` varchar(255) DEFAULT NULL,
  `link2` varchar(255) DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `companies`
--

INSERT INTO `companies` (`id`, `name`, `contact`, `support_message`, `description`, `slogan`, `portifolio`, `mission`, `vision`, `values`, `image_about`, `image_about_right`, `experience1`, `experience2`, `experience3`, `email`, `website`, `phone`, `whatsapp`, `facebook`, `x`, `tiktok`, `instagram`, `cep`, `city`, `uf`, `address`, `number`, `complement`, `neighborhood`, `latitude`, `longitude`, `nivel_zoon`, `favicon`, `logo_light`, `logo_dark`, `image_footer`, `description1`, `link1`, `image_footer_botton`, `description2`, `link2`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Naifer', 'Adjaime Naito', 'Descrição: Uma mensagem direcionada aos clientes que destaca a disponibilidade e prontidão da empresa em fornecer suporte técnico e assistência com produtos. Por exemplo, \"Estamos prontos para ajudar com suas necessidades de impressoras e balanças. Entre em contato conosco para suporte técnico, informações sobre produtos ou qualquer outra dúvida.\"', 'Descrição: Um texto detalhado que descreve a empresa, sua história, produtos e serviços oferecidos. Esse campo deve proporcionar uma visão geral clara e abrangente sobre o que a empresa faz e quais são suas principais áreas de atuação.', 'Descrição: Uma frase curta e memorável que captura a essência da empresa e seu valor único. O slogan deve ser cativante e refletir a identidade da marca. Por exemplo, \"Tecnologia que transforma.\"', 'Descrição: A declaração de missão da empresa, que descreve o propósito fundamental e a razão de ser da empresa. Deve explicar de forma clara e concisa o que a empresa busca alcançar e como pretende impactar positivamente seus clientes e a sociedade.', 'Descrição: A declaração de missão da empresa, que descreve o propósito fundamental e a razão de ser da empresa. Deve explicar de forma clara e concisa o que a empresa busca alcançar e como pretende impactar positivamente seus clientes e a sociedade.', 'Descrição: A visão da empresa, que projeta o futuro desejado pela empresa. Deve ser uma declaração inspiradora que define onde a empresa quer estar em um determinado período de tempo e o impacto que deseja causar no mercado e na sociedade.', 'Descrição: Uma lista de princípios e crenças fundamentais que guiam as ações e decisões da empresa. Estes valores devem refletir a cultura da empresa e os padrões éticos pelos quais a empresa opera. Por exemplo, integridade, inovação, respeito ao cliente, responsabilidade social, etc.', 'company/1/Naifer_image1.jpg', 'company/1/Naifer_image2.jpg', 'Temos', '12', 'anos de experiência', 'lojanaifer@gmail.com', 'lojanaifer.com.br', '(38) 99753-4565', '(38) 99753-4565', 'https://facebook.com/lojanaifer', 'https://twitter.com/lojanaifer', 'https://tiktok.com/@lojanaifer', 'https://instagram', '38616-048', 'Unaí', 'MG', 'Rua Júlio Borges', '61', 'Apto 103', 'Barroca', '-16.3681', '-46.8986', '13', 'company/1/Naifer_favicon.png', 'company/1/Naifer_logo_light.svg', 'company/1/Naifer_logo_dark.svg', 'company/1/Naifer_image3.png', ' Por que a Calibração da Balança é Importante?', 'https://www.mt.com/br/pt/home/library/FAQ/laboratory-weighing/Balance-Scale-Service-Calibration.html#:~:text=Utilizar%20equipamentos%20calibrados%20garante%20que,Conformidade.', 'company/1/Naifer_image4.png', 'Para que serve uma impressora térmica?', 'https://www.controlid.com.br/blog/automacao-comercial/impressora-termica', 0, NULL, '2024-07-27 19:16:30', '2024-07-27 19:16:30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_type` enum('Fisica','Juridica') NOT NULL DEFAULT 'Fisica',
  `customer_type_id` bigint(20) UNSIGNED NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cep` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `role` enum('admin','employee','customer','supplier','finance','sale') NOT NULL DEFAULT 'customer',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `customers`
--

INSERT INTO `customers` (`id`, `name`, `user_id`, `person_type`, `customer_type_id`, `document_number`, `identification_number`, `contact_name`, `email`, `whatsapp`, `phone`, `image`, `cep`, `city`, `uf`, `address`, `number`, `complement`, `neighborhood`, `action_user`, `discontinued`, `role`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Stracke LLC', 1, 'Fisica', 1, '77994652557', '8213689251', 'Prof. Raven Hartmann DDS', 'beaulah.crist@example.net', '+1 (925) 666-2133', '+1-207-887-7193', NULL, '28595', 'Gradyville', 'MG', '33846 Anya Parkways Apt. 977', '6274', 'Apt. 446', 'Dante Passage', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(2, 'Rohan, Ziemann and Parker', 2, 'Fisica', 1, '62895471436', '2358930556', 'Else Mitchell', 'talon37@example.net', '+1-623-751-0876', '(229) 837-1258', NULL, '15079-5027', 'South Darwinhaven', 'MG', '814 Bailey Point', '285', 'Suite 564', 'Gerhold Parks', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(3, 'Roberts Inc', 2, 'Juridica', 1, '70134365698094', '3834915204', 'Aliza Aufderhar', 'cassandre.mayer@example.org', '339-360-0857', '(937) 681-7891', NULL, '34689', 'North Kasandra', 'MG', '656 Celestino Island Suite 045', '81465', 'Suite 466', 'Reggie Village', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(4, 'Bashirian-Connelly', 4, 'Fisica', 1, '44764010666', '2142484675', 'Brycen Streich', 'marcia91@example.org', '1-347-464-0318', '1-901-786-2824', NULL, '96859', 'South Macside', 'MG', '8717 Effie Lodge', '9882', 'Suite 075', 'Estel Dale', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(5, 'Hyatt-Russel', 2, 'Juridica', 1, '50702749388297', '3227054425', 'Virginia Baumbach', 'grussel@example.org', '+1 (805) 395-9112', '412-832-1175', NULL, '06977-6208', 'Rudolphchester', 'MG', '35252 Davis Drive Suite 079', '94658', 'Apt. 696', 'Elsa Viaduct', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(6, 'Kessler-Klein', 1, 'Fisica', 1, '01998285804', '4372023147', 'Alexzander Mayer', 'schultz.jadon@example.net', '+1.856.384.1327', '+1-442-325-3398', NULL, '36851', 'New Violetshire', 'MG', '3884 Myah Park Apt. 189', '5840', 'Suite 892', 'Witting Locks', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(7, 'Swaniawski-Wunsch', 2, 'Juridica', 1, '46400158495612', '9514625091', 'Marcellus Lind', 'brandi.shanahan@example.org', '+1-765-448-8350', '(646) 705-1475', NULL, '01238-2502', 'Lake Estelfurt', 'MG', '67053 Skyla Fort', '28308', 'Suite 869', 'Strosin Glen', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(8, 'Ebert PLC', 4, 'Fisica', 1, '58452351976', '9322143394', 'Jenifer Adams', 'maverick.grimes@example.org', '+1.515.393.7290', '917.969.8685', NULL, '38747-3249', 'Miltonfort', 'MG', '68813 Altenwerth Mountains', '50997', 'Suite 638', 'Hahn Parkways', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(9, 'Kuhlman, Schmeler and Kemmer', 1, 'Fisica', 1, '81467369802', '4481107142', 'Kendrick Mosciski', 'phyllis07@example.net', '270-313-2516', '+1-312-884-0482', NULL, '25949', 'Julietview', 'MG', '804 Kennith Landing', '227', 'Apt. 435', 'Jedidiah Mills', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(10, 'D\'Amore Inc', 1, 'Fisica', 1, '27965458900', '7446135565', 'Rocky Lehner', 'torphy.camden@example.com', '726-342-2801', '+1 (678) 644-2324', NULL, '76254', 'Georgiannafurt', 'MG', '693 Esther Mount', '54603', 'Suite 631', 'Humberto Vista', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(11, 'Stehr-Rosenbaum', 4, 'Juridica', 1, '01959643018762', '3598513440', 'Hyman Greenfelder', 'randall66@example.org', '+1 (202) 613-1732', '1-781-387-1119', NULL, '99708-0016', 'North Osvaldo', 'MG', '7773 Maci Track Suite 313', '258', 'Apt. 447', 'Milo Islands', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(12, 'Pacocha-White', 3, 'Juridica', 1, '85917369888141', '5884508428', 'Curt Herman', 'morris.weissnat@example.com', '+13515230880', '(727) 247-0314', NULL, '59445', 'Alfredaborough', 'MG', '83525 August Rue Suite 200', '9936', 'Apt. 517', 'Purdy Club', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(13, 'Beahan-Blanda', 4, 'Fisica', 1, '01910091642', '2823174257', 'Keon Witting', 'tgottlieb@example.net', '1-414-703-8610', '1-559-989-5294', NULL, '40379-2958', 'Gladycefort', 'MG', '147 Janelle Tunnel Suite 676', '6147', 'Apt. 433', 'Sabina Field', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(14, 'Kulas-Reynolds', 4, 'Juridica', 1, '93763945399138', '7087276328', 'Maia Nolan', 'johnston.charley@example.com', '+1-762-640-6066', '+1-424-327-4014', NULL, '80674-5108', 'South Thalia', 'MG', '370 Gorczany Rapids', '575', 'Suite 915', 'Wuckert Stravenue', 'Criado por: Seeder em 2024-07-27 16:16:25', 0, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(15, 'Tromp LLC', 1, 'Fisica', 1, '54092620853', '9310186847', 'Wilson Trantow', 'will.vern@example.org', '573-373-4381', '+1-385-966-2432', NULL, '16056-4557', 'Lake Camren', 'MG', '46443 Rosamond Summit', '1744', 'Suite 776', 'Kristy Forest', 'Criado por: Seeder em 2024-07-27 16:16:25', 1, 'customer', NULL, '2024-07-27 19:16:25', '2024-07-27 19:16:25'),
(16, 'Bahringer-Rowe', 1, 'Juridica', 1, '22273799973503', '8080248423', 'Dr. Lavon Maggio', 'darrick.wunsch@example.com', '907.728.8498', '(223) 265-4127', NULL, '38553', 'South Destinee', 'MG', '2795 Avis Plains Apt. 523', '61106', 'Suite 239', 'Gutkowski Burgs', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(17, 'Medhurst, Kshlerin and Schultz', 2, 'Juridica', 1, '02930205977650', '2514582683', 'Jasper Bosco', 'hailie.bernhard@example.com', '+18055326089', '915-430-2584', NULL, '61402', 'Spencershire', 'MG', '324 Altenwerth Keys Apt. 522', '5411', 'Apt. 664', 'Hansen Camp', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(18, 'Kassulke-Mills', 3, 'Juridica', 1, '20582685663324', '2266763009', 'Newell Russel', 'raynor.vallie@example.org', '+1 (424) 400-6500', '612.739.2653', NULL, '13367-2513', 'Port Annamarie', 'MG', '620 Stracke Forest Suite 019', '796', 'Suite 581', 'Concepcion Harbors', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(19, 'Kirlin, Boehm and Terry', 4, 'Fisica', 1, '19797082741', '3628305253', 'Lillie Towne', 'ebba66@example.com', '+1.651.652.8861', '+1.269.713.0412', NULL, '36674-0386', 'South Zacheryfort', 'MG', '277 Mercedes Villages', '61357', 'Apt. 385', 'Prosacco Circles', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(20, 'Shields Inc', 2, 'Juridica', 1, '07880254817103', '4529142797', 'Dr. Rosemarie Bode', 'queenie93@example.com', '769-917-9643', '1-341-752-5774', NULL, '66367', 'North Laney', 'MG', '9486 Vicenta Fort Apt. 149', '64437', 'Suite 218', 'Mabel Road', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(21, 'Deckow Inc', 1, 'Juridica', 1, '60252146005034', '8560514664', 'Dr. Leta Yundt IV', 'carleton61@example.org', '+1 (317) 731-6726', '435.579.6078', NULL, '56827-0247', 'Brennonstad', 'MG', '464 Gisselle Lock', '6983', 'Suite 371', 'Klein Curve', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(22, 'Bogan, Rohan and Williamson', 2, 'Juridica', 1, '16534293726845', '5730260912', 'Tyree Mayert', 'lmante@example.net', '+1-754-526-9024', '+1-480-442-9015', NULL, '54306-0931', 'Betsyfort', 'MG', '5725 Adam Ferry', '91812', 'Suite 094', 'Pollich Via', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(23, 'Lakin-Friesen', 1, 'Fisica', 1, '50989517209', '2295827305', 'Dr. Sonia Boyle', 'bcasper@example.org', '+1 (559) 639-6349', '+1-318-963-6451', NULL, '96880-7895', 'Blickchester', 'MG', '6408 Otto Forge Suite 341', '67769', 'Suite 664', 'Ebert Circles', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(24, 'Walsh, King and Mueller', 2, 'Juridica', 1, '25525370880114', '7422175147', 'Faustino Rosenbaum DVM', 'reba90@example.org', '+1 (307) 862-6534', '+1-254-798-4338', NULL, '28840', 'South Cesar', 'MG', '414 Cronin Tunnel Apt. 427', '3383', 'Apt. 522', 'Kirlin Flat', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(25, 'Miller, Bergnaum and Price', 2, 'Juridica', 1, '04299824211107', '4838715984', 'Prof. Clyde Rippin', 'cassandre.kulas@example.org', '1-412-389-0330', '(682) 545-0832', NULL, '96851-6543', 'McCulloughport', 'MG', '29355 Albina Stravenue', '746', 'Apt. 505', 'Walsh Ridge', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(26, 'Orn-Pfeffer', 1, 'Juridica', 1, '22006285831100', '8597124177', 'Ms. Crystal Jast III', 'qkreiger@example.org', '223.277.3935', '1-336-419-8765', NULL, '95269', 'Jacobsonhaven', 'MG', '71576 Jerde Island Apt. 787', '103', 'Suite 011', 'Giuseppe Way', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(27, 'Ritchie, Stehr and Stoltenberg', 4, 'Fisica', 1, '55199699229', '5953518288', 'Ms. Kaylee Wunsch', 'mglover@example.net', '+13643158416', '+1 (346) 633-7620', NULL, '96130', 'Carrieside', 'MG', '4971 Cruickshank Camp', '682', 'Suite 805', 'Brannon Mill', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(28, 'Aufderhar, Romaguera and Franecki', 2, 'Fisica', 1, '20731044959', '4992109685', 'Wallace Green', 'nleannon@example.com', '864-579-6681', '(810) 963-3534', NULL, '59187', 'West Odessahaven', 'MG', '4021 Rubye Villages', '8619', 'Suite 282', 'Dee Skyway', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(29, 'McGlynn, Corwin and White', 1, 'Juridica', 1, '36747725731211', '5007722468', 'Dr. Ansley Schulist', 'tpagac@example.org', '1-417-295-6735', '(804) 252-8856', NULL, '44175-9838', 'Joycemouth', 'MG', '3179 Bruen Springs Suite 490', '777', 'Apt. 267', 'Thompson Landing', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(30, 'Cassin Group', 4, 'Fisica', 1, '87196134230', '9325928877', 'Prof. Kyler Denesik', 'awilliamson@example.net', '937-291-3585', '430.561.5812', NULL, '50145-6847', 'Simstad', 'MG', '749 Pfeffer Camp', '4062', 'Apt. 608', 'Janick Divide', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(31, 'Gulgowski-Prohaska', 2, 'Fisica', 1, '35202275331', '3829483301', 'Gennaro Lemke', 'garrison62@example.net', '+1-740-499-2084', '951-286-7780', NULL, '31466', 'North Jayberg', 'MG', '321 Grady Light', '8246', 'Suite 656', 'Carissa Green', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(32, 'Kuvalis Ltd', 3, 'Juridica', 1, '09015951816575', '3306031471', 'Edward D\'Amore', 'hrau@example.com', '205-653-7402', '+1-386-550-6212', NULL, '62274', 'New Cloydside', 'MG', '1798 Camryn Causeway Suite 601', '43763', 'Apt. 189', 'Sanford Trail', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(33, 'Conn-Padberg', 2, 'Fisica', 1, '02925799698', '2108987399', 'Dewitt Hane', 'lulu.grant@example.net', '251-738-9672', '+1-239-331-5767', NULL, '24227', 'South Santaberg', 'MG', '756 Ericka Expressway Suite 333', '8413', 'Apt. 584', 'Janae Forge', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(34, 'Parker-Upton', 3, 'Juridica', 1, '73934035760486', '3671296703', 'Dr. Jessy Brown', 'easton41@example.com', '+1.660.908.1352', '+1.612.878.8004', NULL, '21709-6436', 'Brigitteside', 'MG', '586 Kacie Trafficway', '257', 'Apt. 588', 'Russel Springs', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(35, 'Towne-Zieme', 2, 'Fisica', 1, '26366875219', '6643069146', 'Dr. Allan Kuhlman IV', 'mraz.jessica@example.org', '+12037792178', '1-240-892-5849', NULL, '40823-3402', 'Port Arvidport', 'MG', '804 Kathleen Ranch', '3590', 'Suite 576', 'Osinski Parkways', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(36, 'Lowe-Hackett', 4, 'Juridica', 1, '55397144228728', '0639960541', 'Mr. Blake West', 'everardo.zieme@example.net', '(786) 929-1283', '+1 (830) 516-0211', NULL, '90029', 'Osinskiberg', 'MG', '896 Juvenal Rest Apt. 083', '50937', 'Suite 463', 'Bruen Fields', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(37, 'Towne-Conn', 1, 'Juridica', 1, '73576790900890', '7665021256', 'Bell Gerhold', 'pfunk@example.com', '(878) 674-1761', '(234) 418-4699', NULL, '86789', 'East Jaceyside', 'MG', '88916 Hoyt Walks Suite 663', '9775', 'Apt. 235', 'Fleta Mills', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(38, 'Sipes, Hansen and Schiller', 4, 'Juridica', 1, '31843253004148', '8195188538', 'Jackeline Hudson', 'mlabadie@example.org', '+1 (703) 615-9118', '+1-508-968-3967', NULL, '09708-1697', 'Port Michaelaview', 'MG', '731 Veronica Mission', '734', 'Suite 432', 'Pfeffer Road', 'Criado por: Seeder em 2024-07-27 16:16:26', 0, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(39, 'Grimes-Volkman', 4, 'Fisica', 1, '01121773524', '4270060533', 'Ford Ryan', 'angelica93@example.com', '(463) 520-1974', '+1 (445) 502-5445', NULL, '38195-2208', 'East Ramirochester', 'MG', '99209 Stella Lane', '501', 'Apt. 867', 'Watsica Island', 'Criado por: Seeder em 2024-07-27 16:16:26', 1, 'customer', NULL, '2024-07-27 19:16:26', '2024-07-27 19:16:26'),
(40, 'O\'Reilly, Cormier and Ankunding', 2, 'Fisica', 1, '94668142654', '3845798662', 'Prof. Desmond Luettgen V', 'waters.issac@example.net', '+16417390756', '+1 (734) 219-0491', NULL, '35482', 'D\'Amoreton', 'MG', '214 Schaefer Plains Suite 275', '98408', 'Apt. 522', 'King Lodge', 'Criado por: Seeder em 2024-07-27 16:16:27', 0, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(41, 'Towne-Ratke', 3, 'Juridica', 1, '89379162462998', '4438988582', 'Prof. Elisha Metz', 'kulas.valentina@example.com', '+18726268982', '1-708-614-3501', NULL, '56175-5282', 'South Buddy', 'MG', '534 Brekke Orchard', '44556', 'Apt. 153', 'Lincoln Knoll', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(42, 'Koepp and Sons', 1, 'Fisica', 1, '69182962057', '7072107592', 'Ansel Hartmann', 'courtney.effertz@example.com', '+1.952.282.2446', '(831) 447-2143', NULL, '56141', 'North Providenciberg', 'MG', '715 Bertrand Spur', '55052', 'Apt. 642', 'Lupe Drive', 'Criado por: Seeder em 2024-07-27 16:16:27', 0, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(43, 'Lang-Kiehn', 4, 'Juridica', 1, '54459342098829', '1716623421', 'Domenico Watsica', 'harmony93@example.org', '+1 (806) 549-9088', '708-778-1820', NULL, '10139-5081', 'Lake Onie', 'MG', '8231 Parker Haven Apt. 403', '158', 'Apt. 866', 'Lamar Plain', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(44, 'Wiegand, Rohan and Lebsack', 2, 'Juridica', 1, '94739248938854', '9308843667', 'Monty Hermann I', 'thomas74@example.com', '410-381-7129', '603.370.4971', NULL, '01869', 'Lake Garnet', 'MG', '335 Dickinson Gardens', '665', 'Suite 016', 'Kutch Island', 'Criado por: Seeder em 2024-07-27 16:16:27', 0, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(45, 'Boehm PLC', 4, 'Juridica', 1, '73216048500930', '0493725535', 'Enrico Erdman', 'fbatz@example.com', '+1 (760) 831-4307', '+1-850-737-5641', NULL, '80628-9258', 'Port Pearlie', 'MG', '7333 Karson Heights Apt. 633', '6765', 'Suite 003', 'Rex Dale', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(46, 'Larkin, Padberg and Wiza', 4, 'Fisica', 1, '34197281153', '1065433675', 'Murl Reynolds PhD', 'freda03@example.org', '+1-445-767-8653', '+1-786-362-3845', NULL, '19154', 'West Cletaberg', 'MG', '290 Odell Islands', '2950', 'Apt. 310', 'Jarod Shoals', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(47, 'Halvorson, Fritsch and Stanton', 3, 'Fisica', 1, '08323655642', '6418147628', 'Ezequiel Jones', 'hnienow@example.net', '+1-413-439-0834', '1-763-930-6799', NULL, '80971-0757', 'Port Stone', 'MG', '952 Boehm Spring Suite 658', '701', 'Suite 148', 'Metz Prairie', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(48, 'Walsh, Gaylord and Nader', 2, 'Fisica', 1, '11260299554', '4981070641', 'Dawn Hahn', 'hipolito52@example.net', '+1-817-410-5061', '202.256.7721', NULL, '13011-9304', 'East Leannemouth', 'MG', '44025 Greyson Junction', '432', 'Suite 301', 'Natalia Expressway', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(49, 'Grady-Connelly', 4, 'Fisica', 1, '54932626142', '8218905362', 'Wiley Waters', 'murazik.angie@example.net', '1-212-615-8121', '513-217-1576', NULL, '52776', 'West Inesburgh', 'MG', '5403 Daija Branch Suite 502', '56914', 'Suite 014', 'Daren Garden', 'Criado por: Seeder em 2024-07-27 16:16:27', 1, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27'),
(50, 'Weimann, Kilback and Bergnaum', 2, 'Fisica', 1, '22593389095', '5358086089', 'Zoey Romaguera', 'vita.carroll@example.com', '669.809.5447', '1-424-890-5139', NULL, '97261', 'Lehnerstad', 'MG', '6725 Schowalter Landing Apt. 378', '2718', 'Suite 649', 'Wisoky Islands', 'Criado por: Seeder em 2024-07-27 16:16:27', 0, 'customer', NULL, '2024-07-27 19:16:27', '2024-07-27 19:16:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `customer_types`
--

CREATE TABLE `customer_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `customer_types`
--

INSERT INTO `customer_types` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Consumidor Final', 'Consumidor final para vendas diretas.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(2, 'Revendedor', 'Revendedor autorizado dos produtos.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(3, 'Representante', 'Representante comercial que atua na venda dos produtos.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(4, 'Distribuidor', 'Distribui produtos para revendedores ou varejistas.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(5, 'Atacadista', 'Compra produtos em grandes quantidades e os vende em quantidades menores para revendedores.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(6, 'Varejista', 'Vende produtos diretamente aos consumidores finais.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(7, 'Institucional', 'Compra produtos para uso institucional, como escolas, hospitais ou governos.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(8, 'Corporativo', 'Grandes empresas que compram produtos para uso interno ou para seus funcionários.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(9, 'E-commerce', 'Vende produtos exclusivamente online.', '2024-07-27 19:16:24', '2024-07-27 19:16:24'),
(10, 'Franquia', 'Opera sob uma franquia de uma marca conhecida, seguindo padrões estabelecidos pela franqueadora.', '2024-07-27 19:16:24', '2024-07-27 19:16:24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `office_id` bigint(20) UNSIGNED NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `role` enum('admin','employee','customer','supplier','finance','sale') NOT NULL DEFAULT 'employee',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `employees`
--

INSERT INTO `employees` (`id`, `name`, `user_id`, `office_id`, `cpf`, `identification_number`, `contact_name`, `email`, `whatsapp`, `phone`, `cep`, `city`, `uf`, `address`, `number`, `image`, `complement`, `neighborhood`, `action_user`, `discontinued`, `role`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ward, Thompson and Franecki', 1, 19, '17008039808', '9735441379', 'Stevie Connelly', 'emily.carter@example.com', '669.475.1377', '+1-838-319-4924', '92113-2003', 'Walterfort', 'MG', '7316 Mosciski Points Suite 565', '874', NULL, 'Suite 220', 'Shanahan Glens', 'Criado por: Seeder em 2024-07-27 16:18:05', 1, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(2, 'Kiehn, Kutch and Klein', 3, 1, '93444278284', '0240833176', 'Christiana Romaguera', 'wgrady@example.net', '765-357-3748', '+1.769.656.0550', '14654-8236', 'South Jerodside', 'MG', '878 Lottie Route', '819', NULL, 'Apt. 626', 'Herman Parks', 'Criado por: Seeder em 2024-07-27 16:18:05', 0, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(3, 'Langosh LLC', 3, 9, '81536207462', '4293624245', 'Alf Marvin', 'marta39@example.com', '+1-251-726-7626', '681.725.2226', '56182-1495', 'Ressieborough', 'MG', '2549 Wisozk Walks Apt. 362', '921', NULL, 'Suite 133', 'Heloise Courts', 'Criado por: Seeder em 2024-07-27 16:18:05', 1, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(4, 'Rath, Hane and Mann', 4, 9, '67360163714', '3611394613', 'Mrs. Francesca Boyle', 'conroy.carolina@example.com', '+1 (425) 598-2604', '984.281.7415', '65245-4698', 'South Jaron', 'MG', '443 Streich Cliff', '6945', NULL, 'Apt. 672', 'Ziemann Crescent', 'Criado por: Seeder em 2024-07-27 16:18:05', 1, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(5, 'Kohler, Eichmann and Sauer', 2, 14, '31251928382', '1377033850', 'Noemie Pfannerstill', 'babshire@example.org', '203-418-6608', '+14428291746', '89357-4043', 'Lake Madonna', 'MG', '858 Kamren Vista', '33531', NULL, 'Apt. 128', 'Weimann Crest', 'Criado por: Seeder em 2024-07-27 16:18:05', 0, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(6, 'Huels Inc', 2, 4, '41606707922', '1971488590', 'Prof. Mae Erdman MD', 'rodrigo.barton@example.org', '(872) 237-7435', '301.283.7457', '51380-5797', 'Janyhaven', 'MG', '143 Idell River Apt. 805', '41341', NULL, 'Apt. 416', 'Klocko Locks', 'Criado por: Seeder em 2024-07-27 16:18:05', 1, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(7, 'Baumbach, Konopelski and Shields', 3, 21, '37902490334', '1678345896', 'Rafael Kautzer V', 'damore.halie@example.com', '1-234-949-0990', '267-624-5397', '62391-7830', 'Aryannaborough', 'MG', '3435 Breitenberg Coves', '489', NULL, 'Suite 317', 'Runolfsdottir Rest', 'Criado por: Seeder em 2024-07-27 16:18:05', 1, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(8, 'Leffler PLC', 2, 13, '06511989682', '7144333314', 'Jules Koch', 'erick13@example.net', '+1 (740) 573-2758', '346.722.2239', '34489', 'Janetmouth', 'MG', '91993 Shanny Ferry', '2983', NULL, 'Apt. 171', 'Schmidt Heights', 'Criado por: Seeder em 2024-07-27 16:18:05', 0, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(9, 'Larson-Hahn', 4, 1, '74135132189', '8037290141', 'Elisha Hettinger', 'hammes.americo@example.com', '1-808-404-5754', '+1-551-354-2999', '93566-8322', 'Jackyview', 'MG', '4589 Jimmy Valley', '55409', NULL, 'Apt. 050', 'Will Ways', 'Criado por: Seeder em 2024-07-27 16:18:05', 1, 'employee', NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(10, 'Stracke, Leffler and Nienow', 1, 7, '71167351002', '1027763504', 'Chester Luettgen DVM', 'kohler.evans@example.org', '682-933-1389', '+15348137238', '14622-5530', 'West Sid', 'MG', '57701 O\'Hara Crossroad Suite 867', '66220', NULL, 'Suite 636', 'Parisian Dam', 'Criado por: Seeder em 2024-07-27 16:18:06', 1, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(11, 'Paucek-Botsford', 2, 1, '02204285650', '2958058581', 'Karianne Connelly Jr.', 'era.schuster@example.com', '(636) 713-9852', '+1-985-956-2385', '50777', 'Bettyshire', 'MG', '1561 Edna Coves Apt. 906', '6839', NULL, 'Apt. 061', 'Schmidt Rapids', 'Criado por: Seeder em 2024-07-27 16:18:06', 1, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(12, 'Wilderman, Toy and Schinner', 1, 13, '82842478606', '3695788436', 'Jaylen Steuber III', 'tate.spencer@example.org', '269-686-9172', '402.244.6894', '01647', 'South Jettchester', 'MG', '11794 Erdman Drives', '67986', NULL, 'Suite 254', 'Herta Square', 'Criado por: Seeder em 2024-07-27 16:18:06', 1, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(13, 'Ullrich, Strosin and Nicolas', 3, 18, '28657347652', '9517928900', 'Dr. Jasmin Gleason', 'ernser.wendy@example.org', '1-559-704-6823', '+17475712127', '94949', 'Elodyport', 'MG', '49696 Simonis Mill', '85555', NULL, 'Suite 148', 'Flatley Terrace', 'Criado por: Seeder em 2024-07-27 16:18:06', 0, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(14, 'Toy, Boyer and Grady', 4, 13, '44091007937', '8090227148', 'Colton Erdman DDS', 'greta40@example.net', '(571) 768-2829', '334.831.6607', '83435-8950', 'Rogahntown', 'MG', '827 Meta Islands Suite 025', '863', NULL, 'Apt. 965', 'Payton Unions', 'Criado por: Seeder em 2024-07-27 16:18:06', 0, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(15, 'Schimmel Ltd', 4, 18, '00551321709', '8702889111', 'Darian Weissnat', 'gene.graham@example.com', '678-339-4477', '+1-573-422-8259', '71189-8804', 'Stokesborough', 'MG', '687 Nola Ports', '952', NULL, 'Apt. 200', 'McClure Cove', 'Criado por: Seeder em 2024-07-27 16:18:06', 1, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(16, 'Crist-Fahey', 3, 3, '58926798704', '1218360076', 'Chanelle Gleason', 'gwen53@example.com', '+15515145941', '820-558-3633', '43549', 'South Melba', 'MG', '7010 Gorczany Shoals', '333', NULL, 'Suite 919', 'Imelda Glen', 'Criado por: Seeder em 2024-07-27 16:18:06', 0, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(17, 'Ward and Sons', 2, 27, '18746318917', '7640151933', 'Gabrielle Schuster', 'margot18@example.com', '+1 (463) 548-7061', '+1-520-595-0938', '59349', 'Port Heathshire', 'MG', '1851 Regan Port', '42441', NULL, 'Apt. 318', 'VonRueden Path', 'Criado por: Seeder em 2024-07-27 16:18:06', 1, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(18, 'Reynolds-Sanford', 1, 2, '12274017956', '9443098200', 'Gordon Hermiston', 'bbaumbach@example.org', '1-434-534-5138', '+1-727-893-2528', '13028-1009', 'West Arnaldoshire', 'MG', '5866 O\'Hara Spurs Suite 170', '85247', NULL, 'Suite 740', 'Dameon Burgs', 'Criado por: Seeder em 2024-07-27 16:18:06', 1, 'employee', NULL, '2024-07-27 19:18:06', '2024-07-27 19:18:06'),
(19, 'Pfannerstill and Sons', 4, 10, '05013060567', '1577389696', 'Chadrick Wintheiser', 'xherman@example.net', '+1-872-547-3910', '1-757-498-9673', '96670-7828', 'West Sandrine', 'MG', '124 Betty Greens Apt. 841', '883', NULL, 'Suite 599', 'Raheem Avenue', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(20, 'Gusikowski-Kautzer', 2, 25, '90336472145', '7759137049', 'Graciela Weimann DVM', 'predovic.vada@example.net', '+1-858-607-2287', '253-468-1525', '74739-7763', 'North Margarita', 'MG', '13484 Batz Lakes Apt. 274', '69534', NULL, 'Apt. 338', 'Vida Skyway', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(21, 'Sauer, Hansen and Walker', 1, 27, '23590761407', '8376694614', 'Mr. Emanuel Will MD', 'magnus34@example.com', '+12696850742', '+1 (626) 464-0755', '47770-9822', 'South Geoville', 'MG', '474 Wisozk Street', '7547', NULL, 'Apt. 606', 'Retha Lake', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(22, 'Keeling, Bechtelar and Morissette', 4, 25, '77445369910', '1197406945', 'Garret Reynolds', 'matilde11@example.org', '+1-351-627-2467', '405.552.6330', '26125', 'Hermannfort', 'MG', '6987 Kunde Points Apt. 993', '46813', NULL, 'Apt. 228', 'Shanelle Circles', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(23, 'Rau, Lebsack and Miller', 1, 21, '26679028906', '6266931433', 'Armani Kuvalis', 'oconnell.cooper@example.com', '+1-678-493-3033', '+1-714-991-1248', '26177', 'West Brycemouth', 'MG', '106 Garnet Fields', '92420', NULL, 'Apt. 109', 'Sanford Forges', 'Criado por: Seeder em 2024-07-27 16:18:07', 1, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(24, 'Walker Group', 2, 25, '83115352484', '5993550420', 'Margarett Mayer', 'lura01@example.net', '1-386-440-9936', '+15317281934', '65787', 'Germainemouth', 'MG', '778 Hermann Ports', '306', NULL, 'Apt. 301', 'Maritza Street', 'Criado por: Seeder em 2024-07-27 16:18:07', 1, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(25, 'Rippin, Carter and Wisoky', 1, 27, '89770490679', '6173086609', 'Haley Yundt', 'annalise.lebsack@example.com', '+1.628.437.6387', '727-614-5591', '51915-3931', 'Dominicstad', 'MG', '447 Palma Pines Suite 294', '71082', NULL, 'Suite 251', 'Keeley Locks', 'Criado por: Seeder em 2024-07-27 16:18:07', 1, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(26, 'Walsh-Keebler', 4, 4, '09802605077', '9934928889', 'Domingo Mann', 'mbauch@example.org', '(404) 526-7911', '1-870-735-6052', '23332', 'New Jaredville', 'MG', '506 Wunsch Dam', '1516', NULL, 'Apt. 665', 'Eulalia Dale', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(27, 'Windler, Huel and Witting', 4, 28, '04337791523', '8780708449', 'Dr. Israel Abernathy III', 'juvenal.walker@example.org', '703.445.2433', '813-587-2302', '33267', 'East Fannyton', 'MG', '76526 Liam River', '97086', NULL, 'Suite 119', 'Margot Street', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(28, 'Barrows PLC', 2, 17, '16163141849', '2364289938', 'Prof. Jesus Lind DDS', 'reynolds.jakob@example.net', '1-341-489-9907', '+1-831-779-8570', '13503-5399', 'Rheamouth', 'MG', '456 Akeem Divide', '602', NULL, 'Apt. 555', 'Buckridge Islands', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(29, 'Lockman-Mertz', 2, 24, '34393081978', '6651462186', 'Alexander Grimes', 'abatz@example.net', '+1-256-397-4441', '(463) 910-3825', '82372', 'Edgardoport', 'MG', '2552 Liza Islands Apt. 606', '679', NULL, 'Apt. 314', 'Adriana Hill', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(30, 'Turcotte-Fisher', 2, 13, '34178207822', '1906761799', 'Tianna Skiles', 'uauer@example.com', '+1.361.347.0680', '(217) 777-5548', '98043', 'Hamillberg', 'MG', '65017 Heidenreich Crossing Suite 239', '1255', NULL, 'Suite 915', 'Adella Ramp', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(31, 'Ullrich Ltd', 1, 7, '27623637568', '9796525115', 'Mr. Keagan Fahey', 'irving37@example.org', '+1-832-612-7621', '463.393.5986', '27649', 'Lindgrenstad', 'MG', '470 Robel Flats', '872', NULL, 'Suite 450', 'Koepp Mill', 'Criado por: Seeder em 2024-07-27 16:18:07', 0, 'employee', NULL, '2024-07-27 19:18:07', '2024-07-27 19:18:07'),
(32, 'Waters, Kertzmann and Lockman', 4, 2, '42043600923', '9783670689', 'Dayna Brown', 'norberto02@example.com', '+14018123154', '(341) 216-5446', '51513', 'New Elise', 'MG', '19182 Nestor Islands', '16749', NULL, 'Suite 788', 'Steuber Junctions', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(33, 'Reichert, Koepp and Schowalter', 4, 28, '44029737080', '0026893230', 'Maeve Sporer DDS', 'dashawn.barrows@example.org', '1-229-780-8420', '1-458-230-3506', '27804', 'Pagacville', 'MG', '864 Ferry Mission', '3046', NULL, 'Suite 887', 'Josie Spring', 'Criado por: Seeder em 2024-07-27 16:18:08', 0, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(34, 'Hills-Luettgen', 4, 20, '23278884760', '7238696335', 'Jonathon Considine', 'amie92@example.com', '+1-650-359-1021', '(260) 667-5004', '37889-0755', 'Alisaside', 'MG', '29206 Justyn Ridge Suite 299', '331', NULL, 'Suite 346', 'Haag Coves', 'Criado por: Seeder em 2024-07-27 16:18:08', 0, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(35, 'Smitham PLC', 1, 25, '76762521720', '6215645029', 'Maddison Sipes', 'udubuque@example.org', '1-906-382-6850', '580-988-6223', '25278', 'Autumnbury', 'MG', '17064 Schuppe Unions', '67679', NULL, 'Apt. 214', 'Shawn Springs', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(36, 'Abshire-Parker', 2, 22, '68670851130', '3749946382', 'Mr. Jordon Pacocha', 'greenholt.clotilde@example.com', '+1-510-238-1018', '1-231-677-2257', '91387', 'Josefafort', 'MG', '309 Treutel Path', '2679', NULL, 'Suite 024', 'Langosh Circle', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(37, 'Williamson and Sons', 3, 13, '66628562310', '7492955382', 'Claud Batz', 'lee50@example.org', '1-314-600-5766', '(347) 704-4297', '45806', 'Townemouth', 'MG', '55748 Ricardo Shoal', '891', NULL, 'Suite 300', 'Ashley Prairie', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(38, 'Bode-Wiegand', 1, 17, '79707830662', '3215389008', 'Frederique Waters', 'rau.estrella@example.com', '405.573.9329', '1-480-414-7277', '89525-1035', 'Feiltown', 'MG', '4497 Beier River', '78717', NULL, 'Apt. 752', 'Corwin Via', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(39, 'Considine, Gutkowski and Schulist', 2, 3, '38825518870', '8868769308', 'Elmo Erdman', 'alyce.bergnaum@example.net', '+1-360-565-3168', '206.729.6551', '51425-6133', 'Eleanorefurt', 'MG', '1086 Stehr Fall', '898', NULL, 'Suite 224', 'Morissette Islands', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(40, 'Goldner-Torp', 3, 10, '22304619746', '5848490336', 'Mae Williamson', 'rempel.edgar@example.com', '330.983.7262', '+1.380.820.1733', '33049', 'New Alexandre', 'MG', '2919 Howell Falls Apt. 658', '7519', NULL, 'Apt. 230', 'Mann Extensions', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(41, 'Gutmann LLC', 2, 7, '90489490689', '0643897908', 'Iva Crooks', 'dane.harber@example.org', '1-862-766-6167', '680-972-4220', '50280-0128', 'Shaynamouth', 'MG', '921 Carmen Pine', '206', NULL, 'Suite 447', 'Deja Shores', 'Criado por: Seeder em 2024-07-27 16:18:08', 0, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(42, 'Cormier LLC', 1, 27, '14204352642', '1405297121', 'Denis Pollich', 'bosco.letha@example.org', '(256) 332-8645', '+17725132967', '33162', 'Clotildestad', 'MG', '886 Dooley Islands', '363', NULL, 'Apt. 622', 'Beer Hollow', 'Criado por: Seeder em 2024-07-27 16:18:08', 0, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(43, 'Hill, Bins and Rosenbaum', 1, 26, '10047309504', '1004457504', 'Kody Hoppe II', 'abigayle93@example.net', '+1-202-984-1724', '+1-985-987-8580', '82258', 'Kubport', 'MG', '3209 Lysanne Drive Suite 976', '8803', NULL, 'Apt. 570', 'Terry Island', 'Criado por: Seeder em 2024-07-27 16:18:08', 1, 'employee', NULL, '2024-07-27 19:18:08', '2024-07-27 19:18:08'),
(44, 'Maggio Group', 4, 9, '05901655265', '1915989541', 'Miss Kavon Hermiston MD', 'kwilkinson@example.com', '(743) 552-7302', '385-669-1735', '41486', 'Luettgenbury', 'MG', '34137 Grant Junction Suite 193', '2209', NULL, 'Apt. 772', 'Adams Mill', 'Criado por: Seeder em 2024-07-27 16:18:09', 1, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09'),
(45, 'Kautzer, Ebert and Kertzmann', 2, 23, '33842526750', '9330810556', 'Prof. Irwin Jast', 'tgutkowski@example.net', '+1.858.777.2186', '+1-848-710-2671', '27227', 'Eleanoramouth', 'MG', '906 Leannon Islands Apt. 945', '9377', NULL, 'Suite 067', 'Watsica Lodge', 'Criado por: Seeder em 2024-07-27 16:18:09', 1, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09'),
(46, 'Hand, Sauer and Herman', 1, 28, '58192459209', '3913316043', 'Jason Jaskolski', 'reynolds.vernon@example.com', '1-772-591-6082', '203-903-2451', '26888-4893', 'Mitchelltown', 'MG', '8836 Vivian Tunnel Suite 062', '7076', NULL, 'Suite 019', 'Bailey Court', 'Criado por: Seeder em 2024-07-27 16:18:09', 0, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09'),
(47, 'Kihn-Doyle', 2, 6, '59560366564', '2072558462', 'Armand Upton', 'jacquelyn38@example.com', '(828) 398-1539', '316-418-7412', '67520-3088', 'Zboncakfurt', 'MG', '1552 O\'Conner Vista', '12599', NULL, 'Apt. 733', 'Herzog Ford', 'Criado por: Seeder em 2024-07-27 16:18:09', 1, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09'),
(48, 'Funk and Sons', 2, 1, '97440591330', '8118590121', 'Prof. Jaylen Zemlak IV', 'tillman.runolfsdottir@example.org', '352.809.4575', '214-574-8519', '66584', 'South Roxaneshire', 'MG', '2455 Cassin Landing Apt. 641', '622', NULL, 'Apt. 065', 'Frieda Ways', 'Criado por: Seeder em 2024-07-27 16:18:09', 1, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09'),
(49, 'Blick-Gislason', 2, 24, '32323494635', '8276889313', 'Alek Hermiston', 'agustina.connelly@example.net', '+1 (930) 826-9275', '+1 (309) 834-8213', '99962-2606', 'North Zoeyberg', 'MG', '54050 Bernhard Prairie Apt. 372', '61095', NULL, 'Apt. 946', 'Davonte Junctions', 'Criado por: Seeder em 2024-07-27 16:18:09', 1, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09'),
(50, 'Denesik-Buckridge', 4, 6, '67307057875', '2062089081', 'Eveline Hane', 'fredy.hane@example.net', '347.593.7270', '+1-302-725-6548', '16888', 'Port Nona', 'MG', '8291 Haven Parkways Apt. 303', '878', NULL, 'Apt. 948', 'Bessie Underpass', 'Criado por: Seeder em 2024-07-27 16:18:09', 0, 'employee', NULL, '2024-07-27 19:18:09', '2024-07-27 19:18:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `footers`
--

CREATE TABLE `footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `descripition1` varchar(255) DEFAULT NULL,
  `link1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `descripition2` varchar(255) DEFAULT NULL,
  `link2` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `groups`
--

INSERT INTO `groups` (`id`, `subcategory_id`, `name`, `description`, `image`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Camisa', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(2, 1, 'Camiseta', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(3, 1, 'Blusa', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(4, 1, 'Jaqueta', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(5, 6, 'Manguito', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(6, 6, 'Bandana', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16'),
(7, 6, 'Pernito', '', NULL, 'Criado por:Seeder em 2024-07-27 16:16:16', 0, NULL, '2024-07-27 19:16:16', '2024-07-27 19:16:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_22_151039_create_partners_table', 1),
(5, '2024_05_26_212913_create_personal_access_tokens_table', 1),
(6, '2024_06_03_184710_add_two_factor_columns_to_users_table', 1),
(7, '2024_06_06_125652_create_customer_types_table', 1),
(8, '2024_06_06_134650_create_customers_table', 1),
(9, '2024_06_06_163825_create_supplier_types_table', 1),
(10, '2024_06_06_163836_create_suppliers_table', 1),
(11, '2024_06_06_183444_create_categories_table', 1),
(12, '2024_06_06_183504_create_subcategories_table', 1),
(13, '2024_06_06_183518_create_groups_table', 1),
(14, '2024_06_06_183520_create_subgroups_table', 1),
(15, '2024_06_06_183535_create_colections_table', 1),
(16, '2024_06_06_183543_create_brands_table', 1),
(17, '2024_06_06_183553_create_colors_table', 1),
(18, '2024_06_06_221640_create_products_table', 1),
(19, '2024_06_22_121043_create_companies_table', 1),
(20, '2024_06_22_121125_create_slide_banners_table', 1),
(21, '2024_06_22_121134_create_banners_table', 1),
(22, '2024_06_25_110435_create_sectors_table', 1),
(23, '2024_06_27_115249_create_offices_table', 1),
(24, '2024_06_27_150111_create_employees_table', 1),
(25, '2024_06_29_094832_create_product_images_table', 1),
(26, '2024_06_30_132926_create_ncms_table', 1),
(27, '2024_06_30_144744_create_nfe_entradas_table', 1),
(28, '2024_06_30_145732_create_nfe_items_table', 1),
(29, '2024_06_30_145914_create_nfe_impostos_table', 1),
(30, '2024_07_07_115104_create_product_variations_table', 1),
(31, '2024_07_07_115329_create_sizes_table', 1),
(32, '2024_07_07_120446_create_product_fees_table', 1),
(33, '2024_07_07_120727_create_product_taxes_table', 1),
(34, '2024_07_10_085421_create_projects_tables_table', 1),
(35, '2024_07_12_141422_create_footers_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ncms`
--

CREATE TABLE `ncms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `tipo_ato_ini` varchar(255) NOT NULL,
  `numero_ato_ini` varchar(255) NOT NULL,
  `ano_ato_ini` int(11) NOT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfe_entradas`
--

CREATE TABLE `nfe_entradas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chave_acesso` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `data_emissao` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `nome_emitente` varchar(255) NOT NULL,
  `cnpj_emitente` varchar(255) NOT NULL,
  `nome_destinatario` varchar(255) NOT NULL,
  `cnpj_destinatario` varchar(255) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `valor_icms` decimal(10,2) NOT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `nfe_entradas`
--

INSERT INTO `nfe_entradas` (`id`, `chave_acesso`, `numero`, `serie`, `data_emissao`, `data_recebimento`, `nome_emitente`, `cnpj_emitente`, `nome_destinatario`, `cnpj_destinatario`, `valor_total`, `valor_icms`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '4486564519228085025520126', '75919587', '205', '1990-01-03', '1989-03-17', 'Johns, Jacobs and Wilderman', '29143061179301', 'Hamill LLC', '06571868606042', 8010.49, 653.20, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(2, '3077648085791620124399303', '13974671', '989', '1976-02-20', '1975-03-08', 'Weimann, Crooks and Walsh', '47891213360890', 'Kautzer and Sons', '78997445904231', 4727.03, 758.33, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(3, '5818887061410509659502611', '91088853', '16', '1975-02-21', '1981-12-09', 'Effertz-Mayert', '64809453782484', 'Okuneva-Haley', '36579416333035', 6341.89, 246.34, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(4, '8695374400350121088596894', '62928675', '786', '2003-12-16', '1998-07-17', 'Price-Jenkins', '29339511292126', 'Crona-Balistreri', '26143732966469', 9197.66, 191.33, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(5, '1177055521330640368489611', '47654984', '163', '2015-08-22', '2011-04-10', 'Nader Group', '21652213605225', 'Hill, Orn and Romaguera', '45687777083066', 1892.59, 227.56, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(6, '2987144488375041939707771', '10280647', '705', '1979-08-06', '1982-02-15', 'Mraz, Mertz and Rutherford', '12014015142578', 'Sawayn-Schamberger', '49695756511812', 3805.19, 485.68, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(7, '7311172134548553824409871', '80801243', '91', '1981-03-18', '2024-04-14', 'Bogan-Wolff', '43707414022676', 'Rippin, Kuhic and Paucek', '02979438695052', 7218.94, 277.63, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(8, '9057244158498341302868304', '27630782', '294', '1975-06-28', '1976-06-12', 'Mertz and Sons', '06463819695471', 'Thompson-Walsh', '59124471977397', 5656.65, 827.97, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(9, '0003449495407046119280612', '67216787', '269', '2012-07-19', '1985-03-30', 'Berge, Buckridge and Quitzon', '98942834338765', 'McClure LLC', '92864970990549', 7380.66, 947.49, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(10, '5178695119210111040094533', '91416481', '967', '2000-11-29', '2000-02-10', 'Rice-Monahan', '66229026370946', 'Ward and Sons', '36778300077469', 9297.60, 742.97, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(11, '2133331493078592631328207', '76923775', '329', '2021-03-14', '1982-10-26', 'Okuneva, Jakubowski and Turner', '62357957159330', 'Friesen-Gaylord', '47892107046053', 6709.66, 928.57, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(12, '1117060993442896446010077', '50154475', '474', '1980-08-20', '2003-11-15', 'Cruickshank and Sons', '08797474233061', 'Schoen, Lind and Berge', '23265056735075', 3329.82, 203.20, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(13, '3253157126273142558741659', '71245544', '122', '2003-01-07', '1997-06-13', 'Stroman-Pouros', '64836315041091', 'Kertzmann, O\'Reilly and Mueller', '96684847946093', 7982.09, 37.67, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(14, '3565613294586259765634865', '24423415', '813', '1997-03-18', '1982-09-23', 'Koch Ltd', '68597248697511', 'Turner, Ortiz and Hand', '38203790973363', 3723.00, 313.91, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(15, '9291800201389199586060518', '68848601', '644', '1973-04-06', '1998-05-08', 'Sporer Inc', '40879129059463', 'Welch-Stiedemann', '05603613082338', 4980.64, 740.60, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(16, '9756745043540573487474042', '10828866', '137', '2014-05-28', '2024-02-24', 'Kuhic, Nicolas and Ortiz', '65356872028610', 'Ferry PLC', '88270556918764', 9548.24, 840.90, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(17, '3379481959334228696382345', '61292596', '980', '1978-07-16', '2003-12-06', 'Swift, Rempel and Turner', '79625863847517', 'Koelpin-Sipes', '98124597180637', 9287.73, 883.21, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(18, '5969521294221825397566632', '4334123', '237', '1979-03-04', '2011-04-21', 'Jones Group', '72248769155978', 'Klein Group', '32222235944940', 3455.01, 102.03, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(19, '2580100754619088615513324', '35786226', '729', '2022-08-23', '1977-03-27', 'Fadel-Terry', '26152369437644', 'Glover Group', '49001248358357', 9048.96, 942.69, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(20, '9018930226758293698864463', '61846286', '618', '1984-09-05', '1974-03-07', 'Roob Group', '93783615663362', 'Ebert PLC', '17327410330348', 4590.77, 795.61, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(21, '4406336752025861710761856', '2100921', '656', '1981-08-30', '1998-06-27', 'Okuneva, Robel and Glover', '38741168292712', 'Hintz, Strosin and McLaughlin', '90680755909517', 1129.92, 859.73, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(22, '1154361674784412798935973', '23021016', '984', '1999-03-09', '2017-12-14', 'Wiegand, Jaskolski and O\'Hara', '90797712313667', 'Rempel, Ritchie and Corkery', '45169346909168', 4184.18, 775.31, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(23, '7744376669211337965205691', '98102157', '663', '2016-04-16', '1980-06-29', 'Metz-Becker', '65009933951568', 'Ruecker PLC', '19781393503095', 2112.86, 725.41, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(24, '6223984794376634809585792', '26254465', '252', '2023-05-03', '1970-02-07', 'Streich, Fahey and Keeling', '64190008935342', 'Dare, Raynor and Sipes', '77623620208145', 2507.35, 469.35, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(25, '7868549182170350381463174', '72974166', '496', '2014-02-11', '1987-05-26', 'Pollich-Rosenbaum', '53085924545829', 'Morissette PLC', '94445914767155', 6735.15, 679.25, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(26, '0031800812068300730950913', '99997437', '783', '1992-10-21', '2003-04-28', 'Kilback, Deckow and O\'Hara', '18735575558160', 'Adams Ltd', '97631816395662', 2164.30, 488.50, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(27, '4027885843231004707292112', '60824693', '880', '1971-12-10', '1978-04-01', 'Kovacek-Waelchi', '85917714835676', 'Emard Ltd', '15043271053311', 2017.61, 71.31, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(28, '3695770270162564103449901', '17436687', '356', '2020-06-22', '1981-02-05', 'Lesch, Schmeler and Corkery', '03230828796369', 'Wisozk-Kilback', '09453098109623', 7715.25, 308.34, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(29, '8290510242440716810689979', '57841583', '184', '2015-11-25', '1996-10-20', 'Baumbach, Krajcik and Mitchell', '73486600985173', 'Dibbert Inc', '27848305161164', 3125.31, 452.76, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(30, '9670059685218119777825468', '41278990', '127', '2020-11-02', '1982-06-18', 'Farrell Inc', '01165449733884', 'Pacocha-Sawayn', '63564014830566', 4682.45, 868.17, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(31, '8348038581954440850631545', '63892081', '980', '1982-07-21', '1993-01-13', 'Toy LLC', '51763105240204', 'Yundt-Predovic', '56367772383294', 598.95, 303.82, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(32, '6216826505390660574639248', '89491276', '322', '2001-04-05', '1981-01-02', 'Kertzmann, Gaylord and Waters', '45473668669045', 'Green Ltd', '73623572922386', 4744.71, 725.62, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(33, '3156478326586989599940216', '9353038', '360', '2002-04-30', '2012-06-06', 'Littel, Wisozk and Kovacek', '30631379821426', 'O\'Conner-Abernathy', '57056910247023', 9770.94, 375.11, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(34, '7651993643510613597276097', '92424771', '401', '1995-08-14', '1981-02-11', 'Satterfield-Ratke', '38944400204757', 'Fay-Russel', '30216554486247', 4474.26, 846.88, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(35, '6198257946103727137039136', '94580335', '532', '1979-08-24', '1997-04-10', 'Denesik PLC', '70260554525462', 'Bayer, Emard and O\'Conner', '19026682397619', 3719.57, 375.64, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(36, '4137339275205487194598473', '53723207', '650', '2022-10-30', '1986-08-01', 'Konopelski-Mueller', '96256871059296', 'Hoppe, Schimmel and Keeling', '24607627789372', 1595.65, 61.94, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(37, '9626057358831458676915062', '49021578', '751', '1999-12-16', '1981-01-03', 'Gutmann Inc', '11083868220669', 'Friesen-Marvin', '67401354963492', 9353.49, 621.98, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(38, '5586088063147150623211810', '95701158', '760', '1995-04-26', '1991-01-04', 'Yost-Batz', '59861489100021', 'Boyer LLC', '45220298230889', 9419.01, 829.94, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(39, '6686325806536637329449151', '86394972', '365', '1995-09-19', '1973-03-31', 'Mayert, Orn and Schinner', '26075148933619', 'Von-Zieme', '34130902060054', 9371.76, 94.40, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(40, '5480610591068706855905572', '9127367', '690', '2002-05-11', '1972-07-15', 'Swift PLC', '61249963783647', 'Bradtke, Jenkins and Purdy', '56937387721714', 280.61, 694.41, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(41, '4384562829007087870118253', '90824976', '19', '1976-07-18', '1980-09-10', 'DuBuque Group', '96295302627245', 'Bradtke, Macejkovic and Farrell', '55905191724717', 3959.52, 371.01, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(42, '8290143783790458531442557', '20149897', '266', '1994-05-21', '2001-10-25', 'Schultz Ltd', '81201322692122', 'Beahan-Thompson', '76145428322492', 3797.21, 774.39, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(43, '7564055681751392319989444', '35257316', '977', '1999-09-17', '2012-10-11', 'Quigley, Hill and Beahan', '22315932144893', 'Goldner, Kunde and Aufderhar', '31667989599804', 6751.34, 849.57, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(44, '5446318618528459863545449', '53679300', '119', '1975-01-03', '1973-04-18', 'Bahringer Ltd', '09495879617831', 'Ratke, Stehr and Barrows', '45889742538771', 8954.94, 804.75, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(45, '3704075941110570809302919', '24511246', '883', '1979-05-19', '2010-07-03', 'Homenick-Klein', '56989341631894', 'Ullrich-Kiehn', '15443157244246', 170.00, 491.34, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(46, '4400206584761353204502895', '26126693', '897', '2002-02-23', '2002-02-12', 'Toy PLC', '53081962050793', 'Bins-Gleason', '85163570256961', 5362.17, 376.61, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(47, '5628822022667344529874160', '35444181', '407', '2004-07-03', '2007-02-27', 'Pagac, Dach and Hauck', '04109120031110', 'Pollich-Kirlin', '97774025140005', 9215.58, 705.71, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(48, '0533294207760898839501805', '77690176', '863', '1990-05-06', '2013-10-16', 'Zieme, Hermiston and Legros', '17048925448196', 'Erdman-Bradtke', '65575120060652', 8155.40, 909.40, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(49, '0326278652513672933919639', '60176107', '136', '2004-08-19', '2000-06-10', 'Hettinger and Sons', '20853013048527', 'Douglas, Sawayn and Bednar', '29984801967608', 965.18, 687.69, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(50, '1480539965772363519147026', '12390676', '901', '1989-10-27', '2004-11-27', 'Reichert-Mann', '45357602668117', 'McClure, Blanda and Schultz', '82693368014822', 6883.62, 259.78, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(51, '4875815153633285996306667', '2675803', '611', '1982-09-28', '2010-07-21', 'Schuster and Sons', '61870117164261', 'Kshlerin-Douglas', '75317725114629', 2530.55, 327.89, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(52, '1003821310920832114644812', '40808467', '965', '1976-10-31', '2024-07-03', 'Kiehn-Gutkowski', '90744093714710', 'Jenkins-Schulist', '41174118814934', 5085.77, 328.36, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(53, '2791741015907537627753607', '20754023', '194', '1972-12-06', '2010-08-12', 'Graham, Harber and Walsh', '34032154531172', 'Kessler, Hagenes and Farrell', '81572702945845', 8680.26, 628.25, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(54, '8604700652304981126905470', '79834579', '812', '2013-01-20', '1985-02-11', 'Flatley, Harris and Wiegand', '37708040422193', 'Kohler, Howe and Braun', '95255370240517', 9245.65, 993.11, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(55, '2599641975872735213933576', '99503173', '590', '1995-03-18', '1993-12-27', 'Waters, Kunde and Torphy', '76029974876377', 'White and Sons', '94117345061126', 6945.26, 573.86, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(56, '4039461938753874052050214', '35577948', '998', '2023-05-06', '2010-08-01', 'Bosco-Tillman', '09091835417715', 'Stehr-Quigley', '81640287985626', 1525.07, 217.28, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(57, '4039642976196192688337345', '11715006', '271', '1995-07-29', '1973-09-09', 'Wunsch LLC', '67936863901057', 'Raynor, Paucek and Marks', '28039248062526', 3600.60, 611.65, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(58, '5334596680631338705319499', '25724117', '734', '1993-12-31', '2000-02-15', 'Wuckert, Abshire and Schamberger', '73911627326278', 'Abernathy Inc', '23745105319674', 3515.89, 804.16, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(59, '5710218043595091904031394', '86859126', '669', '2016-03-28', '1975-04-01', 'O\'Kon, Hilpert and Beatty', '35892947373183', 'Hirthe PLC', '72881347143004', 8182.89, 263.72, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(60, '8905870883150369149071681', '63549477', '962', '2003-03-03', '2015-11-18', 'Spinka, Hegmann and Schulist', '89134718864504', 'Carroll, Schamberger and Emard', '89252081511952', 8012.99, 928.12, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfe_impostos`
--

CREATE TABLE `nfe_impostos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nfe_item_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_imposto` varchar(255) NOT NULL,
  `valor_base_calculo` decimal(10,2) DEFAULT NULL,
  `valor_imposto` decimal(10,2) DEFAULT NULL,
  `aliquota` decimal(5,2) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfe_items`
--

CREATE TABLE `nfe_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nfe_entrada_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `codigo_produto` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ncm` varchar(255) NOT NULL,
  `cst` varchar(255) NOT NULL,
  `cfop` varchar(255) NOT NULL,
  `unidade` varchar(255) NOT NULL,
  `quantidade` decimal(10,4) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `nfe_items`
--

INSERT INTO `nfe_items` (`id`, `nfe_entrada_id`, `product_id`, `codigo_produto`, `descricao`, `ncm`, `cst`, `cfop`, `unidade`, `quantidade`, `valor_unitario`, `valor_total`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 55, '725404', 'Enim nihil veritatis qui quia.', '02339656', '134', '8425', 'un', 924.1700, 643.54, 916.00, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(2, 1, 55, '179716', 'Qui sit sapiente modi eos.', '50709966', '521', '7863', 'kg', 147.0900, 411.80, 3856.93, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(3, 1, 55, '864431', 'Magnam et quia natus voluptas.', '96458056', '138', '4448', 'kg', 246.1300, 288.45, 4879.48, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(4, 1, 55, '650563', 'Aut et laborum mollitia magnam totam ducimus.', '93131170', '599', '9239', 'un', 367.1900, 941.00, 6009.51, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(5, 1, 55, '096107', 'Natus repellat quia quae quas et aperiam et.', '08905406', '354', '1703', 'un', 707.7300, 976.13, 9606.63, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(6, 2, 55, '610339', 'Explicabo occaecati ut aliquam facilis qui et.', '55471942', '623', '4109', 'kg', 679.9100, 540.35, 724.98, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(7, 2, 55, '362036', 'Sit aut eveniet ratione reiciendis corporis.', '81700145', '909', '1477', 'un', 26.3300, 174.17, 4163.31, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(8, 2, 55, '377874', 'Nihil molestias non veritatis nam.', '96709787', '993', '7339', 'un', 436.8800, 760.10, 3787.32, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(9, 2, 55, '489577', 'Et aspernatur repellendus veniam accusamus sunt eos totam.', '00254979', '627', '5746', 'm', 858.7400, 831.50, 9667.39, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(10, 2, 55, '546187', 'Minima temporibus voluptatum aliquam enim.', '76559181', '194', '8592', 'kg', 284.2000, 38.76, 5950.31, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(11, 3, 55, '634137', 'Debitis veritatis qui beatae dolorem libero illo.', '32033995', '105', '6427', 'm', 694.8600, 177.49, 7548.28, NULL, 0, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22'),
(12, 3, 55, '708818', 'Sunt quia eum aut a eligendi dolor quos.', '46832203', '829', '7043', 'm', 936.8300, 65.10, 8908.34, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(13, 3, 55, '745178', 'Rerum sed incidunt nostrum cumque cupiditate exercitationem rerum.', '58347779', '685', '3330', 'kg', 838.3900, 182.11, 9986.38, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(14, 3, 55, '722415', 'Non voluptatem ut sit et.', '47339214', '998', '4298', 'un', 766.1200, 496.21, 9593.94, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(15, 3, 55, '669338', 'Culpa ea voluptatibus sed minus labore.', '69330318', '359', '5816', 'kg', 240.5100, 499.24, 4541.69, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(16, 4, 55, '103201', 'Dolores commodi nihil ducimus.', '90707537', '492', '2011', 'un', 201.8100, 344.99, 7320.10, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(17, 4, 55, '089127', 'Perferendis officia culpa sunt dolorum itaque id temporibus.', '33185854', '261', '9885', 'm', 650.1900, 246.93, 8900.56, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(18, 4, 55, '246183', 'Rerum consequatur tenetur sequi velit.', '52905962', '888', '0202', 'kg', 763.4100, 434.24, 5549.08, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(19, 4, 55, '894990', 'Molestias dolore omnis mollitia voluptatem ut.', '78333916', '652', '0426', 'm', 47.9200, 218.42, 523.65, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(20, 4, 55, '559263', 'Porro iusto quis cumque qui.', '04770050', '573', '1054', 'kg', 13.1100, 921.38, 1279.75, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(21, 5, 55, '412697', 'Sit dolores ex quos sit placeat perferendis ut.', '47593060', '505', '1542', 'm', 660.2100, 841.56, 5371.07, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(22, 5, 55, '897058', 'Quod unde et voluptatem mollitia eius consequatur.', '50290816', '377', '8469', 'm', 132.9600, 139.02, 1125.40, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(23, 5, 55, '631091', 'Nam reprehenderit qui inventore ea iure est officia.', '14705418', '537', '0885', 'kg', 85.8400, 69.19, 9245.74, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(24, 5, 55, '676661', 'Velit amet et voluptatem cupiditate nisi iste voluptatem ducimus.', '30178932', '998', '3201', 'kg', 786.6100, 990.01, 6851.04, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(25, 5, 55, '751298', 'Et vel vel error nemo occaecati enim culpa placeat.', '57385777', '196', '7142', 'un', 591.8900, 310.49, 7370.22, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(26, 6, 55, '577420', 'Nisi aut distinctio deserunt nemo adipisci.', '25269438', '743', '6579', 'un', 531.0600, 535.35, 6343.70, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(27, 6, 55, '136145', 'Iure animi aut eius deleniti.', '84891128', '372', '8026', 'kg', 953.6400, 262.00, 3481.30, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(28, 6, 55, '810963', 'Neque rerum sit velit aliquid aut.', '91004225', '772', '3170', 'm', 874.8900, 442.96, 1176.80, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(29, 6, 55, '675192', 'Consequuntur et repellat similique.', '60648136', '022', '1013', 'un', 186.0500, 918.17, 8520.92, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(30, 6, 55, '966194', 'Aut aut facere at incidunt.', '56529713', '830', '5063', 'un', 55.7300, 635.95, 9823.93, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(31, 7, 55, '435991', 'Aperiam nihil autem est et assumenda est.', '26645219', '014', '7138', 'm', 852.1500, 272.96, 3117.07, NULL, 0, NULL, '2024-07-27 19:18:23', '2024-07-27 19:18:23'),
(32, 7, 55, '170206', 'Molestiae consequuntur ut vel saepe.', '74629855', '869', '7416', 'm', 907.2500, 189.05, 7814.91, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(33, 7, 55, '296990', 'Deleniti delectus dolorem non illo.', '44040321', '505', '4045', 'un', 614.6800, 415.00, 2219.64, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(34, 7, 55, '054771', 'Sunt eaque molestiae sunt aut quasi.', '81216366', '359', '6166', 'un', 977.7800, 87.53, 2989.84, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(35, 7, 55, '740676', 'Placeat voluptatem soluta ea est omnis et.', '35345724', '271', '1691', 'm', 189.2300, 8.33, 454.74, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(36, 8, 55, '929697', 'Est qui facilis aliquam nulla asperiores quaerat magni provident.', '75729048', '967', '6489', 'un', 125.6700, 762.13, 3650.62, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(37, 8, 55, '595346', 'Voluptatem quia qui ipsum sit consectetur vitae amet.', '65581266', '782', '4566', 'm', 163.9100, 167.10, 313.29, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(38, 8, 55, '694280', 'Quo voluptates ut ut dolores adipisci in voluptas.', '54626683', '457', '3165', 'un', 125.1900, 493.26, 4646.61, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(39, 8, 55, '856643', 'Libero architecto possimus dolorem qui modi quisquam.', '84020110', '523', '7182', 'un', 119.6700, 672.06, 5652.14, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(40, 8, 55, '816669', 'Exercitationem ea rerum sequi iure quas molestiae.', '82708681', '509', '7922', 'm', 840.5400, 465.04, 5867.44, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(41, 9, 55, '668449', 'Omnis explicabo est quaerat.', '51615149', '676', '9809', 'm', 258.1200, 24.15, 8654.48, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(42, 9, 55, '761584', 'Aperiam et quia at odio id sint nihil.', '76292374', '368', '7844', 'un', 471.8000, 752.59, 1419.43, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(43, 9, 55, '594370', 'Nam deserunt sed sed aut nostrum temporibus amet.', '44320303', '580', '1296', 'm', 405.0900, 542.14, 3435.13, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(44, 9, 55, '499892', 'Occaecati eligendi cupiditate quis nemo qui maiores molestiae sed.', '73893598', '602', '2513', 'kg', 504.5300, 639.06, 6351.21, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(45, 9, 55, '889940', 'Quod optio voluptas magnam officiis sed atque.', '04049119', '624', '9950', 'm', 564.9600, 553.37, 6472.13, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(46, 10, 55, '714335', 'Dolore est rerum aut veniam.', '11218435', '261', '6034', 'un', 548.2500, 165.39, 4698.38, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(47, 10, 55, '637878', 'Autem qui ut et itaque in ea explicabo.', '05735908', '366', '8858', 'un', 316.7600, 428.02, 421.50, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(48, 10, 55, '429082', 'Recusandae repellat molestiae nihil omnis sapiente.', '74736571', '675', '5815', 'kg', 711.1900, 635.79, 7747.83, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(49, 10, 55, '100526', 'Illo pariatur occaecati impedit odio.', '86144052', '710', '8624', 'm', 875.7700, 113.90, 7936.75, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(50, 10, 55, '958920', 'Veniam voluptatem minus rem cupiditate.', '56177544', '778', '8596', 'kg', 562.9600, 6.74, 6790.98, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(51, 11, 55, '835006', 'Perferendis quibusdam reiciendis modi possimus aut.', '81631718', '798', '1294', 'un', 892.9000, 295.34, 9531.47, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(52, 11, 55, '521295', 'Molestiae similique nulla voluptatibus est omnis consectetur quam labore.', '98455840', '769', '9777', 'm', 470.1900, 266.13, 8671.64, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(53, 11, 55, '723051', 'Culpa error recusandae ex odit iste vero tenetur.', '15229563', '486', '5046', 'm', 647.5500, 444.98, 3752.20, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(54, 11, 55, '471031', 'Dolores aut ipsa qui dolores eos ducimus.', '97445529', '776', '3438', 'm', 159.0200, 52.65, 8332.92, NULL, 0, NULL, '2024-07-27 19:18:24', '2024-07-27 19:18:24'),
(55, 11, 55, '587661', 'Mollitia mollitia cupiditate consectetur fugiat.', '95705786', '652', '6452', 'un', 144.9500, 789.58, 2566.71, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(56, 12, 55, '871316', 'Asperiores excepturi est eos ullam deleniti.', '03015925', '448', '9078', 'm', 146.8100, 554.19, 2416.79, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(57, 12, 55, '976609', 'Iure fugiat molestiae dolorum omnis dolorem.', '26960537', '371', '0377', 'kg', 857.4300, 401.77, 891.68, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(58, 12, 55, '780742', 'Occaecati consequatur qui sed ipsam omnis.', '79566422', '010', '2551', 'm', 13.6700, 425.77, 9178.92, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(59, 12, 55, '619140', 'Rem recusandae ratione molestiae aut magni amet error tempore.', '08119566', '425', '3275', 'm', 10.3300, 763.93, 6037.83, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(60, 12, 55, '789168', 'Omnis natus ut id ducimus.', '82296634', '535', '3277', 'm', 424.2700, 376.25, 8652.79, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(61, 13, 55, '766328', 'Odit excepturi perspiciatis tempore autem dicta.', '18352710', '682', '3184', 'm', 727.9200, 649.01, 9097.36, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(62, 13, 55, '357554', 'Voluptatum odit magni nisi laudantium.', '27243442', '596', '9735', 'kg', 681.0200, 216.17, 866.31, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(63, 13, 55, '737516', 'Amet expedita illo dolorem.', '05427575', '011', '4705', 'un', 253.3700, 226.62, 5796.59, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(64, 13, 55, '296180', 'Sunt accusamus aut quae voluptatem vero.', '88871093', '620', '1558', 'm', 928.2600, 187.64, 3605.49, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(65, 13, 55, '388972', 'Quod omnis deleniti in amet nobis.', '85383817', '865', '0872', 'm', 33.7300, 649.15, 9495.72, NULL, 0, NULL, '2024-07-27 19:18:25', '2024-07-27 19:18:25'),
(66, 14, 55, '147979', 'Nemo tempora fugit voluptatem nostrum dolore expedita dicta.', '74453509', '881', '0713', 'm', 954.6700, 219.27, 1104.09, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(67, 14, 55, '201822', 'Odio a recusandae ut aut.', '41319791', '354', '2728', 'un', 177.1900, 3.25, 4834.89, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(68, 14, 55, '986726', 'Corporis aut atque reiciendis voluptatem molestiae.', '96277493', '046', '3984', 'un', 692.7200, 708.13, 2939.43, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(69, 14, 55, '832500', 'Perspiciatis consequuntur dignissimos temporibus repellat voluptatem.', '00355856', '676', '4390', 'm', 743.5300, 224.30, 3721.23, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(70, 14, 55, '979275', 'Suscipit qui eveniet similique aperiam omnis saepe.', '94206655', '253', '5502', 'm', 757.7300, 895.98, 8685.93, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(71, 15, 55, '539557', 'Id voluptate ut quod laudantium.', '64316946', '602', '8034', 'kg', 396.0700, 84.13, 4874.81, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(72, 15, 55, '994752', 'Voluptas corrupti suscipit accusantium eum ea dicta sit ut.', '90527369', '689', '0160', 'un', 232.5500, 221.09, 9944.46, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(73, 15, 55, '924797', 'Voluptatem placeat eveniet error sed quo ut nihil.', '67917741', '175', '7062', 'un', 66.3700, 439.02, 6219.61, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(74, 15, 55, '712059', 'Consectetur ea iste facilis quasi non eveniet similique accusantium.', '10183229', '773', '1936', 'un', 630.0300, 503.07, 1040.68, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(75, 15, 55, '203071', 'Quia excepturi beatae quo voluptatibus amet consequuntur.', '82468103', '648', '7561', 'm', 143.5200, 706.14, 1145.86, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(76, 16, 55, '485784', 'Nulla sunt quidem laudantium sunt.', '11064227', '438', '6886', 'un', 635.9900, 988.73, 9079.62, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(77, 16, 55, '946517', 'Voluptas quaerat ea omnis asperiores vel quam.', '64123980', '473', '4954', 'kg', 655.1200, 9.14, 8930.68, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(78, 16, 55, '547298', 'Veritatis aut sed doloribus consequuntur est.', '05106039', '891', '7196', 'm', 845.9400, 654.56, 5874.74, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(79, 16, 55, '011098', 'Omnis tempora laborum placeat sint.', '84921398', '067', '5759', 'un', 743.3300, 924.33, 7674.56, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(80, 16, 55, '023436', 'Ex quo sit et est molestiae officia.', '47478389', '649', '7315', 'un', 63.0500, 926.86, 6483.47, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(81, 17, 55, '723141', 'Numquam aut quis voluptatem est et similique.', '07125251', '555', '9504', 'm', 767.9500, 301.63, 9883.78, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(82, 17, 55, '212525', 'Autem quas quisquam et voluptatem quos magni asperiores.', '55136258', '825', '4693', 'm', 158.0600, 556.86, 8126.32, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(83, 17, 55, '667739', 'Est aut dolorum sed rerum reprehenderit.', '38718186', '978', '9852', 'un', 665.4500, 270.69, 4837.19, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(84, 17, 55, '808562', 'Quasi et dolores quos rerum.', '48515222', '785', '6462', 'kg', 260.6600, 917.17, 7140.29, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(85, 17, 55, '288672', 'Consectetur qui quia est fugiat facere.', '68984928', '347', '5115', 'm', 952.5400, 75.33, 1917.07, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(86, 18, 55, '852256', 'Et non perspiciatis totam harum assumenda velit rerum dolorum.', '21122114', '207', '9113', 'm', 514.4400, 528.75, 7590.92, NULL, 0, NULL, '2024-07-27 19:18:26', '2024-07-27 19:18:26'),
(87, 18, 55, '305682', 'Vitae amet voluptatem ut animi recusandae sed a.', '87210523', '063', '1267', 'm', 633.8000, 843.56, 2824.26, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(88, 18, 55, '725007', 'Laborum recusandae facilis exercitationem suscipit recusandae quasi sequi.', '63166983', '571', '1693', 'un', 555.4600, 967.82, 1745.73, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(89, 18, 55, '421469', 'Ab distinctio in ullam voluptate.', '78361821', '800', '5784', 'kg', 396.4100, 768.12, 8620.68, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(90, 18, 55, '953117', 'Dicta quo ut ipsum.', '61601458', '428', '4284', 'kg', 695.9300, 727.10, 8167.39, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(91, 19, 55, '065704', 'Soluta et eaque delectus ea sit.', '09017478', '315', '9483', 'kg', 611.6700, 39.90, 5205.43, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(92, 19, 55, '450322', 'Ut voluptatem sunt sunt commodi blanditiis soluta.', '96061466', '201', '4298', 'kg', 781.5500, 952.07, 4245.19, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(93, 19, 55, '017542', 'Mollitia et ut quo.', '11025432', '511', '9780', 'm', 11.0000, 279.53, 7732.01, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(94, 19, 55, '310559', 'Sunt ea libero illo a cum.', '05156359', '292', '5923', 'kg', 772.0000, 640.25, 4369.91, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(95, 19, 55, '716661', 'Et consequuntur eum libero similique.', '44793990', '428', '0090', 'm', 248.1200, 615.86, 6827.38, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(96, 20, 55, '082435', 'Doloremque deleniti quidem quod iure.', '01366204', '810', '6680', 'm', 794.3000, 553.90, 596.16, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(97, 20, 55, '586157', 'Ut voluptatibus quis minima est beatae est.', '54526327', '948', '0021', 'un', 192.0100, 155.04, 8908.74, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(98, 20, 55, '682538', 'Et ut voluptatibus molestiae.', '51011177', '373', '9464', 'm', 291.1700, 452.00, 3819.57, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(99, 20, 55, '273992', 'Hic autem beatae quasi quia omnis.', '11954251', '172', '0025', 'kg', 887.8100, 942.35, 4534.54, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(100, 20, 55, '386773', 'Enim saepe et molestiae nostrum totam.', '67081903', '742', '0789', 'kg', 258.0000, 42.83, 118.88, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(101, 21, 55, '212688', 'Corporis non nam quia quis.', '52729028', '129', '3995', 'm', 318.9000, 347.79, 2647.78, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(102, 21, 55, '721827', 'Dolores quo corporis non quam et ex.', '86953230', '849', '5425', 'm', 12.1500, 290.86, 2407.60, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(103, 21, 55, '432730', 'Et voluptas facilis sed voluptatibus commodi nobis ut.', '62736806', '793', '4852', 'm', 838.4500, 75.28, 9929.33, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(104, 21, 55, '457997', 'Perferendis et dolor sed veritatis sint porro ea.', '13706468', '546', '9112', 'm', 61.0900, 463.62, 129.20, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(105, 21, 55, '700441', 'Odit quo quia in in nihil velit consequatur.', '43652717', '474', '7817', 'un', 994.8700, 80.24, 5513.87, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(106, 22, 55, '523159', 'Voluptatibus quia est molestiae illum sit soluta.', '03584074', '299', '8187', 'kg', 970.8700, 245.84, 7772.36, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(107, 22, 55, '453749', 'Eligendi quasi deserunt nulla delectus et sunt.', '87054758', '426', '6612', 'un', 525.0000, 474.81, 6982.89, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(108, 22, 55, '488388', 'Itaque labore distinctio officiis tenetur.', '51766149', '764', '0588', 'kg', 649.2800, 251.47, 1621.69, NULL, 0, NULL, '2024-07-27 19:18:27', '2024-07-27 19:18:27'),
(109, 22, 55, '338429', 'Dolorem ducimus beatae necessitatibus dolorum sint ut quisquam.', '50807110', '077', '4677', 'm', 655.1400, 705.23, 1563.29, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(110, 22, 55, '189056', 'Sed voluptatem placeat officia explicabo molestias neque quia.', '00803542', '000', '8295', 'kg', 205.0600, 388.85, 5007.95, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(111, 23, 55, '860430', 'Aut voluptatibus quia dignissimos commodi sunt quia et.', '89041777', '058', '5752', 'm', 289.7300, 173.96, 6920.97, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(112, 23, 55, '153005', 'Voluptatum et nostrum sit doloribus sunt.', '10839105', '937', '9191', 'm', 333.4000, 16.57, 7970.57, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(113, 23, 55, '852990', 'Et esse quibusdam ea dolores saepe.', '11310719', '843', '5796', 'm', 904.5600, 335.54, 2806.63, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(114, 23, 55, '401003', 'Voluptate eligendi minus iure natus quos dolorum atque.', '63836876', '004', '0151', 'm', 71.6100, 71.43, 7832.00, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(115, 23, 55, '712658', 'Et quasi ipsa perspiciatis qui rerum quo aperiam.', '09911546', '199', '9126', 'm', 575.3300, 560.53, 8450.74, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(116, 24, 55, '030793', 'Harum omnis omnis ut dolorem repudiandae facere.', '95427790', '449', '5952', 'kg', 761.6300, 683.03, 9762.63, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(117, 24, 55, '109391', 'Assumenda eaque ad qui ab quis.', '07519181', '683', '1017', 'm', 365.8900, 222.94, 819.02, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(118, 24, 55, '717032', 'Expedita commodi doloremque nihil unde non.', '13516393', '004', '7762', 'm', 224.1600, 293.02, 1934.90, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(119, 24, 55, '213059', 'Ex at inventore quo recusandae.', '75947403', '551', '8476', 'un', 971.3400, 638.46, 4289.41, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(120, 24, 55, '581596', 'Nostrum molestiae iusto maiores placeat rem eligendi nihil.', '99107588', '825', '6909', 'kg', 896.5400, 272.17, 7609.88, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(121, 25, 55, '297764', 'Sed eos quia neque et ab.', '43777227', '199', '1606', 'm', 420.7600, 700.44, 422.77, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(122, 25, 55, '591303', 'Voluptatem veniam corrupti maxime expedita.', '19645846', '408', '7811', 'kg', 827.6600, 469.30, 2803.69, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(123, 25, 55, '142973', 'Voluptatibus eos aut molestiae dolor.', '13404868', '033', '7181', 'm', 490.4000, 576.34, 6095.46, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(124, 25, 55, '125877', 'Occaecati iusto magni earum aut aut explicabo ducimus.', '84864194', '336', '7214', 'm', 133.0400, 294.70, 4760.22, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(125, 25, 55, '407308', 'Deleniti non non neque est.', '88747422', '296', '5492', 'kg', 747.6200, 54.99, 1345.27, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(126, 26, 55, '257601', 'Ut repellendus ut et ea.', '07051736', '305', '1818', 'un', 854.6500, 793.01, 2609.00, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(127, 26, 55, '183404', 'Est inventore maxime recusandae eum.', '10348371', '135', '4495', 'm', 222.8500, 284.45, 8306.47, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(128, 26, 55, '417882', 'Quae ea at eum ut cum qui ad dignissimos.', '61206802', '488', '2551', 'un', 621.1600, 418.98, 9910.57, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(129, 26, 55, '623030', 'Molestiae id voluptate voluptate qui soluta corporis impedit iure.', '54204191', '750', '9769', 'kg', 925.3900, 986.29, 3967.27, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(130, 26, 55, '109760', 'Libero at omnis harum aut est nostrum atque.', '28222168', '772', '6548', 'un', 788.6600, 574.35, 578.31, NULL, 0, NULL, '2024-07-27 19:18:28', '2024-07-27 19:18:28'),
(131, 27, 55, '409236', 'Natus est assumenda vel.', '28139819', '943', '5211', 'm', 168.0900, 349.86, 4926.98, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(132, 27, 55, '938252', 'Dolore voluptates dolorem debitis animi.', '85374150', '335', '5898', 'kg', 601.6400, 865.05, 4633.61, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(133, 27, 55, '966158', 'Voluptatem consequatur eaque ut minima beatae nulla.', '06951204', '600', '2458', 'kg', 654.3800, 484.25, 2924.51, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(134, 27, 55, '046832', 'Quas blanditiis mollitia delectus natus.', '41360515', '503', '2444', 'm', 533.3300, 931.45, 5166.81, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(135, 27, 55, '088473', 'Voluptas eum dolor delectus vero.', '88637358', '744', '6979', 'm', 351.2500, 154.43, 7662.72, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(136, 28, 55, '502412', 'Quasi debitis fugiat laboriosam in itaque ab.', '32716983', '606', '7633', 'm', 326.6100, 498.82, 221.97, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(137, 28, 55, '789815', 'Rerum et non et quidem qui illum.', '11351272', '383', '6839', 'un', 143.8900, 857.31, 8497.75, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(138, 28, 55, '043694', 'Sed vero dolore omnis.', '81672408', '514', '0182', 'm', 982.5700, 657.85, 4744.13, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(139, 28, 55, '511405', 'Accusantium odio rerum sed impedit rerum.', '19696369', '263', '1931', 'un', 558.3600, 537.47, 9605.97, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(140, 28, 55, '916962', 'Eos dolore autem ut rerum qui.', '32349306', '902', '7397', 'kg', 140.5900, 616.05, 8940.03, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(141, 29, 55, '129126', 'Esse aut quaerat sed ducimus iste.', '75317133', '686', '7636', 'kg', 856.6200, 954.36, 320.83, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(142, 29, 55, '180237', 'Temporibus sunt accusamus ullam voluptates nesciunt.', '35113578', '870', '7076', 'm', 515.9500, 212.27, 8714.25, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(143, 29, 55, '417666', 'Dolore veritatis explicabo et aut sunt vitae.', '67235912', '755', '2628', 'kg', 126.2300, 913.05, 6993.72, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(144, 29, 55, '646550', 'Veritatis facilis eaque at adipisci officiis.', '50168200', '274', '9700', 'kg', 596.3600, 199.23, 536.78, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(145, 29, 55, '411373', 'Incidunt tenetur aut adipisci sit omnis accusamus provident.', '94585274', '685', '8783', 'kg', 586.8100, 310.16, 8316.11, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(146, 30, 55, '449979', 'Et reprehenderit reprehenderit rerum asperiores vel rerum.', '63528733', '452', '1745', 'kg', 84.6800, 360.32, 5236.83, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(147, 30, 55, '953001', 'Fuga sed nisi eos.', '37353013', '931', '1573', 'm', 332.9800, 780.39, 292.42, NULL, 0, NULL, '2024-07-27 19:18:29', '2024-07-27 19:18:29'),
(148, 30, 55, '317323', 'Ipsam sint fuga molestias minima aut.', '77267282', '794', '7954', 'm', 898.4200, 192.20, 2990.65, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(149, 30, 55, '244111', 'Officia asperiores tempore quae illo eligendi.', '81791659', '092', '9779', 'un', 50.1300, 383.78, 4249.11, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(150, 30, 55, '511790', 'Magni pariatur consequuntur nam quaerat.', '30691936', '085', '1608', 'un', 412.5500, 883.40, 899.09, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(151, 31, 55, '065954', 'Ea explicabo deleniti et error tempora.', '75210008', '388', '8849', 'm', 997.6500, 170.76, 6634.97, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(152, 31, 55, '896335', 'Quae consequatur tempore voluptatem.', '29859338', '686', '1034', 'un', 817.2300, 629.47, 8717.14, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(153, 31, 55, '001537', 'Pariatur vel exercitationem repellendus iste.', '62107090', '020', '6605', 'm', 170.6000, 566.99, 9065.66, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(154, 31, 55, '065138', 'In exercitationem laudantium blanditiis quos.', '67025588', '454', '1977', 'kg', 135.2900, 952.31, 5818.71, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(155, 31, 55, '169359', 'Quibusdam eligendi illo omnis iusto fuga distinctio vel rem.', '13371158', '148', '5558', 'm', 311.5200, 657.38, 1753.01, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(156, 32, 55, '304959', 'Molestiae omnis magni eum voluptatibus magnam.', '67559403', '179', '3314', 'm', 208.6500, 829.30, 5065.31, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(157, 32, 55, '468247', 'Omnis voluptas aliquid sint non minus ex.', '18300573', '897', '6226', 'm', 300.2600, 807.43, 9624.20, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(158, 32, 55, '459654', 'Esse modi deserunt voluptas similique ea repudiandae itaque.', '07051153', '310', '0723', 'm', 374.8100, 260.27, 7159.14, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(159, 32, 55, '066596', 'Cum aut ipsa fuga voluptatum.', '89823034', '651', '3406', 'm', 770.3800, 843.97, 8344.69, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(160, 32, 55, '917376', 'Asperiores sequi totam voluptates porro.', '83119843', '406', '1597', 'm', 595.2600, 550.94, 7054.47, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(161, 33, 55, '862005', 'Accusamus velit cum minima ut aut quia.', '92095862', '300', '6922', 'un', 954.6300, 855.24, 1408.88, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(162, 33, 55, '453221', 'Quis ad ut adipisci sunt aspernatur.', '92342797', '411', '2209', 'm', 617.0700, 529.30, 2039.30, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(163, 33, 55, '008913', 'Quisquam pariatur rerum deserunt illo.', '61122280', '337', '4445', 'un', 748.5700, 907.31, 1379.95, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(164, 33, 55, '569889', 'Reiciendis voluptatem et voluptatem error et neque.', '05408680', '590', '6132', 'kg', 423.5600, 336.74, 2571.05, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(165, 33, 55, '340560', 'Modi quibusdam quia omnis consequatur et dolor.', '66846085', '255', '1824', 'm', 491.5100, 514.02, 6483.16, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(166, 34, 55, '297777', 'Repellat veniam ipsam et dicta rerum sint voluptatem.', '86286423', '803', '4882', 'un', 757.3700, 81.34, 7911.32, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(167, 34, 55, '952625', 'Dolores nam accusamus quis hic odit nisi maxime.', '30338866', '620', '7461', 'm', 845.9500, 649.00, 4485.45, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(168, 34, 55, '099526', 'Eum id reprehenderit voluptatem.', '69253877', '983', '8733', 'kg', 234.8100, 243.86, 2425.48, NULL, 0, NULL, '2024-07-27 19:18:30', '2024-07-27 19:18:30'),
(169, 34, 55, '665147', 'Beatae velit aliquid sint.', '02124882', '112', '0700', 'm', 382.8300, 755.99, 1390.92, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(170, 34, 55, '300004', 'Dolor aut temporibus corporis ut.', '32370408', '793', '2600', 'm', 435.7900, 486.87, 4580.51, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(171, 35, 55, '939251', 'Sit commodi aut ipsam est distinctio modi nemo.', '53910677', '258', '9358', 'un', 777.7200, 131.18, 6227.51, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(172, 35, 55, '432323', 'Laboriosam fuga sit temporibus.', '15111369', '168', '7201', 'm', 756.4000, 128.67, 5441.84, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(173, 35, 55, '340289', 'Enim ut placeat dicta alias nihil recusandae tempora.', '65731592', '147', '6680', 'm', 109.6400, 352.83, 3095.93, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(174, 35, 55, '112761', 'Earum atque sit dolor ut ut in.', '14606025', '328', '9807', 'un', 424.3800, 389.50, 3318.75, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(175, 35, 55, '987377', 'Non explicabo corporis non soluta omnis dolores ab.', '29296849', '140', '6177', 'kg', 233.8300, 722.05, 4258.00, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(176, 36, 55, '604677', 'Ex aperiam quo quaerat ut adipisci aliquam earum officiis.', '55671359', '721', '5639', 'm', 716.3200, 371.81, 9719.93, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(177, 36, 55, '970626', 'Ut ipsam commodi quis nemo.', '65209635', '752', '3077', 'un', 511.3100, 154.88, 9288.30, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(178, 36, 55, '267383', 'Vero qui earum rerum perspiciatis voluptatum esse dicta.', '81185893', '070', '8043', 'm', 936.3600, 811.50, 8644.79, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(179, 36, 55, '164577', 'Quaerat ex a quia quaerat omnis.', '51399141', '386', '4885', 'un', 77.4800, 632.96, 5137.92, NULL, 0, NULL, '2024-07-27 19:18:31', '2024-07-27 19:18:31'),
(180, 36, 55, '787044', 'Et nobis cum et rem et.', '97863787', '498', '1908', 'kg', 941.6900, 473.06, 9244.82, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(181, 37, 55, '269974', 'Dolorum hic ea impedit consequuntur ipsam est.', '11168512', '697', '9454', 'kg', 868.2600, 871.85, 4417.30, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(182, 37, 55, '058491', 'Sed non ex consequatur delectus quam ut.', '07297352', '834', '2279', 'kg', 973.5900, 921.07, 9560.61, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(183, 37, 55, '419170', 'Necessitatibus error dolorum quod rerum.', '05703054', '985', '9750', 'kg', 726.8600, 721.20, 9340.26, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(184, 37, 55, '041864', 'Voluptatem laboriosam voluptatum nobis magnam porro.', '76623844', '700', '7437', 'un', 237.5300, 117.47, 1984.82, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(185, 37, 55, '501513', 'Beatae accusamus ullam iste consequatur et.', '16579691', '777', '0741', 'm', 918.1900, 956.05, 1819.75, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(186, 38, 55, '477329', 'Neque expedita et totam sed sit eveniet animi atque.', '35217630', '670', '3635', 'kg', 882.7300, 216.30, 2275.05, NULL, 0, NULL, '2024-07-27 19:18:32', '2024-07-27 19:18:32'),
(187, 38, 55, '263457', 'Ut maiores voluptatem natus ab incidunt.', '46698384', '600', '4608', 'un', 594.9500, 279.43, 9073.16, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(188, 38, 55, '442767', 'Voluptas ipsa aut similique dicta debitis.', '07640412', '870', '4646', 'm', 953.0600, 484.12, 1344.19, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(189, 38, 55, '809449', 'Alias ipsam qui est vitae est.', '69115957', '908', '9823', 'un', 970.2200, 897.68, 292.02, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(190, 38, 55, '169782', 'Itaque architecto quae a voluptates tempore ducimus.', '40373892', '701', '1803', 'un', 15.0200, 924.71, 9087.05, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(191, 39, 55, '342375', 'Inventore aut placeat et.', '86750540', '153', '5902', 'un', 304.7500, 242.93, 7470.59, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(192, 39, 55, '409221', 'Quas consequatur aut fugit vitae atque impedit qui.', '85411941', '234', '2653', 'un', 474.7000, 177.07, 1278.57, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(193, 39, 55, '244559', 'Nesciunt molestias qui magnam autem autem aut facere.', '19018030', '236', '7773', 'kg', 934.1900, 613.78, 1504.88, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(194, 39, 55, '743693', 'Quia quia maiores aspernatur velit ab dignissimos.', '69492746', '106', '6313', 'm', 479.0100, 440.12, 6364.98, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(195, 39, 55, '841259', 'Dolores dolorem voluptatum quam mollitia reiciendis.', '00550187', '416', '2420', 'm', 198.3600, 413.94, 8376.60, NULL, 0, NULL, '2024-07-27 19:18:33', '2024-07-27 19:18:33'),
(196, 40, 55, '027388', 'Recusandae est ut deleniti omnis est iure dicta excepturi.', '37224563', '557', '8848', 'un', 513.7100, 540.89, 8905.18, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(197, 40, 55, '627886', 'Quis dolore rem saepe sunt.', '27168148', '742', '6314', 'm', 336.8100, 397.77, 8933.60, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(198, 40, 55, '203261', 'Necessitatibus vel dicta tempora qui veniam maxime quo.', '34059078', '060', '3695', 'un', 274.6600, 433.09, 1476.47, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(199, 40, 55, '121254', 'Nulla velit excepturi impedit sapiente sunt dolorem quam et.', '49828998', '727', '5305', 'm', 499.9500, 272.51, 6786.58, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(200, 40, 55, '965819', 'Eius delectus voluptatem quia fugiat.', '09242830', '390', '1684', 'kg', 800.0300, 232.71, 4452.61, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(201, 41, 55, '728051', 'Non quaerat autem eius laborum quas repellendus et iure.', '78571257', '678', '4974', 'kg', 917.4600, 78.39, 4288.88, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(202, 41, 55, '576760', 'Consequatur dolorum repudiandae illo fuga in soluta dicta.', '67724977', '992', '9349', 'kg', 845.2900, 197.02, 5285.38, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(203, 41, 55, '529284', 'Voluptatibus accusantium perferendis officia aliquid eveniet numquam delectus.', '59321998', '293', '6980', 'm', 614.4300, 422.00, 9084.63, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(204, 41, 55, '305079', 'Nisi delectus reiciendis et provident et consequatur veniam.', '37243279', '324', '5271', 'un', 368.2300, 446.46, 133.12, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(205, 41, 55, '872222', 'Voluptas occaecati soluta qui sed voluptatem qui.', '08893885', '383', '5277', 'm', 556.1200, 220.26, 9035.12, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(206, 42, 55, '560315', 'Qui quia dolore amet nihil dolores reiciendis.', '07389243', '248', '8004', 'kg', 516.8000, 581.03, 1598.96, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(207, 42, 55, '459981', 'Delectus quo enim quam qui maxime quos corrupti.', '48907665', '315', '4543', 'm', 38.1200, 833.82, 2924.56, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(208, 42, 55, '013574', 'Omnis molestiae qui ut veniam architecto libero et.', '70778559', '276', '9161', 'un', 178.9700, 15.41, 8906.93, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(209, 42, 55, '945576', 'Nesciunt quod id non aut.', '73888332', '415', '4673', 'kg', 736.0700, 135.93, 8270.63, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(210, 42, 55, '632855', 'Tenetur sed quas ut animi totam quia.', '50201087', '414', '9633', 'kg', 319.3600, 754.51, 8421.86, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(211, 43, 55, '014531', 'Voluptatum in sit odit omnis odio occaecati.', '02816289', '105', '0943', 'kg', 443.7300, 429.92, 5827.86, NULL, 0, NULL, '2024-07-27 19:18:34', '2024-07-27 19:18:34'),
(212, 43, 55, '536210', 'Eveniet hic dolor tempore.', '47786408', '014', '8286', 'm', 491.4100, 44.86, 8621.48, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(213, 43, 55, '185671', 'Non eos nam et amet.', '51538675', '347', '6758', 'kg', 717.0700, 941.16, 4837.49, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(214, 43, 55, '055030', 'Non voluptates dolor ipsa tenetur.', '88361515', '182', '1116', 'un', 896.2300, 869.32, 3247.40, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(215, 43, 55, '822972', 'Rerum quis maxime ipsam exercitationem voluptatem possimus non voluptas.', '78206053', '711', '9702', 'kg', 690.8100, 409.92, 3051.79, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(216, 44, 55, '710839', 'Nisi dignissimos aspernatur ea repellendus.', '88130274', '980', '0286', 'm', 793.2400, 131.02, 7743.32, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(217, 44, 55, '677080', 'Sit minus ab tenetur aut velit maiores praesentium necessitatibus.', '46443394', '667', '0921', 'm', 388.3100, 57.59, 4060.86, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(218, 44, 55, '126125', 'Quisquam aut quis maiores ducimus voluptatem est.', '26205707', '752', '5276', 'kg', 658.7200, 861.30, 5270.79, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(219, 44, 55, '806498', 'Incidunt sint numquam enim eius natus.', '48465063', '922', '3413', 'm', 40.8700, 610.89, 3836.65, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(220, 44, 55, '906301', 'Ducimus deserunt voluptatum rem aut inventore.', '12704361', '744', '1495', 'kg', 353.2400, 759.54, 8392.64, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(221, 45, 55, '129368', 'Iusto veniam aut reprehenderit veniam.', '22655380', '619', '2432', 'm', 149.6700, 111.49, 5741.33, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(222, 45, 55, '708970', 'Similique omnis dolores quo veniam perspiciatis.', '46930677', '661', '5831', 'kg', 957.6400, 989.07, 3019.20, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(223, 45, 55, '099920', 'Et eum fuga architecto maxime sunt nisi.', '14721885', '581', '2979', 'un', 378.8600, 4.85, 1338.38, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(224, 45, 55, '559484', 'Quia aperiam similique voluptates impedit temporibus.', '67441652', '635', '9291', 'un', 112.9600, 686.24, 2150.44, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(225, 45, 55, '910328', 'Dolor delectus rerum eaque consequatur.', '44836520', '299', '8807', 'm', 906.3000, 330.31, 9264.76, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(226, 46, 55, '411369', 'Nesciunt itaque est quo deserunt vel suscipit quia.', '47298979', '226', '5062', 'kg', 352.8400, 756.19, 4575.08, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(227, 46, 55, '893757', 'Quidem repellat rerum eius quia.', '42970593', '403', '5923', 'm', 351.6400, 321.28, 8130.37, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(228, 46, 55, '500339', 'Accusantium ratione officia dolores consequuntur reprehenderit quia minus.', '76787696', '939', '2021', 'kg', 390.2600, 13.71, 9730.22, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(229, 46, 55, '097338', 'Iste quae iste quia.', '18662759', '123', '8881', 'un', 735.1500, 191.39, 2837.57, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(230, 46, 55, '177438', 'Earum aut sequi sunt officiis.', '39287037', '629', '7584', 'kg', 863.5200, 691.87, 8371.15, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(231, 47, 55, '838808', 'Doloribus consectetur id voluptatem non mollitia ex.', '09845626', '489', '7416', 'm', 468.7300, 188.69, 7294.45, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(232, 47, 55, '107009', 'Optio sunt explicabo rem deserunt minima ut.', '77472416', '357', '1864', 'm', 583.8800, 676.40, 1028.80, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(233, 47, 55, '651354', 'Nihil voluptates perspiciatis deserunt praesentium.', '73784739', '195', '1461', 'un', 959.5800, 923.87, 758.82, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(234, 47, 55, '945595', 'Voluptas exercitationem et quae in et.', '79531028', '867', '5837', 'kg', 917.0700, 805.00, 4552.35, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(235, 47, 55, '848566', 'Eaque laborum ipsam eos itaque.', '15328864', '085', '0906', 'un', 960.2700, 270.04, 456.44, NULL, 0, NULL, '2024-07-27 19:18:35', '2024-07-27 19:18:35'),
(236, 48, 55, '972558', 'Ipsum dolor neque sit qui.', '55968089', '458', '1834', 'm', 754.4500, 398.31, 6653.38, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(237, 48, 55, '793244', 'At illum et totam voluptatem aut veniam.', '69676270', '724', '5067', 'un', 68.6200, 920.02, 6121.68, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(238, 48, 55, '767601', 'Ut tenetur cupiditate quibusdam unde iste magnam.', '27499828', '175', '7028', 'kg', 847.2000, 887.81, 837.00, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(239, 48, 55, '336345', 'Perspiciatis iure et blanditiis et.', '20274609', '248', '8946', 'kg', 449.6000, 42.16, 8263.01, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(240, 48, 55, '111651', 'Rerum aut possimus dolorem et animi.', '85648570', '754', '6891', 'un', 99.7900, 143.56, 7570.10, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(241, 49, 55, '236680', 'Et nihil porro aut est labore consequatur.', '64203123', '606', '1313', 'kg', 631.6400, 401.98, 6741.68, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(242, 49, 55, '511963', 'Quia rerum accusantium sit voluptate.', '44681753', '818', '9630', 'kg', 459.7900, 477.32, 1728.61, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(243, 49, 55, '693158', 'Tempora earum aliquid vel id.', '13522807', '740', '7938', 'un', 714.6600, 496.14, 5811.38, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(244, 49, 55, '602026', 'Nam veniam tempore sit dolorem rerum est est possimus.', '66873234', '612', '5593', 'kg', 392.7200, 334.67, 2432.68, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(245, 49, 55, '636888', 'Aut velit qui accusamus dolore.', '56992748', '438', '3072', 'un', 310.4100, 180.00, 2380.92, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(246, 50, 55, '193433', 'Voluptas asperiores non harum ipsa debitis minus quis laudantium.', '45027799', '576', '0833', 'un', 355.9400, 238.44, 6402.93, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(247, 50, 55, '561796', 'Qui facilis culpa non rerum et animi.', '85441733', '915', '5309', 'kg', 484.1400, 747.54, 5347.01, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(248, 50, 55, '484406', 'Rerum harum est laudantium.', '00000119', '675', '2128', 'un', 681.8300, 166.88, 3351.78, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(249, 50, 55, '764328', 'Ipsa dolorem quasi aut ab molestiae quidem non consequuntur.', '62133529', '039', '8492', 'kg', 620.1300, 747.40, 9844.26, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(250, 50, 55, '815721', 'Id nemo doloremque et illum excepturi quis.', '20999501', '087', '5746', 'm', 666.3500, 62.58, 8749.88, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(251, 51, 55, '562951', 'Eos soluta laudantium nobis beatae totam.', '87580523', '636', '7777', 'kg', 999.2200, 32.43, 7674.79, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(252, 51, 55, '132717', 'Iste reiciendis et aut vitae id repellendus sed ut.', '56036242', '261', '0905', 'un', 449.1000, 147.17, 7673.38, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(253, 51, 55, '522779', 'Doloribus nihil eveniet eius non sunt.', '50373830', '976', '2707', 'kg', 278.0200, 770.88, 6017.56, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(254, 51, 55, '646446', 'Sunt officia quisquam magnam vel voluptatem.', '15652362', '148', '9300', 'kg', 921.4000, 77.21, 4243.96, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(255, 51, 55, '025496', 'Et ullam ipsam facere rerum aspernatur dolorem sequi laborum.', '66307157', '890', '9660', 'un', 103.7100, 915.91, 932.85, NULL, 0, NULL, '2024-07-27 19:18:36', '2024-07-27 19:18:36'),
(256, 52, 55, '985769', 'Veniam et odit aperiam nostrum molestiae.', '71723761', '857', '9377', 'kg', 234.2600, 473.93, 1706.27, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(257, 52, 55, '676447', 'Esse consequuntur asperiores quasi est dolorum.', '82891924', '764', '8611', 'un', 475.0800, 616.94, 608.22, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(258, 52, 55, '354369', 'Odio repudiandae a voluptatem esse repellendus amet aut.', '19953407', '072', '5846', 'm', 226.3800, 96.74, 8280.42, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(259, 52, 55, '652917', 'Vitae excepturi dolorem ullam in.', '02569600', '218', '7194', 'm', 849.0700, 490.56, 4578.70, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(260, 52, 55, '931727', 'Dolorem optio laborum ab aut vitae.', '12360590', '026', '4797', 'kg', 621.7400, 927.12, 2526.65, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(261, 53, 55, '760962', 'Magni ipsum et et culpa eligendi.', '91559933', '921', '7071', 'un', 428.7100, 768.72, 2284.79, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(262, 53, 55, '991719', 'Voluptatem natus ducimus fugiat omnis.', '45909832', '761', '6711', 'un', 951.1400, 685.16, 4878.53, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37');
INSERT INTO `nfe_items` (`id`, `nfe_entrada_id`, `product_id`, `codigo_produto`, `descricao`, `ncm`, `cst`, `cfop`, `unidade`, `quantidade`, `valor_unitario`, `valor_total`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(263, 53, 55, '837139', 'Voluptatem molestiae praesentium et recusandae delectus ullam.', '19568111', '818', '2483', 'un', 830.7500, 448.37, 2720.01, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(264, 53, 55, '629227', 'Non voluptas praesentium voluptatem eius ut pariatur vel.', '99591960', '309', '3793', 'un', 125.6200, 570.45, 8283.95, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(265, 53, 55, '315916', 'Aut nihil laboriosam autem incidunt est accusamus eos.', '69720235', '566', '0085', 'un', 616.7500, 331.89, 820.38, NULL, 0, NULL, '2024-07-27 19:18:37', '2024-07-27 19:18:37'),
(266, 54, 55, '562815', 'Repellat voluptas hic vel libero blanditiis repellendus.', '00518722', '824', '5997', 'kg', 214.9000, 490.39, 5422.72, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(267, 54, 55, '695477', 'Quam similique aut eveniet aut exercitationem explicabo.', '25830206', '943', '0718', 'm', 397.9400, 931.50, 5041.87, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(268, 54, 55, '441436', 'Dignissimos at tempora ut tempore enim maiores ut.', '48553861', '994', '9519', 'm', 886.0100, 408.85, 3831.38, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(269, 54, 55, '591689', 'Fuga mollitia est cum necessitatibus in.', '43924810', '238', '1228', 'un', 583.9500, 277.74, 1858.65, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(270, 54, 55, '784446', 'Beatae sapiente debitis aliquam aut.', '35339130', '578', '8710', 'kg', 106.7600, 400.55, 2449.00, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(271, 55, 55, '555390', 'Tempora eligendi voluptas quo suscipit nihil praesentium atque.', '81469628', '766', '2633', 'm', 902.0800, 558.89, 1633.91, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(272, 55, 55, '409064', 'Ea eveniet atque ut pariatur.', '06605027', '506', '5311', 'm', 265.2600, 572.99, 6258.83, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(273, 55, 55, '855837', 'Atque at cumque dolor et.', '50002221', '293', '0151', 'un', 999.6400, 839.77, 9100.73, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(274, 55, 55, '315129', 'Modi quia ad quis et repellat voluptates molestias.', '82508368', '523', '5732', 'kg', 630.0100, 258.64, 6364.99, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(275, 55, 55, '250904', 'Quidem voluptas nam nemo.', '47310162', '180', '7183', 'kg', 701.6100, 752.75, 1347.91, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(276, 56, 55, '605314', 'Sunt porro corrupti facilis suscipit dolorem quia.', '71869030', '038', '0133', 'kg', 570.5400, 936.79, 8931.19, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(277, 56, 55, '442408', 'In voluptate hic non placeat est est repellendus.', '57528385', '061', '3622', 'kg', 543.1200, 175.59, 2606.48, NULL, 0, NULL, '2024-07-27 19:18:38', '2024-07-27 19:18:38'),
(278, 56, 55, '486408', 'Enim blanditiis magnam voluptatibus in iure omnis.', '36494282', '608', '1795', 'kg', 864.8700, 890.27, 4548.24, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(279, 56, 55, '161733', 'Perspiciatis est quis qui excepturi velit nam ut.', '26634576', '090', '5100', 'kg', 568.3800, 282.21, 6664.21, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(280, 56, 55, '987642', 'Et ea aut nemo repellendus quo possimus.', '21683002', '490', '5947', 'm', 936.0900, 805.98, 9425.19, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(281, 57, 55, '220751', 'Molestias cupiditate non id animi totam quia voluptate.', '91801550', '987', '6738', 'm', 260.0500, 123.37, 9817.52, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(282, 57, 55, '426235', 'Voluptatem libero incidunt sit ad consequatur in rerum.', '43286314', '809', '0353', 'kg', 582.5300, 487.82, 3924.34, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(283, 57, 55, '558913', 'Aperiam exercitationem et aut omnis.', '63974517', '328', '4561', 'kg', 227.3000, 480.78, 3753.67, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(284, 57, 55, '773878', 'Alias magnam iure voluptates delectus.', '54050727', '941', '7152', 'kg', 81.3300, 418.02, 6303.38, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(285, 57, 55, '392093', 'Quia iusto eos vitae et sunt.', '25550277', '090', '2979', 'kg', 538.4000, 527.80, 5270.88, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(286, 58, 55, '697308', 'Est corrupti repellat dolor praesentium nobis.', '48797867', '251', '5934', 'un', 972.8900, 272.13, 7693.10, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(287, 58, 55, '851113', 'Harum nobis inventore labore quia eum corporis.', '06323395', '732', '4057', 'un', 558.4600, 284.55, 4066.21, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(288, 58, 55, '308271', 'Voluptates doloremque et perferendis at eos voluptates repellendus laborum.', '79102944', '322', '6663', 'm', 959.3000, 147.30, 6987.67, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(289, 58, 55, '934790', 'Dolor maxime quis temporibus ipsa laboriosam dolores necessitatibus.', '48368927', '401', '9146', 'kg', 450.1300, 80.29, 4995.80, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(290, 58, 55, '579770', 'Qui maiores consequatur eos.', '34375682', '782', '7797', 'un', 483.5700, 314.50, 4134.88, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(291, 59, 55, '505781', 'Repellat consequuntur iure voluptates velit officiis quasi tempore.', '47861747', '950', '1381', 'un', 292.6400, 171.11, 987.26, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(292, 59, 55, '258979', 'Animi cupiditate sint voluptatem.', '32835214', '949', '4307', 'kg', 617.1200, 152.24, 2964.70, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(293, 59, 55, '586136', 'Pariatur voluptatem mollitia dolore ducimus odio molestiae.', '69354806', '133', '7621', 'm', 26.2100, 119.91, 8138.99, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(294, 59, 55, '321664', 'Consequatur exercitationem animi perspiciatis nihil occaecati.', '79864100', '489', '0763', 'un', 761.8900, 43.37, 6801.75, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(295, 59, 55, '158416', 'Qui aspernatur porro aut quas magni.', '09015286', '447', '8189', 'm', 470.1500, 650.53, 3951.76, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(296, 60, 55, '954799', 'Ut id at velit quae eligendi exercitationem non.', '04728779', '467', '0066', 'un', 776.7800, 279.49, 7156.18, NULL, 0, NULL, '2024-07-27 19:18:39', '2024-07-27 19:18:39'),
(297, 60, 55, '120704', 'Doloremque eum amet aut consequatur.', '19586553', '016', '4476', 'kg', 786.2700, 287.35, 5181.01, NULL, 0, NULL, '2024-07-27 19:18:40', '2024-07-27 19:18:40'),
(298, 60, 55, '680642', 'Qui voluptates ad et maxime adipisci.', '54641250', '832', '6380', 'un', 373.0600, 144.86, 7556.69, NULL, 0, NULL, '2024-07-27 19:18:40', '2024-07-27 19:18:40'),
(299, 60, 55, '137016', 'Eos quasi corporis adipisci enim.', '42836584', '302', '2171', 'kg', 121.2800, 969.40, 7814.08, NULL, 0, NULL, '2024-07-27 19:18:40', '2024-07-27 19:18:40'),
(300, 60, 55, '483197', 'Quos ratione natus non.', '43748650', '395', '4666', 'kg', 273.5800, 668.96, 8404.32, NULL, 0, NULL, '2024-07-27 19:18:40', '2024-07-27 19:18:40');

-- --------------------------------------------------------

--
-- Estrutura para tabela `offices`
--

CREATE TABLE `offices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sector_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `offices`
--

INSERT INTO `offices` (`id`, `sector_id`, `name`, `description`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Diretor', 'diretor executivo (CEO), diretor financeiro (CFO), diretor de operações (COO) e outros cargos de diretoria.', NULL, 0, NULL, NULL, NULL),
(2, 1, 'Gerente', ' gerencia um departamento ou área da empresa, define estratégias, aloca recursos e lidera equipes.', NULL, 0, NULL, NULL, NULL),
(3, 1, 'Coordenador', 'coordena o trabalho de diferentes equipes, garante a comunicação entre os setores e resolve conflitos.', NULL, 0, NULL, NULL, NULL),
(4, 1, 'Supervisor', 'supervisiona o trabalho de uma equipe, define metas, acompanha o desempenho dos funcionários e fornece feedback.', NULL, 0, NULL, NULL, NULL),
(5, 2, 'Gerente administrativo', 'gerencia o setor administrativo da empresa, definindo estratégias, liderando equipes e supervisionando o andamento dos trabalhos.', NULL, 0, NULL, NULL, NULL),
(6, 2, 'Analista administrativo', 'responsável por analisar e otimizar processos administrativos, além de implementar novas tecnologias e procedimentos.', NULL, 0, NULL, NULL, NULL),
(7, 2, 'Assistente administrativo', ' realiza tarefas administrativas mais complexas, como elaboração de relatórios, contoffice de processos e gestão de documentos.', NULL, 0, NULL, NULL, NULL),
(8, 2, 'Auxiliar administrativo', 'responsável por tarefas administrativas gerais, como atendimento ao público, organização de arquivos, digitação e suporte ao RH.', NULL, 0, NULL, NULL, NULL),
(9, 3, 'Gerente financeiro', 'gerencia o setor financeiro da empresa, definindo estratégias de investimento, controlando o fluxo de caixa e supervisionando o trabalho da equipe.', NULL, 0, NULL, NULL, NULL),
(10, 3, 'Analista financeiro', 'responsável por analisar a situação financeira da empresa, identificar oportunidades de investimento e desenvolver estratégias para otimizar o uso dos recursos financeiros.', NULL, 0, NULL, NULL, NULL),
(11, 3, 'Assistente financeiro', 'realiza tarefas financeiras mais complexas, como análise de demonstrativos financeiros, elaboração de orçamentos e contoffice de custos.', NULL, 0, NULL, NULL, NULL),
(12, 3, 'Auxiliar financeiro', 'responsável por tarefas financeiras básicas, como lançamento de pagamentos e recebimentos, conciliação bancária e digitação de notas fiscais.', NULL, 0, NULL, NULL, NULL),
(13, 4, 'Gerente de RH', 'gerencia o setor de RH da empresa, definindo estratégias de recrutamento e seleção, treinamento e desenvolvimento e gestão de pessoas.', NULL, 0, NULL, NULL, NULL),
(14, 4, 'Analista de RH', 'responsável por analisar dados de RH, identificar oportunidades de melhoria e desenvolver políticas e procedimentos para a área.', NULL, 0, NULL, NULL, NULL),
(15, 4, 'Assistente de RH', 'realiza tarefas de RH mais complexas, como admissão e demissão de funcionários, treinamento e desenvolvimento e gestão de benefícios.', NULL, 0, NULL, NULL, NULL),
(16, 4, 'Auxiliar de RH', ' responsável por tarefas básicas de RH, como recrutamento e seleção, folha de pagamento e benefício', NULL, 0, NULL, NULL, NULL),
(17, 5, 'Prospecção de Clientes', 'Identificar potenciais clientes: Buscar novos clientes em potencial através de diversas fontes, como listas telefônicas, sites, eventos, networking e parcerias estratégicas. Qualificar leads: Avaliar o interesse e a capacidade de compra dos leads, priorizando aqueles com maior potencial de conversão em clientes. Criar e manter um banco de dados de leads: Organizar e gerenciar as informações dos leads de forma eficiente, para acompanhamento e nutrição.', NULL, 0, NULL, NULL, NULL),
(18, 5, 'Vendas', 'Apresentar produtos ou serviços: Demonstrar as características, benefícios e diferenciais dos produtos ou serviços para os clientes potenciais. Negociar preços e condições de pagamento: Buscar o melhor acordo para ambas as partes, considerando os objetivos da empresa e as necessidades do cliente. Fechar vendas: Concluir o processo de venda, formalizando o pedido e garantindo o pagamento.', NULL, 0, NULL, NULL, NULL),
(19, 5, 'Atendimento ao Cliente', 'Fornecer suporte pré-venda: Esclarecer dúvidas, fornecer informações adicionais e auxiliar os clientes na escolha do produto ou serviço ideal. Gerenciar o relacionamento com os clientes: Manter contato com os clientes, construir relacionamentos duradouros e fidelizá-los. Resolver problemas e reclamações: Lidar com os problemas e reclamações dos clientes de forma eficiente e profissional, buscando soluções satisfatórias para ambas as partes.', NULL, 0, NULL, NULL, NULL),
(20, 5, 'Pós-venda', 'Garantir a satisfação do cliente: Monitorar a experiência do cliente após a compra, identificar oportunidades de melhoria e garantir que o cliente esteja satisfeito com o produto ou serviço adquirido. Coletar feedback: Obter feedback dos clientes sobre os produtos, serviços e atendimento, para aprimorar as ofertas da empresa. Oferecer suporte técnico: Auxiliar os clientes na utilização dos produtos ou serviços, solucionar problemas técnicos e fornecer treinamento quando necessário.', NULL, 0, NULL, NULL, NULL),
(21, 5, 'Marketing e Vendas:', 'Desenvolver estratégias de marketing e vendas: Criar e implementar planos de ação para atrair novos clientes, aumentar as vendas e alcançar os objetivos da empresa. Gerenciar campanhas de marketing: Planejar, executar e monitorar campanhas de marketing para promover os produtos ou serviços da empresa. Utilizar ferramentas de marketing e vendas: Empregar ferramentas de CRM, marketing digital, automação de marketing e outras tecnologias para otimizar o processo de vendas.', NULL, 0, NULL, NULL, NULL),
(22, 5, 'Análise de Dados', 'Coletar e analisar dados de vendas: Obter e analisar dados sobre as vendas, clientes, mercado e concorrência para identificar oportunidades e tomar decisões estratégicas. Monitorar indicadores de desempenho: Acompanhar indicadores de desempenho (KPIs) como taxa de conversão, ticket médio e churn rate para avaliar o desempenho do setor comercial. Gerar relatórios e dashboards: Criar relatórios e dashboards para visualizar os dados de forma clara e concisa, auxiliando na tomada de decisões.', NULL, 0, NULL, NULL, NULL),
(23, 5, 'Gestão da Equipe', 'Liderar e motivar a equipe de vendas: Motivar e inspirar a equipe para alcançar os objetivos do setor comercial. Treinar e desenvolver a equipe: Fornecer treinamento e desenvolvimento profissional para a equipe, aprimorando suas habilidades e conhecimentos. Gerenciar o desempenho da equipe: Monitorar o desempenho individual e da equipe, oferecendo feedback e reconhecendo conquistas.', NULL, 0, NULL, NULL, NULL),
(24, 5, 'Outras Funções', 'Participar de feiras e eventos: Representar a empresa em feiras, eventos e congressos do setor para divulgar os produtos ou serviços e captar novos clientes. Manter-se atualizado sobre o mercado: Monitorar as tendências do mercado, as ações da concorrência e as mudanças no comportamento do consumidor para adaptar as estratégias de vendas. Cumprir as leis e normas regulatórias: Assegurar o cumprimento das leis e normas regulatórias relacionadas às atividades de vendas e marketing.', NULL, 0, NULL, NULL, NULL),
(25, 6, 'Supervisor operacional', 'supervisiona as atividades da equipe operacional, garante a qualidade do trabalho e a segurança dos funcionários.', NULL, 0, NULL, NULL, NULL),
(26, 6, 'Técnico', 'realiza reparos e manutenções em equipamentos, instalações e máquinas.', NULL, 0, NULL, NULL, NULL),
(27, 6, 'Operador de máquina', ' opera máquinas e equipamentos, seguindo instruções e procedimentos de segurança.', NULL, 0, NULL, NULL, NULL),
(28, 6, 'Auxiliar operacional', 'responsável por tarefas operacionais básicas, como limpeza, organização e recepção.', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `cep` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `nivel_zoon` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `logo_light` varchar(255) DEFAULT NULL,
  `logo_dark` varchar(255) DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `partners`
--

INSERT INTO `partners` (`id`, `name`, `contact`, `email`, `website`, `phone`, `whatsapp`, `facebook`, `x`, `tiktok`, `instagram`, `cep`, `city`, `uf`, `number`, `complement`, `neighborhood`, `address`, `latitude`, `longitude`, `nivel_zoon`, `favicon`, `logo_light`, `logo_dark`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Naifer', 'Adjaime Naito', 'naiferemp@gmail.com', 'lojanaifer.com.br', '(38) 99753-4565', '(38) 99753-4565', 'https://facebook.com/lojanaifer', 'https://twitter.com/lojanaifer', 'https://tiktok.com/@lojanaifer', 'https://instagram', '38616-048', 'Unaí', 'MG', '61', 'Apto 103', 'Barroca', 'Rua Júlio Borges', '-16.3681', '-46.8986', '13', 'partner/1/Naifer_favicon_202407081816.png', 'partner/1/Naifer_logo_light_202407081816.svg', 'partner/1/Naifer_logo_dark_202407081816.svg', 0, NULL, '2024-07-27 19:16:30', '2024-07-27 19:16:30'),
(2, 'Naito Marketing Digital', 'Adjaime Naito', 'adjnaito@gmail.com', 'lojanaifer.com.br', '(38) 99753-4565', '(38) 99753-4565', 'https://facebook.com/lojanaifer', 'https://twitter.com/lojanaifer', 'https://tiktok.com/@lojanaifer', 'https://instagram', '38616-048', 'Unaí', 'MG', '61', 'Apto 103', 'Barroca', 'Rua Júlio Borges', '-16.3681', '-46.8986', '13', 'partner/2/NaitoMarketingDigital_favicon_202407081833.png', 'partner/2/NaitoMarketingDigital_logo_light_202407081818.png', 'partner/2/NaitoMarketingDigital_logo_dark_202407081818.png', 0, NULL, '2024-07-27 19:16:30', '2024-07-27 19:16:30'),
(3, 'JA Assistencia', 'Josino', 'jassistencia@gmail.com', 'jassistencia.com.br', '(38)99947-3993', '(38)9947-3993', 'https://facebook.com/', 'https://twitter.com/', 'https://tiktok.com/', 'https://instagram', '38610-316', 'Unaí', 'MG', '175', '', 'Cachoeira', 'Rua Frei Cecílio', '-16.35343', '-46.8928', '13', 'partner/3/JAAssistencia_favicon_202407081815.png', 'partner/3/JAAssistencia_logo_light_202407081814.png', 'partner/3/JAAssistencia_logo_dark_202407081814.png', 0, NULL, '2024-07-27 19:16:30', '2024-07-27 19:16:30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `shipping_value` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `profit_margin` decimal(5,2) DEFAULT NULL,
  `freight_sale` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `image_hover` varchar(255) DEFAULT NULL,
  `launch` tinyint(1) NOT NULL DEFAULT 0,
  `promotion` tinyint(1) NOT NULL DEFAULT 0,
  `promotion_price` decimal(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subgroup_id` bigint(20) UNSIGNED DEFAULT NULL,
  `collection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action_user` varchar(255) DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `sku`, `qr_code`, `barcode`, `purchase_price`, `shipping_value`, `cost_price`, `profit_margin`, `freight_sale`, `sale_price`, `stock`, `image`, `image_hover`, `launch`, `promotion`, `promotion_price`, `category_id`, `subcategory_id`, `group_id`, `subgroup_id`, `collection_id`, `brand_id`, `color_id`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Blusa Leve Light Running UV50+', 'Blusa Leve Light Running UV50+ 1', 'FT31JAZTL0', '', '', 78.00, NULL, 85.80, NULL, NULL, 140.40, 0, '', NULL, 0, 0, 117.00, 1, 1, 3, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:02', '2024-07-27 19:18:02'),
(2, 'Blusa Leve Light Running UV50+', 'Blusa Leve Light Running UV50+ 5', 'FT31JBRTL0', '', '', 78.00, NULL, 85.80, NULL, NULL, 140.40, 0, '', NULL, 0, 0, 117.00, 1, 1, 3, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:02', '2024-07-27 19:18:02'),
(3, 'Blusa Leve Light Running UV50+', 'Blusa Leve Light Running UV50+ 9', 'FT31JTPTL0', '', '', 78.00, NULL, 85.80, NULL, NULL, 140.40, 0, '', NULL, 0, 0, 117.00, 1, 1, 3, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:02', '2024-07-27 19:18:02'),
(4, 'Blusa Leve Graphen UV50+', 'Blusa Leve Graphen UV50+ 1', 'FT31JAZTL0', '', '', 106.80, NULL, 117.48, NULL, NULL, 192.24, 0, '', NULL, 0, 0, 160.20, 1, 1, 3, 1, 1, 1, 4, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:02', '2024-07-27 19:18:02'),
(5, 'Blusa Leve Graphen UV50+', 'Blusa Leve Graphen UV50+ 5', 'FT31JBRTL0', '', '', 106.80, NULL, 117.48, NULL, NULL, 192.24, 0, '', NULL, 0, 0, 160.20, 1, 1, 3, 1, 1, 1, 5, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(6, 'Blusa Leve Graphen UV50+', 'Blusa Leve Graphen UV50+ 9', 'FT31JTPTL0', '', '', 106.80, NULL, 117.48, NULL, NULL, 192.24, 0, '', NULL, 0, 0, 160.20, 1, 1, 3, 1, 1, 1, 6, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(7, 'Blusa Leve Graphen UV50+', 'Blusa Leve Graphen UV50+ 13', '', '', '', 106.80, NULL, 117.48, NULL, NULL, 192.24, 0, '', NULL, 0, 0, 160.20, 1, 1, 3, 1, 1, 1, 7, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(8, 'Blusa Leve Graphen UV50+', 'Blusa Leve Graphen UV50+ 17', '', '', '', 106.80, NULL, 117.48, NULL, NULL, 192.24, 0, '', NULL, 0, 0, 160.20, 1, 1, 3, 1, 1, 1, 8, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(9, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 1', 'T31TTAML0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(10, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 5', 'T31TTBRL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(11, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 9', 'T31TTPTL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(12, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 13', 'T31TTABL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 9, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(13, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 17', 'T31TTBAL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 10, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(14, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 21', 'T31TTPBL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 11, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(15, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 25', 'T31TTBPL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 12, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(16, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 29', 'T31TCPAL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 13, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(17, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 33', 'T31TCPCL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 14, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(18, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 37', 'T31TCPGL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 15, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(19, 'Camisa Manga Longa UV50+', 'Camisa Manga Longa UV50+ 41', 'T31TCPVL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 16, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(20, 'Camiseta UV50+', 'Camisa UV50+ 1', 'T33TTAMC0', '', '', 42.00, NULL, 46.20, NULL, NULL, 75.60, 0, '', NULL, 0, 0, 63.00, 1, 1, 3, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(21, 'Camiseta UV50+', 'Camisa UV50+ 5', 'T33TTBRC0', '', '', 42.00, NULL, 46.20, NULL, NULL, 75.60, 0, '', NULL, 0, 0, 63.00, 1, 1, 3, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(22, 'Camiseta UV50+', 'Camisa UV50+ 9', 'T33TTPTC0', '', '', 42.00, NULL, 46.20, NULL, NULL, 75.60, 0, '', NULL, 0, 0, 63.00, 1, 1, 3, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(23, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 1', 'T30TTPTL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(24, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 5', 'T30TTBRL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(25, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 9', 'T30TTRSL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 17, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(26, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 13', 'T30TTACL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 18, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(27, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 17', 'T30TTAPL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 19, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(28, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 21', 'T30TTPAL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 20, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:03', '2024-07-27 19:18:03'),
(29, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 25', 'T30TTRPL0', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 21, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(30, 'Camisa Manga Longa UV50+ Feminina', 'Camisa Manga Longa UV50+ Feminina 29', 'T30TTPRL)', '', '', 46.00, NULL, 50.60, NULL, NULL, 82.80, 0, '', NULL, 0, 0, 69.00, 1, 1, 1, 1, 1, 1, 22, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(31, 'Camisa Ninja UV50+', 'Camisa Ninja UV50+ 1', 'T31TNAZ', '', '', 64.00, NULL, 70.40, NULL, NULL, 115.20, 0, '', NULL, 0, 0, 96.00, 1, 1, 1, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(32, 'Camisa Ninja UV50+', 'Camisa Ninja UV50+ 5', 'T31TNBR', '', '', 64.00, NULL, 70.40, NULL, NULL, 115.20, 0, '', NULL, 0, 0, 96.00, 1, 1, 1, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(33, 'Camisa Ninja UV50+', 'Camisa Ninja UV50+ 9', 'T31TNPT', '', '', 64.00, NULL, 70.40, NULL, NULL, 115.20, 0, '', NULL, 0, 0, 96.00, 1, 1, 1, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(34, 'Jaqueta Esportiva', 'Jaqueta Esportiva 1', 'T31TNAZ', '', '', 78.00, NULL, 85.80, NULL, NULL, 140.40, 0, '', NULL, 0, 0, 117.00, 1, 1, 4, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(35, 'Jaqueta Esportiva', 'Jaqueta Esportiva 8', 'T31TNAZ', '', '', 78.00, NULL, 85.80, NULL, NULL, 140.40, 0, '', NULL, 0, 0, 117.00, 1, 1, 4, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(36, 'Jaqueta Esportiva', 'Jaqueta Esportiva 9', 'T31TNAZ', '', '', 78.00, NULL, 85.80, NULL, NULL, 140.40, 0, '', NULL, 0, 0, 117.00, 1, 1, 4, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(37, 'Manguito', 'Manguito 1', 'T32MGAZ10', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(38, 'Manguito', 'Manguito 2', 'T32MGBR10', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(39, 'Manguito', 'Manguito 3', 'T32MGPT10', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(40, 'Manguito', 'Manguito 4', 'T32MCAZ20', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 13, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(41, 'Manguito', 'Manguito 5', 'T32MGBR20', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 14, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(42, 'Manguito', 'Manguito 6', 'T32MGPT20', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 15, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(43, 'Manguito', 'Manguito 7', 'T32MGPT20', '', '', 23.00, NULL, 25.30, NULL, NULL, 41.40, 0, '', NULL, 0, 0, 34.50, 1, 1, 5, 1, 1, 1, 16, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(44, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 1', 'T32MGAZ20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(45, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 2', 'T32MGBR20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(46, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 3', 'T32MGPT20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(47, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 4', 'T32MCAZ20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 13, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(48, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 5', 'T32MGBR20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 14, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(49, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 6', 'T32MGPT20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 15, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(50, 'Manguito C/ Encaixe para dedo', 'Manguito C/ Encaixe para dedo 7', 'T32MGPT20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 5, 1, 1, 1, 16, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(51, 'Bandana', 'Bandana 1', 'T32BSAM20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 6, 1, 1, 1, 1, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:04', '2024-07-27 19:18:04'),
(52, 'Bandana', 'Bandana 2', 'T32BSBR20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 6, 1, 1, 1, 2, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(53, 'Bandana', 'Bandana 3', 'T32BSPT20', '', '', 26.00, NULL, 28.60, NULL, NULL, 46.80, 0, '', NULL, 0, 0, 39.00, 1, 1, 6, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(54, 'PERNITOS PROTEÇÃO UV50+ ', 'PERNITOS PROTEÇÃO UV50+ ', '', '', '', 46.55, NULL, 51.21, NULL, NULL, 83.79, 0, '', NULL, 0, 0, 69.83, 1, 1, 7, 1, 1, 1, 3, 'Criado por: Seeder em 2024-07-27 16:18:02', 0, NULL, '2024-07-27 19:18:05', '2024-07-27 19:18:05'),
(55, 'ipsam', 'Culpa deleniti voluptatem beatae ad quo deleniti.', 'sed', 'quidem', 'aliquid', 754.55, NULL, NULL, NULL, NULL, NULL, 193495, 'https://via.placeholder.com/640x480.png/00aa66?text=a', NULL, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 'Created by factory on 2024-07-27 16:18:22', 1, NULL, '2024-07-27 19:18:22', '2024-07-27 19:18:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_fees`
--

CREATE TABLE `product_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `taxes_gov` decimal(5,2) DEFAULT NULL,
  `tax_gateway` decimal(5,2) DEFAULT NULL,
  `tax_platform` decimal(5,2) DEFAULT NULL,
  `tax_marketplace` decimal(5,2) DEFAULT NULL,
  `tax_intermediation` decimal(5,2) DEFAULT NULL,
  `tax_commission` decimal(5,2) DEFAULT NULL,
  `tax_additional_services` decimal(5,2) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `icms` decimal(5,2) DEFAULT NULL,
  `ipi` decimal(5,2) DEFAULT NULL,
  `pis_pasep` decimal(5,2) DEFAULT NULL,
  `cofins` decimal(5,2) DEFAULT NULL,
  `irpj` decimal(5,2) DEFAULT NULL,
  `csll` decimal(5,2) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `projects_tables`
--

CREATE TABLE `projects_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_title` varchar(255) NOT NULL,
  `project_description` text NOT NULL,
  `client` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `category` varchar(255) NOT NULL,
  `technologies_used` text NOT NULL,
  `project_images` text DEFAULT NULL,
  `project_url` varchar(255) DEFAULT NULL,
  `client_testimonial` text DEFAULT NULL,
  `project_team` varchar(255) NOT NULL,
  `results_metrics` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Completed',
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sectors`
--

CREATE TABLE `sectors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sectors`
--

INSERT INTO `sectors` (`id`, `name`, `description`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Liderança', 'Liderança é a habilidade de motivar, influenciar e gerenciar pessoas. Nas empresas, esse tipo de função é fundamental para fazer com que os colaboradores trabalhem de maneira focada e atinjam os objetivos desejados pelo negócio.', NULL, 0, NULL, NULL, NULL),
(2, 'Administrativos', 'Um setor administrativo é uma divisão ou departamento dentro de uma organização ou empresa que é responsável por lidar com as atividades relacionadas à gestão, organização e coordenação dos recursos e processos internos.', NULL, 0, NULL, NULL, NULL),
(3, 'Financeiros', 'O setor financeiro é responsável por tratar de todos os assuntos relacionados a finanças da empresa, visando a realização dos objetivos da mesma. Isso contribui para a tomada de decisões, como corte de custos ou investimentos.', NULL, 0, NULL, NULL, NULL),
(4, 'Recursos Humanos', 'A área de Recursos Humanos é a junção de colaboradores de uma determinada empresa. A base do segmento responsável são as ações de seleção, recrutamento, treinamento, remuneração e fornecimento de vantagens aos trabalhadores. O setor de RH surgiu no início do século XX, ainda como resultado da Revolução Industrial.', NULL, 0, NULL, NULL, NULL),
(5, 'Comercial', 'O que é setor comercial de uma empresa? Em resumo, o setor comercial é responsável por gerar receita para a empresa, por meio da venda de produtos ou serviços. Um setor comercial eficiente pode impulsionar as vendas, aumentar a fidelidade dos clientes e, consequentemente, contribuir para o crescimento do negócio.', NULL, 0, NULL, NULL, NULL),
(6, 'Operacionais', 'O setor operacional é aquele que lida com o fazer da empresa. Isso inclui diversas atividades de acordo com o tipo de negócio. Alguns exemplos são a produção, logística, gestão de recursos materiais e vendas. Dessa maneira, ele é o que dá a forma final ao produto ou serviço até a entrega ao cliente.', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('a0EQky9zYkNBagEmmPAk004cnPRaMFrj4bUm1rbL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOW16R1ZWWTdRZ0xYNUdmcUdaeGF4R1Fvd09sTXpaZ0NlOXVaMk5aRyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VzZXIvcHJvZmlsZSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1722097180),
('Dg6DF8okY0B3eESEyA4wyVJrJX9NqnhRmX59Oo1y', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTmRTdEdwTDB0cUpOcjUzaDBYRXFYWTJUbzVKUnFXREd0eGZIT29idyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkTXFuSnJaM25LYlpVaVZvYTlNMjdXdXlEeDNjVjlQLjFFS0dEekpJdkNZR1Q0UFZOcG16V0siO30=', 1722109476),
('LPfLjNgd7lN2C0VszMWhIXred9u3URO7DSvUYmec', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRWtzMlh6TXFDbUhBRDR6bXM3ODFubmlGc1FCU3piR3dISXkyejNnSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJE1xbkpyWjNuS2JaVWlWb2E5TTI3V3V5RHgzY1Y5UC4xRUtHRHpKSXZDWUdUNFBWTnBteldLIjt9', 1722109082);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `size` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sizes`
--

INSERT INTO `sizes` (`id`, `product_id`, `name`, `stock`, `description`, `size`, `image`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(2, 1, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(3, 1, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(4, 1, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(5, 2, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(6, 2, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(7, 2, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:12', '2024-07-27 19:18:12'),
(8, 2, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(9, 3, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(10, 3, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(11, 3, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(12, 3, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(13, 4, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(14, 4, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(15, 4, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(16, 4, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(17, 5, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(18, 5, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(19, 5, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(20, 5, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(21, 6, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(22, 6, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(23, 6, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(24, 6, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(25, 7, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(26, 7, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(27, 7, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(28, 7, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(29, 8, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(30, 8, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(31, 8, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:13', '2024-07-27 19:18:13'),
(32, 8, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(33, 9, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(34, 9, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(35, 9, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(36, 9, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(37, 10, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(38, 10, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(39, 10, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(40, 10, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(41, 11, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(42, 11, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(43, 11, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(44, 11, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(45, 12, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(46, 12, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(47, 12, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(48, 12, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(49, 13, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(50, 13, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(51, 13, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(52, 13, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(53, 14, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(54, 14, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(55, 14, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:14', '2024-07-27 19:18:14'),
(56, 14, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(57, 15, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(58, 15, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(59, 15, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(60, 15, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(61, 16, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(62, 16, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(63, 16, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(64, 16, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(65, 17, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(66, 17, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(67, 17, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(68, 17, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(69, 18, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(70, 18, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(71, 18, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(72, 18, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(73, 19, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(74, 19, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(75, 19, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(76, 19, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(77, 20, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:15', '2024-07-27 19:18:15'),
(78, 20, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(79, 20, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(80, 20, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(81, 21, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(82, 21, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(83, 21, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(84, 21, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(85, 22, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(86, 22, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(87, 22, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(88, 22, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(89, 23, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(90, 23, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(91, 23, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(92, 23, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:16', '2024-07-27 19:18:16'),
(93, 24, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(94, 24, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(95, 24, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(96, 24, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(97, 25, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(98, 25, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(99, 25, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(100, 25, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(101, 26, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(102, 26, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(103, 26, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(104, 26, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(105, 27, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(106, 27, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(107, 27, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(108, 27, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(109, 28, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(110, 28, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(111, 28, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(112, 28, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(113, 29, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(114, 29, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:17', '2024-07-27 19:18:17'),
(115, 29, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(116, 29, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(117, 30, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(118, 30, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(119, 30, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(120, 30, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(121, 31, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(122, 31, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(123, 31, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(124, 31, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(125, 32, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(126, 32, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(127, 32, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(128, 32, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(129, 33, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(130, 33, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(131, 33, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(132, 33, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(133, 34, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(134, 34, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(135, 34, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(136, 34, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(137, 35, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(138, 35, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(139, 35, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(140, 35, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(141, 36, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(142, 36, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:18', '2024-07-27 19:18:18'),
(143, 36, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(144, 36, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(145, 37, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(146, 37, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(147, 37, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(148, 37, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(149, 38, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(150, 38, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(151, 38, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(152, 38, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(153, 39, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(154, 39, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(155, 39, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(156, 39, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(157, 40, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(158, 40, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(159, 40, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(160, 40, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(161, 41, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(162, 41, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(163, 41, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:19', '2024-07-27 19:18:19'),
(164, 41, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(165, 42, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(166, 42, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(167, 42, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(168, 42, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(169, 43, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(170, 43, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(171, 43, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(172, 43, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(173, 44, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(174, 44, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(175, 44, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(176, 44, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(177, 45, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(178, 45, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(179, 45, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(180, 45, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(181, 46, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(182, 46, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(183, 46, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(184, 46, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(185, 47, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(186, 47, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(187, 47, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(188, 47, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(189, 48, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(190, 48, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(191, 48, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(192, 48, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(193, 49, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(194, 49, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:20', '2024-07-27 19:18:20'),
(195, 49, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(196, 49, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(197, 50, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(198, 50, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(199, 50, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(200, 50, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(201, 51, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(202, 51, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(203, 51, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(204, 51, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(205, 52, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(206, 52, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(207, 52, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(208, 52, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(209, 53, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(210, 53, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(211, 53, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(212, 53, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(213, 54, 'P', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(214, 54, 'M', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(215, 54, 'G', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21'),
(216, 54, 'GG', 0, NULL, NULL, NULL, NULL, 0, NULL, '2024-07-27 19:18:21', '2024-07-27 19:18:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `slide_banners`
--

CREATE TABLE `slide_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description2` varchar(255) DEFAULT NULL,
  `image_url_mobile` varchar(255) DEFAULT NULL,
  `image_url_tablet` varchar(255) DEFAULT NULL,
  `image_url_laptop` varchar(255) DEFAULT NULL,
  `image_url_desktop` varchar(255) DEFAULT NULL,
  `logo_white` varchar(255) DEFAULT NULL,
  `logo_black` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `horizontal_alignment` enum('left','right','center') NOT NULL DEFAULT 'center',
  `vertical_alignment` enum('top','center','bottom') NOT NULL DEFAULT 'center',
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `description`, `image`, `action_user`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Roupas Esportivas', 'Academia,Pesca, Agricola, Ciclista, etc', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(2, 1, 'Roupas de Banho', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(3, 1, 'Roupas de Ocasião', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(4, 1, 'Roupas Íntimas e Pijamas', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(5, 1, 'Vestidos e Macacões', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(6, 1, 'Acessórios', 'Acessórios variados de moda', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15'),
(7, 1, 'Calçados', 'Calçados para todas as idades e gêneros', NULL, 'Criado por: Seeder em 2024-07-27 16:16:15', 0, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `subgroups`
--

CREATE TABLE `subgroups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action_user` text DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `subgroups`
--

INSERT INTO `subgroups` (`id`, `group_id`, `name`, `description`, `image`, `action_user`, `discontinued`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'UV50 ', '', NULL, 'Criado por: Seeder em 2024-07-27 16:16:16', 0, 0, '2024-07-27 19:16:16', '2024-07-27 19:16:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_type` enum('Fisica','Juridica') NOT NULL DEFAULT 'Fisica',
  `supplier_type_id` bigint(20) UNSIGNED NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `action_user` text DEFAULT NULL,
  `role` enum('admin','employee','customer','supplier','finance','sale') NOT NULL DEFAULT 'supplier',
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `user_id`, `person_type`, `supplier_type_id`, `document_number`, `identification_number`, `contact_name`, `email`, `whatsapp`, `phone`, `cep`, `city`, `uf`, `address`, `number`, `image`, `complement`, `neighborhood`, `action_user`, `role`, `discontinued`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Okuneva, Willms and Barton', 1, 'Fisica', 1, '68566791223', '8574765474', 'Gregory Kris', 'ciara10@example.com', '+15632966534', '+1-725-333-6323', '43601', 'Bradtkefort', 'MG', '84867 O\'Kon Gardens', '7047', NULL, 'Suite 566', 'Kuhn Prairie', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 0, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(2, 'Murazik, Smitham and Rippin', 3, 'Fisica', 1, '05304139577', '2756563461', 'Estefania Simonis', 'fahey.meggie@example.com', '+1-469-765-4861', '1-938-631-0767', '80872-9437', 'Faheybury', 'MG', '57216 Burley Estates', '4734', NULL, 'Apt. 451', 'Grady Rest', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 0, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(3, 'Dickens-Runolfsdottir', 3, 'Fisica', 1, '27821361780', '5871160845', 'Roy Heidenreich', 'eerdman@example.com', '1-629-214-8036', '901-669-0570', '77235-3720', 'Lake Katlyn', 'MG', '899 West Bridge', '53423', NULL, 'Apt. 804', 'Ed Dale', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 0, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(4, 'Wyman-Mayer', 4, 'Juridica', 1, '88475160595654', '8149954327', 'Donato Cartwright', 'jefferey27@example.net', '610.766.5064', '+1-480-910-9440', '29809-4331', 'Feltonmouth', 'MG', '44738 Metz Landing Suite 637', '861', NULL, 'Suite 282', 'Juwan Lights', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 1, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(5, 'Berge-Krajcik', 1, 'Juridica', 1, '79100633648601', '0732726972', 'Richard Rau', 'zfay@example.net', '(828) 297-0155', '+1-561-768-2625', '50081-3518', 'West Lavinaville', 'MG', '91342 Sven Parkway', '974', NULL, 'Suite 935', 'Marta Overpass', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 0, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(6, 'Rice-Huels', 1, 'Fisica', 1, '31869119746', '9296675514', 'Raven Crist', 'ykunde@example.com', '+15206639854', '1-562-934-6814', '84505', 'Melisastad', 'MG', '259 Swift Squares Suite 144', '780', NULL, 'Suite 316', 'Bednar Fields', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 1, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(7, 'Schiller-Olson', 1, 'Juridica', 1, '84426917146279', '1471680483', 'Danny Streich I', 'gerlach.lillie@example.com', '(434) 271-8306', '(573) 204-5936', '72030', 'Runolfssonside', 'MG', '9626 Nova Underpass', '449', NULL, 'Suite 282', 'Sporer Circles', 'Criado por: Seeder em 2024-07-27 16:16:19', 'supplier', 1, NULL, '2024-07-27 19:16:19', '2024-07-27 19:16:19'),
(8, 'Wisoky, Sauer and Waelchi', 1, 'Juridica', 1, '36397812875298', '2211941939', 'Estefania Moen', 'brock.kuhic@example.com', '+13607054698', '(352) 855-8939', '48209-6597', 'New Nettiestad', 'MG', '7276 Eleanora Stravenue', '652', NULL, 'Apt. 484', 'Spinka Via', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(9, 'Harvey-Kulas', 2, 'Fisica', 1, '80041617584', '7096636191', 'Emmalee Koelpin', 'iwolf@example.com', '(325) 378-2813', '786.598.7266', '63880', 'New Kirstenborough', 'MG', '35920 Arnulfo Freeway Suite 356', '94597', NULL, 'Apt. 614', 'Farrell Locks', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(10, 'Turner, Rolfson and Weimann', 1, 'Fisica', 1, '18913072661', '3086276828', 'Prof. Colton Braun II', 'willms.kaitlin@example.net', '+1-323-915-7562', '972-565-5309', '94869-2705', 'Laurenborough', 'MG', '65259 Arturo Expressway Suite 072', '6975', NULL, 'Apt. 085', 'Queen Motorway', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(11, 'Sipes LLC', 2, 'Juridica', 1, '70813880310396', '7324669237', 'George Welch IV', 'hoppe.jordi@example.net', '+19366949475', '+1-603-895-7841', '68800-5188', 'Millsfurt', 'MG', '112 Estrella Avenue Apt. 103', '12473', NULL, 'Suite 282', 'Koss Knolls', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(12, 'Shanahan, Reynolds and Boyle', 2, 'Juridica', 1, '57813494678872', '3193436912', 'Jana Beier', 'kianna05@example.net', '986-732-9927', '858-364-6399', '38645-5275', 'Lake Blanche', 'MG', '6785 Guy Key Suite 436', '345', NULL, 'Apt. 443', 'Powlowski Junctions', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(13, 'Konopelski and Sons', 3, 'Fisica', 1, '37561438303', '8262409809', 'Roslyn Schinner', 'okon.bonita@example.com', '980-666-3905', '+1-484-559-3680', '40308-2436', 'Willville', 'MG', '415 Hartmann Flat Apt. 980', '32618', NULL, 'Apt. 434', 'Greenholt Shores', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(14, 'Strosin, Rohan and Lockman', 4, 'Fisica', 1, '16151932781', '4400650993', 'Edgardo Hills Jr.', 'blake41@example.com', '224-642-8428', '+1-630-974-1766', '00201-8393', 'Kellieside', 'MG', '4569 Magdalena Stream', '42655', NULL, 'Apt. 559', 'Noelia Junctions', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(15, 'Rogahn, Tillman and Stracke', 4, 'Fisica', 1, '52824506156', '2252877078', 'Nadia Mayer', 'sthompson@example.net', '+15305554592', '+1-878-864-9364', '76633', 'West Marisatown', 'MG', '83394 Keeling Mountains', '999', NULL, 'Suite 138', 'Claire Land', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(16, 'Moen, Muller and McKenzie', 4, 'Fisica', 1, '77543170957', '3571313303', 'Brenna Koelpin', 'ybeer@example.org', '440.446.6862', '(832) 948-6852', '32154', 'Vellafurt', 'MG', '9716 King Field Suite 545', '8570', NULL, 'Apt. 784', 'Santos Lane', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(17, 'Kiehn-Turcotte', 1, 'Juridica', 1, '41547169306145', '2854718672', 'Julianne Weissnat', 'marina.lang@example.net', '1-669-418-4708', '1-650-972-9797', '23540-9976', 'Cormierfurt', 'MG', '770 Emmerich Loaf', '524', NULL, 'Apt. 727', 'Casper Lock', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(18, 'Paucek-Reilly', 3, 'Juridica', 1, '76848831254955', '2982389439', 'Melisa Boyle MD', 'deondre93@example.com', '219-415-2749', '1-540-529-7554', '54681', 'West Ezraside', 'MG', '5117 Demetrius Camp', '518', NULL, 'Apt. 831', 'Annamarie Falls', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(19, 'Denesik-Davis', 4, 'Juridica', 1, '97834439379541', '9723644672', 'Roger Dickinson', 'sbogan@example.net', '740.387.8252', '1-520-213-2797', '69707', 'Alyssonland', 'MG', '855 Auer Crossing', '600', NULL, 'Suite 603', 'Torp Course', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(20, 'Larkin-Cummerata', 1, 'Fisica', 1, '17363767211', '8906034048', 'Prof. Maxime Spinka Jr.', 'jaquelin.ullrich@example.org', '470-483-6686', '+17628749685', '94478', 'South Gennarotown', 'MG', '340 Willard Loaf', '94503', NULL, 'Apt. 208', 'Hadley Falls', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(21, 'Howe-Quitzon', 4, 'Juridica', 1, '66511021648902', '7559077928', 'Bartholome Medhurst', 'brianne24@example.com', '+1-878-655-0672', '(405) 492-2739', '53664', 'East Telly', 'MG', '81095 Rippin Villages', '287', NULL, 'Apt. 876', 'Brown Parks', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(22, 'Davis-Brakus', 1, 'Juridica', 1, '86694964964592', '5746859744', 'Mr. Brent Smitham', 'krystina.larkin@example.org', '562-432-6703', '+16406653454', '23838-7050', 'Wilburnstad', 'MG', '6187 Reid Road Apt. 400', '9834', NULL, 'Suite 267', 'Kuvalis Lights', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(23, 'Watsica-Hermann', 1, 'Fisica', 1, '16902773432', '9003135678', 'Odessa Howe', 'reichel.ebony@example.net', '606-819-6920', '+1 (513) 348-7199', '41463', 'South Erin', 'MG', '46730 Bernhard Trace Suite 268', '655', NULL, 'Suite 406', 'Daryl Pass', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(24, 'Jacobson Inc', 3, 'Juridica', 1, '14113966042900', '2230396426', 'Dr. Ariel Graham', 'pierre92@example.net', '719.246.8000', '270.801.6102', '94401-3771', 'Johannhaven', 'MG', '30427 Jaqueline Canyon Apt. 185', '2381', NULL, 'Apt. 417', 'Kuvalis Turnpike', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(25, 'Jast Group', 4, 'Fisica', 1, '01391745833', '1071652669', 'Miss Madelynn Kihn III', 'carmella.erdman@example.com', '(380) 251-6345', '1-862-590-9360', '38614-4514', 'Lake Clifton', 'MG', '1952 Shanel Island Suite 564', '34674', NULL, 'Apt. 802', 'Lucas Forge', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(26, 'Cummerata LLC', 1, 'Fisica', 1, '47425549220', '1239842669', 'Reinhold Murphy', 'lemuel50@example.net', '+1-240-336-9187', '1-419-789-5043', '19954-0696', 'Hesterport', 'MG', '29496 Fredrick Valley', '667', NULL, 'Apt. 637', 'Loy Garden', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(27, 'Koelpin, Cassin and Schaden', 2, 'Juridica', 1, '90369866946222', '4666489727', 'Oda Mosciski', 'burley.connelly@example.org', '+1-224-548-8688', '+17575597590', '11441-2302', 'North Othoton', 'MG', '9035 Oran Field Apt. 348', '8453', NULL, 'Suite 391', 'Walker Cove', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(28, 'King PLC', 2, 'Fisica', 1, '43644832307', '2454142438', 'Erika Sporer', 'lroberts@example.net', '334-759-0577', '+1-415-240-6647', '84208-4930', 'North Leif', 'MG', '56515 Lang Circle', '14174', NULL, 'Apt. 273', 'Audie Terrace', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(29, 'Bergstrom-Collins', 1, 'Juridica', 1, '13060631190338', '5270134327', 'Noel Welch', 'karolann58@example.net', '740.343.0122', '+1-754-612-4267', '39529', 'East Ericmouth', 'MG', '989 Elna Cliff', '4236', NULL, 'Apt. 775', 'Skiles Point', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(30, 'Farrell PLC', 2, 'Fisica', 1, '99139873420', '4709128313', 'Nat Bogisich', 'walter.marvin@example.org', '+1-602-348-8689', '914-634-1329', '96410-6809', 'Kunzemouth', 'MG', '820 Kenton Parkways', '1313', NULL, 'Apt. 316', 'Delta Villages', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 1, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(31, 'Cormier, Dietrich and Barton', 4, 'Fisica', 1, '49274439148', '1991526555', 'Mr. Emmet Bergstrom PhD', 'cummings.ona@example.org', '732.341.1938', '+1.725.481.9004', '51211-5407', 'Bruenland', 'MG', '304 Vada Track Suite 406', '9250', NULL, 'Apt. 097', 'Joaquin Manors', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(32, 'Shields-Wiza', 1, 'Fisica', 1, '79283711033', '7105732213', 'Nash McKenzie', 'hgaylord@example.net', '(830) 435-8355', '(864) 460-9872', '05784', 'West Mable', 'MG', '87656 Fadel Rapid Suite 653', '2444', NULL, 'Apt. 730', 'Robel Island', 'Criado por: Seeder em 2024-07-27 16:16:20', 'supplier', 0, NULL, '2024-07-27 19:16:20', '2024-07-27 19:16:20'),
(33, 'Luettgen PLC', 4, 'Juridica', 1, '95679582887900', '2809891593', 'Albert Auer Sr.', 'conn.vita@example.net', '+1.606.261.6628', '+17437309084', '44085', 'Medhurstville', 'MG', '4655 Emma Drive Apt. 443', '639', NULL, 'Suite 741', 'Patricia Rest', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(34, 'Cruickshank, Ferry and Durgan', 4, 'Fisica', 1, '62155122144', '5502866128', 'Norene Bruen', 'green.mae@example.com', '918-584-5164', '(689) 287-5519', '11024-2523', 'North Brookshaven', 'MG', '560 Judy Groves', '3543', NULL, 'Apt. 237', 'Samantha Stravenue', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(35, 'Johnson, Gaylord and Maggio', 3, 'Juridica', 1, '16414153292060', '0533809384', 'Miss Wendy Okuneva MD', 'maggio.misty@example.net', '+19848399208', '+1-786-389-8203', '57437-7680', 'New Luisa', 'MG', '58167 Jacobi Courts', '998', NULL, 'Apt. 318', 'Douglas Wall', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(36, 'White-Davis', 3, 'Juridica', 1, '44612264498811', '5617577675', 'Anika Cummerata', 'sherwood.skiles@example.com', '+18569568782', '+1 (814) 847-8420', '74222-4083', 'Albertastad', 'MG', '6712 Vella Spring Suite 668', '8422', NULL, 'Apt. 122', 'McClure Street', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(37, 'Orn, Braun and Hoeger', 4, 'Juridica', 1, '03212399858604', '5355341673', 'Palma Huel Sr.', 'jjacobi@example.net', '(804) 263-3447', '651-348-7303', '63863-3309', 'West Syble', 'MG', '5327 Domingo Knoll', '98796', NULL, 'Apt. 512', 'Maggio Manor', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(38, 'Kunde Group', 1, 'Fisica', 1, '42074041047', '9827692797', 'Bennie Jenkins', 'hrunolfsdottir@example.com', '434.666.2007', '+1 (662) 652-5313', '47206-8687', 'West Destinland', 'MG', '4899 West Ferry Apt. 602', '521', NULL, 'Suite 836', 'Jacinthe Ports', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(39, 'Lueilwitz LLC', 2, 'Juridica', 1, '54709662437341', '6748119499', 'Kaylie Hegmann', 'rosalyn.bergstrom@example.org', '1-539-722-5050', '+1.240.547.9316', '59328', 'South Vitoville', 'MG', '71607 Wilderman View Suite 714', '1909', NULL, 'Apt. 294', 'Helene Walk', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(40, 'Predovic, Christiansen and Green', 1, 'Juridica', 1, '38990075661381', '0533606266', 'Dr. Isidro Mann', 'haven90@example.net', '(934) 681-6849', '+12349376168', '79194-2492', 'Weimannview', 'MG', '7528 Larkin Flats', '4528', NULL, 'Suite 813', 'Ziemann Ranch', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(41, 'Vandervort-Schneider', 4, 'Fisica', 1, '43957515807', '3857169184', 'Jaiden Batz II', 'isaac62@example.com', '+1-475-575-0630', '+1-651-793-2545', '34973-6875', 'North Angel', 'MG', '2716 Trantow Pine Suite 158', '2896', NULL, 'Suite 803', 'Shields Station', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(42, 'Olson, Larkin and Torp', 2, 'Fisica', 1, '62864119250', '3862653614', 'Quinton O\'Keefe', 'qzboncak@example.net', '(251) 794-9197', '845-931-2308', '37336', 'West Ottis', 'MG', '55764 Kemmer Mount Suite 469', '30371', NULL, 'Apt. 666', 'Eliezer Cliffs', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(43, 'Stoltenberg, Moore and Swift', 3, 'Fisica', 1, '69373953613', '6683558386', 'Modesto Satterfield I', 'wgrady@example.com', '628.664.0891', '770-300-8416', '32636', 'Clementineville', 'MG', '23822 Stark Mission', '3595', NULL, 'Apt. 487', 'Freida Via', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(44, 'Hoppe-Barrows', 3, 'Juridica', 1, '06014192566248', '7165954353', 'Willis Volkman', 'pbednar@example.com', '+1-541-838-7455', '+1-618-820-5141', '12885-5268', 'Port Buckville', 'MG', '604 O\'Kon Via', '43663', NULL, 'Apt. 646', 'Edwin Corners', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(45, 'Runolfsdottir-Turcotte', 4, 'Juridica', 1, '51361869161295', '8346721311', 'Mr. Dedrick Koelpin DVM', 'erobel@example.net', '220.249.2375', '352-435-7356', '33700-7813', 'Port Maudieborough', 'MG', '159 Jena Walk', '3834', NULL, 'Apt. 948', 'Axel Meadow', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(46, 'McClure Group', 2, 'Fisica', 1, '66116323367', '1979778896', 'Wendy Halvorson', 'lura24@example.com', '+1.747.833.4791', '1-980-368-6347', '46701-5486', 'Millsstad', 'MG', '8084 Wiza Street', '34029', NULL, 'Apt. 270', 'Vicente Extension', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(47, 'Fahey, Spinka and Ryan', 1, 'Juridica', 1, '61287033945919', '6458478446', 'Javonte Schowalter', 'creinger@example.net', '(279) 575-1747', '812-900-1751', '98890-0675', 'Lake Tadchester', 'MG', '57835 Elsa Grove', '731', NULL, 'Suite 139', 'Bins Shoal', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(48, 'Ryan, Barrows and Kilback', 4, 'Juridica', 1, '61526056026569', '3623781472', 'Prof. Nigel Schumm DDS', 'keely.oreilly@example.net', '+14108629530', '+1.760.750.1405', '35267-3672', 'Port Kaycee', 'MG', '188 Pink Garden', '419', NULL, 'Suite 512', 'Marks Spring', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 0, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(49, 'Prosacco-Hagenes', 3, 'Juridica', 1, '02468610281807', '0888497661', 'Sincere Kiehn', 'cloyd45@example.org', '(920) 881-4188', '559.872.2478', '56996', 'South Lavonne', 'MG', '636 Winona Estates Suite 481', '4410', NULL, 'Apt. 844', 'Pfeffer View', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21'),
(50, 'White-Kunde', 2, 'Fisica', 1, '52410903711', '5940588805', 'Dr. Jack Rath III', 'soledad33@example.com', '+1.240.386.7763', '281.689.1650', '04106', 'Port Frederic', 'MG', '93565 Larry Harbors', '224', NULL, 'Suite 771', 'Danyka Curve', 'Criado por: Seeder em 2024-07-27 16:16:21', 'supplier', 1, NULL, '2024-07-27 19:16:21', '2024-07-27 19:16:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `supplier_types`
--

CREATE TABLE `supplier_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `supplier_types`
--

INSERT INTO `supplier_types` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Matéria-Prima', 'Fornecedores que fornecem matérias-primas ou componentes para a produção de produtos.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(2, 'Produtos Acabados', 'Fornecedores que fornecem produtos já acabados para revenda.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(3, 'Logística e Transporte', 'Fornecedores que lidam com transporte, logística, armazenamento ou frete.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(4, 'Tecnologia e Software', 'Fornecedores que oferecem soluções tecnológicas, como software, hardware ou serviços de TI.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(5, 'Serviços Profissionais', 'Fornecedores que oferecem serviços profissionais, como consultoria, design, contabilidade, entre outros.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(6, 'Equipamentos e Máquinas', 'Fornecedores que fornecem equipamentos e máquinas utilizados na produção ou operações.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(7, 'Alimentos e Bebidas', 'Fornecedores que fornecem produtos alimentícios, bebidas ou ingredientes.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(8, 'Saúde e Farmacêutico', 'Fornecedores na área de saúde, medicamentos, produtos farmacêuticos, equipamentos médicos, entre outros.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(9, 'Energia e Utilidades', 'Fornecedores relacionados à energia, como eletricidade, gás ou água.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(10, 'Móveis e Decoração', 'Fornecedores de móveis, decoração e itens relacionados.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(11, 'Vestuário e Têxtil', 'Fornecedores de roupas, tecidos e produtos têxteis.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(12, 'Construção e Materiais de Construção', 'Fornecedores de materiais de construção, ferramentas e equipamentos de construção.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(13, 'Agricultura e Agricultura', 'Fornecedores de produtos agrícolas, como sementes, fertilizantes, produtos químicos agrícolas, etc.', '2024-07-27 19:16:18', '2024-07-27 19:16:18'),
(14, 'Serviços Tributários e Fiscais', 'Profissionais e empresas que oferecem serviços de consultoria fiscal e assessoria tributária.', '2024-07-27 19:16:18', '2024-07-27 19:16:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','customer','finance','sale') NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `role`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Adjaime Naito', 'adjnaito@gmail.com', '2024-07-27 19:16:13', '$2y$12$MqnJrZ3nKbZUiVoa9M27WuyDx3cV9P.1EKGDzJIvCYGT4PVNpmzWK', NULL, NULL, NULL, 'admin', NULL, NULL, NULL, '2024-07-27 19:16:14', '2024-07-27 19:16:14'),
(2, 'User Customer', 'customer@example.com', '2024-07-27 19:16:14', '$2y$12$QYh59Asg8y0/ba5mPROk4ePTlbKcQrwEHoOGsiuVL63dox6QFmjdK', NULL, NULL, NULL, 'customer', NULL, NULL, NULL, '2024-07-27 19:16:14', '2024-07-27 19:16:14'),
(3, 'User Finance', 'finance@example.com', '2024-07-27 19:16:14', '$2y$12$szOvY3eYeV1cw2hodhTBDei0JQHOyOkVqXEQBGMq7TwxFCh9xdihS', NULL, NULL, NULL, 'finance', NULL, NULL, NULL, '2024-07-27 19:16:14', '2024-07-27 19:16:14'),
(4, 'User Sale', 'sale@example.com', '2024-07-27 19:16:15', '$2y$12$Y.dFQMv8/cGLCgIsbPG8JOXW2pX9Mb7RA0hSpKSsKTgtxmgc/g04q', NULL, NULL, NULL, 'sale', NULL, NULL, NULL, '2024-07-27 19:16:15', '2024-07-27 19:16:15');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`);

--
-- Índices de tabela `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Índices de tabela `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collections_name_unique` (`name`);

--
-- Índices de tabela `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_name_unique` (`name`);

--
-- Índices de tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- Índices de tabela `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_document_number_unique` (`document_number`),
  ADD UNIQUE KEY `customers_identification_number_unique` (`identification_number`),
  ADD KEY `customers_customer_type_id_foreign` (`customer_type_id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Índices de tabela `customer_types`
--
ALTER TABLE `customer_types`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_cpf_unique` (`cpf`),
  ADD UNIQUE KEY `employees_identification_number_unique` (`identification_number`),
  ADD KEY `employees_office_id_foreign` (`office_id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`),
  ADD KEY `groups_subcategory_id_foreign` (`subcategory_id`);

--
-- Índices de tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices de tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ncms`
--
ALTER TABLE `ncms`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `nfe_entradas`
--
ALTER TABLE `nfe_entradas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `nfe_impostos`
--
ALTER TABLE `nfe_impostos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nfe_impostos_nfe_item_id_foreign` (`nfe_item_id`);

--
-- Índices de tabela `nfe_items`
--
ALTER TABLE `nfe_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nfe_items_nfe_entrada_id_foreign` (`nfe_entrada_id`),
  ADD KEY `nfe_items_product_id_foreign` (`product_id`);

--
-- Índices de tabela `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offices_sector_id_foreign` (`sector_id`);

--
-- Índices de tabela `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partners_email_unique` (`email`);

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `products_group_id_foreign` (`group_id`),
  ADD KEY `products_subgroup_id_foreign` (`subgroup_id`),
  ADD KEY `products_collection_id_foreign` (`collection_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_color_id_foreign` (`color_id`);

--
-- Índices de tabela `product_fees`
--
ALTER TABLE `product_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_fees_product_id_foreign` (`product_id`);

--
-- Índices de tabela `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Índices de tabela `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_taxes_product_id_foreign` (`product_id`);

--
-- Índices de tabela `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `projects_tables`
--
ALTER TABLE `projects_tables`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices de tabela `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sizes_product_id_name_unique` (`product_id`,`name`);

--
-- Índices de tabela `slide_banners`
--
ALTER TABLE `slide_banners`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_name_unique` (`name`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Índices de tabela `subgroups`
--
ALTER TABLE `subgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subgroups_name_unique` (`name`),
  ADD KEY `subgroups_group_id_foreign` (`group_id`);

--
-- Índices de tabela `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_document_number_unique` (`document_number`),
  ADD UNIQUE KEY `suppliers_identification_number_unique` (`identification_number`),
  ADD KEY `suppliers_supplier_type_id_foreign` (`supplier_type_id`),
  ADD KEY `suppliers_user_id_foreign` (`user_id`);

--
-- Índices de tabela `supplier_types`
--
ALTER TABLE `supplier_types`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `customer_types`
--
ALTER TABLE `customer_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `ncms`
--
ALTER TABLE `ncms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nfe_entradas`
--
ALTER TABLE `nfe_entradas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `nfe_impostos`
--
ALTER TABLE `nfe_impostos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nfe_items`
--
ALTER TABLE `nfe_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT de tabela `offices`
--
ALTER TABLE `offices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `product_fees`
--
ALTER TABLE `product_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `projects_tables`
--
ALTER TABLE `projects_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT de tabela `slide_banners`
--
ALTER TABLE `slide_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `subgroups`
--
ALTER TABLE `subgroups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `supplier_types`
--
ALTER TABLE `supplier_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_customer_type_id_foreign` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Restrições para tabelas `nfe_impostos`
--
ALTER TABLE `nfe_impostos`
  ADD CONSTRAINT `nfe_impostos_nfe_item_id_foreign` FOREIGN KEY (`nfe_item_id`) REFERENCES `nfe_items` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `nfe_items`
--
ALTER TABLE `nfe_items`
  ADD CONSTRAINT `nfe_items_nfe_entrada_id_foreign` FOREIGN KEY (`nfe_entrada_id`) REFERENCES `nfe_entradas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nfe_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `offices`
--
ALTER TABLE `offices`
  ADD CONSTRAINT `offices_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  ADD CONSTRAINT `products_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `products_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`),
  ADD CONSTRAINT `products_subgroup_id_foreign` FOREIGN KEY (`subgroup_id`) REFERENCES `subgroups` (`id`);

--
-- Restrições para tabelas `product_fees`
--
ALTER TABLE `product_fees`
  ADD CONSTRAINT `product_fees_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD CONSTRAINT `product_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Restrições para tabelas `subgroups`
--
ALTER TABLE `subgroups`
  ADD CONSTRAINT `subgroups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Restrições para tabelas `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_supplier_type_id_foreign` FOREIGN KEY (`supplier_type_id`) REFERENCES `supplier_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `suppliers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
