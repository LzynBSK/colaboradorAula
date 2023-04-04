-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 04-Abr-2023 às 13:35
-- Versão do servidor: 8.0.27
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_rifa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE IF NOT EXISTS `colaborador` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_Usuario_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `saque` int UNSIGNED DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Colaborador_2` (`fk_Usuario_id`),
  KEY `FK_Colaborador_3` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

DROP TABLE IF EXISTS `imagens`;
CREATE TABLE IF NOT EXISTS `imagens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `link_img` varchar(200) DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Imagens_1` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `numero`
--

DROP TABLE IF EXISTS `numero`;
CREATE TABLE IF NOT EXISTS `numero` (
  `numero` int UNSIGNED NOT NULL,
  `fk_Rifa_id` bigint UNSIGNED NOT NULL,
  `fk_Pedido_id` bigint UNSIGNED DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero`,`fk_Rifa_id`),
  KEY `FK_Numero_1` (`fk_Pedido_id`),
  KEY `FK_Numero_2` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` bigint UNSIGNED NOT NULL,
  `fk_Usuario_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `valor` double UNSIGNED DEFAULT NULL,
  `status` int UNSIGNED DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Pedido_2` (`fk_Usuario_id`),
  KEY `FK_Pedido_3` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_colaborador`
--

DROP TABLE IF EXISTS `pedido_colaborador`;
CREATE TABLE IF NOT EXISTS `pedido_colaborador` (
  `fk_Colaborador_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Pedido_id` bigint UNSIGNED DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Pedido_Colaborador_1` (`fk_Colaborador_id`),
  KEY `FK_Pedido_Colaborador_2` (`fk_Pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rifa`
--

DROP TABLE IF EXISTS `rifa`;
CREATE TABLE IF NOT EXISTS `rifa` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `quant_num` int UNSIGNED DEFAULT NULL,
  `valor` double UNSIGNED DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `tempo_reserva` int UNSIGNED DEFAULT NULL,
  `fk_Usuario_id` bigint UNSIGNED DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Rifa_2` (`fk_Usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rifa_tags`
--

DROP TABLE IF EXISTS `rifa_tags`;
CREATE TABLE IF NOT EXISTS `rifa_tags` (
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Tags_id` int UNSIGNED DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Rifa_Tags_1` (`fk_Rifa_id`),
  KEY `FK_Rifa_Tags_2` (`fk_Tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `tel` varchar(200) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cpf` bigint DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senha`, `nome`, `foto`, `tel`, `endereco`, `cpf`, `creation_time`, `modification_time`) VALUES
(1, 'joao@example.com', '123456', 'João da Silva', 'foto1.jpg', '(11) 9999-9999', 'Rua A, 123', 12345678900, '2023-03-31 11:04:59', NULL),
(2, 'maria@example.com', 'abcdef', 'Maria Souza', 'foto2.jpg', '(11) 8888-8888', 'Avenida B, 456', 98765432100, '2023-03-31 11:04:59', NULL),
(3, 'pedro@example.com', 'qwerty', 'Pedro Pereira', 'foto3.jpg', '(11) 7777-7777', 'Rua C, 789', 13579086420, '2023-03-31 11:04:59', NULL),
(4, 'ana@example.com', 'abc123', 'Ana Santos', 'foto4.jpg', '(11) 6666-6666', 'Avenida D, 1010', 24681012140, '2023-03-31 11:04:59', NULL),
(5, 'carlos@example.com', '123abc', 'Carlos Silva', 'foto5.jpg', '(11) 5555-5555', 'Rua E, 1111', 98765432190, '2023-03-31 11:04:59', NULL),
(6, 'marta@example.com', 'marta123', 'Marta Pereira', 'foto6.jpg', '(11) 4444-4444', 'Avenida F, 1212', 13579086400, '2023-03-31 11:04:59', NULL),
(7, 'roberto@example.com', 'roberto456', 'Roberto Souza', 'foto7.jpg', '(11) 3333-3333', 'Rua G, 2222', 86420854000, '2023-03-31 11:04:59', NULL),
(8, 'lucia@example.com', 'lucia789', 'Lucia Silva', 'foto8.jpg', '(11) 2222-2222', 'Avenida H, 3333', 12345678999, '2023-03-31 11:04:59', NULL),
(9, 'jose@example.com', 'jose1010', 'Jose Santos', 'foto9.jpg', '(11) 1111-1111', 'Rua I, 4444', 24681012190, '2023-03-31 11:04:59', NULL),
(10, 'marina@example.com', 'marina123', 'Marina Pereira', 'foto10.jpg', '(11) 0000-0000', 'Avenida J, 5555', 13579086490, '2023-03-31 11:04:59', NULL),
(11, 'ana2@example.com', 'ana123', 'Ana Souza', 'foto11.jpg', '(11) 9999-8888', 'Rua K, 6666', 98765432110, '2023-03-31 11:04:59', NULL),
(12, 'carlos2@example.com', 'carlos456', 'Carlos Santos', 'foto12.jpg', '(11) 8888-7777', 'Avenida L, 7777', 13579086460, '2023-03-31 11:04:59', NULL),
(13, 'marta2@example.com', 'marta456', 'Marta Silva', 'foto13.jpg', '(11) 7777-6666', 'Rua M, 8888', 24681012160, '2023-03-31 11:04:59', NULL),
(14, 'roberto2@example.com', 'roberto789', 'Roberto Santos', 'foto14.jpg', '(11) 6666-5555', 'Avenida N, 9999', 98765432120, '2023-03-31 11:04:59', NULL),
(15, 'lucia2@example.com', 'lucia1010', 'Lucia Pereira', 'foto15.jpg', '(11) 5555-4444', 'Rua O, 1010', 13579086430, '2023-03-31 11:04:59', NULL);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `colaborador`
--
ALTER TABLE `colaborador`
  ADD CONSTRAINT `FK_Colaborador_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_Colaborador_3` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `imagens`
--
ALTER TABLE `imagens`
  ADD CONSTRAINT `FK_Imagens_1` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `numero`
--
ALTER TABLE `numero`
  ADD CONSTRAINT `FK_Numero_1` FOREIGN KEY (`fk_Pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `FK_Numero_2` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_Pedido_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_Pedido_3` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `pedido_colaborador`
--
ALTER TABLE `pedido_colaborador`
  ADD CONSTRAINT `FK_Pedido_Colaborador_1` FOREIGN KEY (`fk_Colaborador_id`) REFERENCES `colaborador` (`id`),
  ADD CONSTRAINT `FK_Pedido_Colaborador_2` FOREIGN KEY (`fk_Pedido_id`) REFERENCES `pedido` (`id`);

--
-- Limitadores para a tabela `rifa`
--
ALTER TABLE `rifa`
  ADD CONSTRAINT `FK_Rifa_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `rifa_tags`
--
ALTER TABLE `rifa_tags`
  ADD CONSTRAINT `FK_Rifa_Tags_1` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`),
  ADD CONSTRAINT `FK_Rifa_Tags_2` FOREIGN KEY (`fk_Tags_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
