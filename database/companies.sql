-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/07/2024 às 14:12
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
(1, 'Naifer', 'Adjaime Naito', 'Descrição: Uma mensagem direcionada aos clientes que destaca a disponibilidade e prontidão da empresa em fornecer suporte técnico e assistência com produtos. Por exemplo, Estamos prontos para ajudar com suas necessidades de impressoras e balanças. Entre em contato conosco para suporte técnico, informações sobre produtos ou qualquer outra dúvida.', 'Descrição: Um texto detalhado que descreve a empresa, sua história, produtos e serviços oferecidos. Esse campo deve proporcionar uma visão geral clara e abrangente sobre o que a empresa faz e quais são suas principais áreas de atuação.', 'Descrição: Uma frase curta e memorável que captura a essência da empresa e seu valor único. O slogan deve ser cativante e refletir a identidade da marca. Por exemplo, Tecnologia que transforma.', 'Descrição: A declaração de missão da empresa, que descreve o propósito fundamental e a razão de ser da empresa. Deve explicar de forma clara e concisa o que a empresa busca alcançar e como pretende impactar positivamente seus clientes e a sociedade.', 'Descrição: A declaração de missão da empresa, que descreve o propósito fundamental e a razão de ser da empresa. Deve explicar de forma clara e concisa o que a empresa busca alcançar e como pretende impactar positivamente seus clientes e a sociedade.', 'Descrição: A visão da empresa, que projeta o futuro desejado pela empresa. Deve ser uma declaração inspiradora que define onde a empresa quer estar em um determinado período de tempo e o impacto que deseja causar no mercado e na sociedade.', 'Descrição: Uma lista de princípios e crenças fundamentais que guiam as ações e decisões da empresa. Estes valores devem refletir a cultura da empresa e os padrões éticos pelos quais a empresa opera. Por exemplo, integridade, inovação, respeito ao cliente, responsabilidade social, etc.', '', 'company/1/Naifer_image_about_right_202407301210.jpg', 'Temos', '12', 'anos de experiência', 'lojanaifer@gmail.com', 'lojanaifer.com.br', '(38) 99753-4565', '(38) 99753-4565', 'https://facebook.com/lojanaifer', 'https://twitter.com/lojanaifer', 'https://tiktok.com/@lojanaifer', 'https://instagram', '38616048', 'Unaí', 'MG', 'Rua Júlio Borges', '61', 'Apto 103', 'Barroca', '-16.3681', '-46.8986', '13', 'images/favicon.png', 'images/logo_light_1722340993.svg', 'images/logo_dark_1722341001.svg', 'company/images/default.png', 'Por que a Calibração da Balança é Importante?', 'https://www.mt.com/br/pt/home/library/FAQ/laboratory-weighing/Balance-Scale-Service-Calibration.html#:~:text=Utilizar%20equipamentos%20calibrados%20garante%20que,Conformidade.', 'company/1/Naifer_image_footer_botton_202407301210.jpg', 'Para que serve uma impressora térmica?', 'https://www.controlid.com.br/blog/automacao-comercial/impressora-termica', 0, NULL, '2024-07-30 14:38:23', '2024-07-30 15:10:48');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
