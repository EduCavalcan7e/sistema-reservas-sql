# Sistema de Reservas de Laboratórios 🖥️

Modelo de banco de dados relacional desenvolvido para gerenciar o agendamento de laboratórios de informática em uma escola técnica.

## 🛠️ Tecnologias Utilizadas
* **SQL:** DDL (Criação) e DML (Manipulação)
* **Mermaid:** Modelagem de Entidade-Relacionamento (DER)

## 📋 Funcionalidades do Banco
* Cadastro de Professores e Laboratórios.
* Controle de grades horárias e períodos letivos.
* **Sistema de Reservas:** Tabela associativa que vincula *Quem*, *Onde*, *O Que* e *Quando*.
* Prevenção de conflitos de horário (lógica de negócio).

## 🚀 Como testar
1. Baixe o arquivo `database.sql`.
2. Importe em seu SGBD favorito (MySQL Workbench, DBeaver, etc).
3. Execute as consultas de exemplo incluídas no script.
