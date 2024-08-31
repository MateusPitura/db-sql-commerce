<h1 align="center"> 
  <p>Commerce schema for MySQL</p> 
</h1> 

<p> 
  <img src="https://img.shields.io/badge/Release-Aug%202024-green">   
  <img src="https://img.shields.io/github/stars/MateusPitura/db-sql-commerce?style=social"> 
</p> 

> :checkered_flag: Este projeto está finalizado :checkered_flag:  

## Descrição 

Este repositório contém o dump de um banco de dados em MySQL com o schema de um comércio genérico

Você pode usá-lo para estudar a estrutura de dados de um projeto maior e como ponto de partida para seu próprio projeto

## Índice 

- [Funcionalidades](#funcionalidades) 
- [Como executar](#como-executar) 
- [Tecnologias usadas](#tecnologias-usadas) 
- [Autores](#autores) 

## Funcionalidades 

:earth_americas: **Genérico:** as tabelas podem receber dados de diversos negócios

:cloud: **Escalabilidade:** o projeto pode escalar para uma grande variedade de items

:mag_right: **Auditoria:** os dados possuem histórico completo permitindo auditoria

<p align="center">
  <img src="https://github.com/user-attachments/assets/a757310b-1076-4c46-b979-2e0bdc256ad4" width="100%"> 
</p> 

## Como executar 

**Para devs:**

git clone git@github.com:MateusPitura/db-sql-commerce.git dump

mysql -u <username> -p

CREATE DATABASE commerce;

exit

cd dump/

mysql -u <username> -p comemrce < commerce.sql

## Tecnologias usadas 

:heavy_check_mark: MySQL  

## Autores 

| Mateus Pitura | 
|------| 
| <p align="center"><img src="https://user-images.githubusercontent.com/119008106/227821967-fac62c31-0d62-485b-829e-ef56c033e21a.jpeg" width="100" height="100"></p> | 
| <a href="https://www.linkedin.com/in/mateuspitura/"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"> |
