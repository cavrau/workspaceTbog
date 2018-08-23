-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2018 at 02:56 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_gondria`
--
CREATE DATABASE `bd_gondria`;
USE `bd_gondria`;
-- --------------------------------------------------------

--
-- Table structure for table `consultas_mensais`
--

CREATE TABLE `consultas_mensais` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id do mês que aconteceram as consultas',
  `mes` tinyint(2) UNSIGNED NOT NULL COMMENT 'Armazena o mês em que ocorreram as consukltas inserindo o primeiro dia daql mês',
  `ano` int(4) UNSIGNED NOT NULL COMMENT 'Armazena o ano do relatorio feito',
  `numero_visitas` int(10) UNSIGNED NOT NULL COMMENT 'Armazena o número de visitas realizadas naquele mês',
  `numero_cadastros` int(10) UNSIGNED NOT NULL COMMENT 'Armazena a quantidade de pessoas cadastradas em um mes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela que armazena os dados necessários para se ter uma idéia das consultas mensais realizadas no site';

--
-- Dumping data for table `consultas_mensais`
--

INSERT INTO `consultas_mensais` (`id`, `mes`, `ano`, `numero_visitas`, `numero_cadastros`) VALUES
(43, 8, 2018, 6, 4),
(44, 7, 2018, 10, 5),
(45, 6, 2018, 16, 7),
(46, 5, 2018, 12, 6),
(47, 4, 2018, 5, 8),
(48, 3, 2018, 5, 6),
(54, 1, 2018, 7, 5),
(55, 2, 2018, 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pontuacoes`
--

CREATE TABLE `pontuacoes` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Armazena o id da pontuação cadastrada',
  `tempo` time NOT NULL COMMENT 'Armazena o tempo em que a fase foi concluida',
  `pontuacao` smallint(5) UNSIGNED NOT NULL COMMENT 'Armazena a pontuação total atingida na fase',
  `fase` tinyint(1) UNSIGNED NOT NULL COMMENT 'Armazena a fase em que a pontuação foi atngida',
  `usuarios_id` int(10) UNSIGNED NOT NULL COMMENT 'Armazena o id do usuário que atingiu a pontuação'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela que armazena as pontuações alcançadas pelos jogadores nas fases ';

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Armazena o id de cada usuário cadastrado',
  `nome` varchar(45) NOT NULL COMMENT 'Armazena o nome do usuário cadastrado',
  `apelido` varchar(16) NOT NULL COMMENT 'Armazena o nome de jogador/nick do usuário cadastrado',
  `data_nascimento` date NOT NULL COMMENT 'Armazena a data d enascimento do usuário cadastrado',
  `email` varchar(80) NOT NULL COMMENT 'Armazena o e-mail do usuário cadastrado\n',
  `senha` char(32) NOT NULL COMMENT 'Armazena a senha do usuário cadastrado',
  `data_cadastro` date NOT NULL COMMENT 'Armazena a data em que o usuário foi cadastrado',
  `permissao` tinyint(1) UNSIGNED NOT NULL COMMENT 'Armazena a permissão do usuário : 0 para jogador 1 para ADM',
  `ultimo_login` date DEFAULT NULL COMMENT 'Armazena a data de ultimo login do usuário'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela que armazena os cadastros de cada usuário';

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `apelido`, `data_nascimento`, `email`, `senha`, `data_cadastro`, `permissao`, `ultimo_login`) VALUES
(6, 'Eduardo', 'eduaugustus', '2000-08-07', 'eduaugustocardozo@gmail.com', '25A63380FB53D3B5310B7B6870F23CD9', '2018-07-08', 0, '2018-08-13'),
(9, 'eduardo augusto', 'user', '2018-08-07', 'edu@gmail.comm', '25A63380FB53D3B5310B7B6870F23CD9', '2018-08-09', 0, '2018-08-13'),
(10, 'admin', 'adminTop', '2018-08-07', 'admin@gmail.com', '25A63380FB53D3B5310B7B6870F23CD9', '2018-08-13', 1, '2018-08-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultas_mensais`
--
ALTER TABLE `consultas_mensais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pontuacoes`
--
ALTER TABLE `pontuacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pontuacoes_Usuarios` (`usuarios_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apelido` (`apelido`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consultas_mensais`
--
ALTER TABLE `consultas_mensais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id do mês que aconteceram as consultas', AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `pontuacoes`
--
ALTER TABLE `pontuacoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Armazena o id da pontuação cadastrada';

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Armazena o id de cada usuário cadastrado', AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pontuacoes`
--
ALTER TABLE `pontuacoes`
  ADD CONSTRAINT `fk_pontuacoes_Usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
