-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: commerce
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caracteristica`
--

DROP TABLE IF EXISTS `caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristica` (
  `id_caracteristica` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  UNIQUE KEY `id_caracteristica` (`id_caracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica`
--

LOCK TABLES `caracteristica` WRITE;
/*!40000 ALTER TABLE `caracteristica` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristica_valores`
--

DROP TABLE IF EXISTS `caracteristica_valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristica_valores` (
  `id_caracteristica_valores` int NOT NULL AUTO_INCREMENT,
  `id_caracteristica` int DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica_valores`),
  UNIQUE KEY `id_caracteristica_valores` (`id_caracteristica_valores`),
  KEY `id_caracteristica` (`id_caracteristica`),
  CONSTRAINT `caracteristica_valores_ibfk_1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristica` (`id_caracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica_valores`
--

LOCK TABLES `caracteristica_valores` WRITE;
/*!40000 ALTER TABLE `caracteristica_valores` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristica_valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `id_cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_permissao`
--

DROP TABLE IF EXISTS `cargo_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_permissao` (
  `id_cargo` int NOT NULL,
  `id_permissao` int NOT NULL,
  PRIMARY KEY (`id_cargo`,`id_permissao`),
  KEY `id_permissao` (`id_permissao`),
  CONSTRAINT `cargo_permissao_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `cargo_permissao_ibfk_2` FOREIGN KEY (`id_permissao`) REFERENCES `permissao` (`id_permissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_permissao`
--

LOCK TABLES `cargo_permissao` WRITE;
/*!40000 ALTER TABLE `cargo_permissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `nota_fiscal` varchar(255) DEFAULT NULL,
  `data_solicitacao` datetime DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  `status_vigente` int DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  UNIQUE KEY `id_compra` (`id_compra`),
  UNIQUE KEY `nota_fiscal` (`nota_fiscal`),
  KEY `id_fornecedor` (`id_fornecedor`),
  KEY `status_vigente` (`status_vigente`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`status_vigente`) REFERENCES `status_compra` (`id_status_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_status_compra`
--

DROP TABLE IF EXISTS `compra_status_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_status_compra` (
  `id_compra` int DEFAULT NULL,
  `id_status_compra` int DEFAULT NULL,
  `datetime_atualizacao` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  KEY `id_compra` (`id_compra`),
  KEY `id_status_compra` (`id_status_compra`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `compra_status_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `compra_status_compra_ibfk_2` FOREIGN KEY (`id_status_compra`) REFERENCES `status_compra` (`id_status_compra`),
  CONSTRAINT `compra_status_compra_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_status_compra`
--

LOCK TABLES `compra_status_compra` WRITE;
/*!40000 ALTER TABLE `compra_status_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_status_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `id_email` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  PRIMARY KEY (`id_email`),
  UNIQUE KEY `id_email` (`id_email`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(255) DEFAULT NULL,
  `numero_casa` int DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  UNIQUE KEY `id_endereco` (`id_endereco`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `prazo_entrega` datetime DEFAULT NULL,
  `entrega_efetuada` datetime DEFAULT NULL,
  PRIMARY KEY (`id_entrega`),
  UNIQUE KEY `id_entrega` (`id_entrega`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `id_fornecedor` (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_produto`
--

DROP TABLE IF EXISTS `fornecedor_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_produto` (
  `id_fornecedor` int NOT NULL,
  `id_produto` int NOT NULL,
  PRIMARY KEY (`id_fornecedor`,`id_produto`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `fornecedor_produto_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `fornecedor_produto_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_produto`
--

LOCK TABLES `fornecedor_produto` WRITE;
/*!40000 ALTER TABLE `fornecedor_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `id_marca` (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissao` (
  `id_permissao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_permissao`),
  UNIQUE KEY `id_permissao` (`id_permissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `id_marca` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `id_produto` (`id_produto`),
  KEY `id_marca` (`id_marca`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_categoria`
--

DROP TABLE IF EXISTS `produto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_categoria` (
  `id_produto` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_produto`,`id_categoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produto_categoria_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `produto_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_categoria`
--

LOCK TABLES `produto_categoria` WRITE;
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_unitario`
--

DROP TABLE IF EXISTS `produto_unitario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_unitario` (
  `id_produto_unitario` int NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) DEFAULT NULL,
  `id_entrega` int DEFAULT NULL,
  `id_variante` int DEFAULT NULL,
  `id_venda` int DEFAULT NULL,
  `status_vigente` int DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  `preco_compra` float DEFAULT NULL,
  `fim_garantia` datetime DEFAULT NULL,
  PRIMARY KEY (`id_produto_unitario`),
  UNIQUE KEY `id_produto_unitario` (`id_produto_unitario`),
  UNIQUE KEY `serial_number` (`serial_number`),
  KEY `id_entrega` (`id_entrega`),
  KEY `id_variante` (`id_variante`),
  KEY `id_venda` (`id_venda`),
  KEY `status_vigente` (`status_vigente`),
  CONSTRAINT `produto_unitario_ibfk_1` FOREIGN KEY (`id_entrega`) REFERENCES `entrega` (`id_entrega`),
  CONSTRAINT `produto_unitario_ibfk_2` FOREIGN KEY (`id_variante`) REFERENCES `variante` (`id_variante`),
  CONSTRAINT `produto_unitario_ibfk_3` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`),
  CONSTRAINT `produto_unitario_ibfk_4` FOREIGN KEY (`status_vigente`) REFERENCES `status_produto_unitario` (`id_status_produto_unitario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unitario`
--

LOCK TABLES `produto_unitario` WRITE;
/*!40000 ALTER TABLE `produto_unitario` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_unitario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_compra`
--

DROP TABLE IF EXISTS `status_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_compra` (
  `id_status_compra` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_status_compra`),
  UNIQUE KEY `id_status_compra` (`id_status_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_compra`
--

LOCK TABLES `status_compra` WRITE;
/*!40000 ALTER TABLE `status_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_produto_unitario`
--

DROP TABLE IF EXISTS `status_produto_unitario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_produto_unitario` (
  `id_status_produto_unitario` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_status_produto_unitario`),
  UNIQUE KEY `id_status_produto_unitario` (`id_status_produto_unitario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_produto_unitario`
--

LOCK TABLES `status_produto_unitario` WRITE;
/*!40000 ALTER TABLE `status_produto_unitario` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_produto_unitario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_produto_unitario_status`
--

DROP TABLE IF EXISTS `status_produto_unitario_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_produto_unitario_status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `id_pruduto_unitario_status` int DEFAULT NULL,
  `datetime_atualizacao` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `id_status` (`id_status`),
  KEY `id_pruduto_unitario_status` (`id_pruduto_unitario_status`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `status_produto_unitario_status_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status_produto_unitario` (`id_status_produto_unitario`),
  CONSTRAINT `status_produto_unitario_status_ibfk_2` FOREIGN KEY (`id_pruduto_unitario_status`) REFERENCES `produto_unitario` (`id_produto_unitario`),
  CONSTRAINT `status_produto_unitario_status_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_produto_unitario_status`
--

LOCK TABLES `status_produto_unitario_status` WRITE;
/*!40000 ALTER TABLE `status_produto_unitario_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_produto_unitario_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_venda`
--

DROP TABLE IF EXISTS `status_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_venda` (
  `id_status_venda` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_status_venda`),
  UNIQUE KEY `id_status_venda` (`id_status_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_venda`
--

LOCK TABLES `status_venda` WRITE;
/*!40000 ALTER TABLE `status_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id_telefone` int NOT NULL AUTO_INCREMENT,
  `telefone` varchar(255) DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  PRIMARY KEY (`id_telefone`),
  UNIQUE KEY `id_telefone` (`id_telefone`),
  UNIQUE KEY `telefone` (`telefone`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_cargo` int DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante`
--

DROP TABLE IF EXISTS `variante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante` (
  `id_variante` int NOT NULL AUTO_INCREMENT,
  `id_produto` int DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `garantia_dias` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_variante`),
  UNIQUE KEY `id_variante` (`id_variante`),
  KEY `id_produto` (`id_produto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `variante_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `variante_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante`
--

LOCK TABLES `variante` WRITE;
/*!40000 ALTER TABLE `variante` DISABLE KEYS */;
/*!40000 ALTER TABLE `variante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante_caracteristicas_valores`
--

DROP TABLE IF EXISTS `variante_caracteristicas_valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante_caracteristicas_valores` (
  `id_variante` int NOT NULL,
  `id_caracteristica_valores` int NOT NULL,
  PRIMARY KEY (`id_variante`,`id_caracteristica_valores`),
  KEY `id_caracteristica_valores` (`id_caracteristica_valores`),
  CONSTRAINT `variante_caracteristicas_valores_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `variante` (`id_variante`),
  CONSTRAINT `variante_caracteristicas_valores_ibfk_2` FOREIGN KEY (`id_caracteristica_valores`) REFERENCES `caracteristica_valores` (`id_caracteristica_valores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante_caracteristicas_valores`
--

LOCK TABLES `variante_caracteristicas_valores` WRITE;
/*!40000 ALTER TABLE `variante_caracteristicas_valores` DISABLE KEYS */;
/*!40000 ALTER TABLE `variante_caracteristicas_valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `nota_fiscal` varchar(255) DEFAULT NULL,
  `data_venda` datetime DEFAULT NULL,
  `status_vigente` int DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  UNIQUE KEY `id_venda` (`id_venda`),
  KEY `status_vigente` (`status_vigente`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`status_vigente`) REFERENCES `status_venda` (`id_status_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_status_venda`
--

DROP TABLE IF EXISTS `venda_status_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_status_venda` (
  `id_status` int DEFAULT NULL,
  `id_status_venda` int DEFAULT NULL,
  `datetime_atualizacao` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  KEY `id_status` (`id_status`),
  KEY `id_status_venda` (`id_status_venda`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `venda_status_venda_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `venda` (`id_venda`),
  CONSTRAINT `venda_status_venda_ibfk_2` FOREIGN KEY (`id_status_venda`) REFERENCES `status_venda` (`id_status_venda`),
  CONSTRAINT `venda_status_venda_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_status_venda`
--

LOCK TABLES `venda_status_venda` WRITE;
/*!40000 ALTER TABLE `venda_status_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_status_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-31 12:16:17
