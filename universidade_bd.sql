--------------------------------------------------------------------------------------------------------------------------------------
-- Utilizando o banco de dados MySQL, crie um script contendo os comandos DDL necessários para criar um banco de dados e suas tabelas.
--  O banco deverá ser chamado de “universidade-bd” e algumas das tabelas deste banco são as seguintes:
--
-- ALUNO: armazena os dados pessoais dos alunos (nome, cpf, endereço...)
--
-- PROFESSOR: armazena os dados dos professores da escola (nome, cpf, salário, carga horária...)
--
-- CURSO: armazena os dados dos cursos ofertados pela universidade.
--
-- MATRÍCULA: tabela que agrega as informações de alunos matriculados em determinados cursos.
--
-- a) Você deverá implementar obrigatoriamente estas três tabelas, porém ficará a seu critério a
-- definição dos atributos que cada tabela terá, e ainda poderá inserir mais tabelas desde que
-- continue de acordo com a temática da tarefa. Não se esqueça de definir corretamente os
-- relacionamentos entre as tabelas por meio da integridade referencial.
----------------------------------------------------------------------------------------------------

-----------------------------------------
--      CRIANDO O BANCO DE DADOS       --
-----------------------------------------

CREATE DATABASE IF NOT EXISTS universidade_bd
    DEFAULT CHARSET='utf8'
    DEFAULT COLLATE='utf8_general_ci';

-----------------------------------------
--    SELECIONANDO O BANCO DE DADOS    --
-----------------------------------------

USE universidade_bd;

------------------------------------
-- CRIANDO AS TABELAS NECESSÁRIAS --
------------------------------------

CREATE TABLE IF NOT EXISTS ALUNO (
    Matricula INT(12) UNSIGNED NOT NULL PRIMARY KEY UNIQUE,
    Nome VARCHAR(128) NOT NULL,
    CPF INT(11) NOT NULL UNIQUE,
    Endereco TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS PROFESSOR (
    Inscricao INT(12) UNSIGNED NOT NULL PRIMARY KEY UNIQUE,
    Nome VARCHAR(128) NOT NULL,
    CPF INT(11) NOT NULL UNIQUE,
    Salario INT(12) NOT NULL,
    Carga_Horaria INT(12) NOT NULL
);

CREATE TABLE IF NOT EXISTS CURSO (
    Codigo INT(12) UNSIGNED NOT NULL PRIMARY KEY,
    Nome VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS MATRICULA (
    id INT(12) AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Matricula_aluno INT(12) NOT NULL,
    Codigo_Curso INT(12) NOT NULL
);

-----------------------------------------------
--  ADICIONANDO RESTRIÇÕES E RELACIONAMENTOS --
--             COM FOREIGN KEYS              --
-----------------------------------------------

ALTER TABLE MATRICULA 
    ADD FOREIGN KEY (Matricula_Aluno)
    REFERENCES ALUNO (MATRICULA)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE MATRICULA
    ADD FOREIGN KEY (Codigo_Curso)
    REFERENCES CURSO (Codigo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

------------------------------------------------
-- DEFININDO CONFIGURAÇÕES DE BANCO DE DADOS  --
--           E COMPORTAMENTO PADRÃO           --
------------------------------------------------

SET FOREIGN_KEY_CHECKS=1
SET AUTO_INCREMENT=1
