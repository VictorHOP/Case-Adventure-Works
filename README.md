# Projeto de Modelagem de Dados com DBT

Este projeto DBT foi desenvolvido para modelar e transformar os dados da Adventure Works. O objetivo principal é criar camadas de dados organizadas e otimizadas para análises no BI, permitindo insights de vendas, marketing e operações.

O projeto utiliza as melhores práticas de engenharia de dados, com foco em desempenho e manutenção.

## Objetivos
- Organizar dados brutos em modelos fáceis de usar e consistentes para análises.
- Criar camadas de dados (staging e mart) para suportar dashboards de BI.
- Automatizar transformações para garantir escalabilidade e reprodutibilidade.

### Principais Arquivos
- `dbt_project.yml`: Configuração principal do DBT.
- `models/`: Diretório com os modelos SQL organizados por camadas.
- `seeds/`: Dados estáticos usados no projeto.

## Requisitos
Certifique-se de ter as seguintes ferramentas instaladas:
- DBT CLI (`pip install dbt-core` ou equivalente).
- Conexão configurada para o banco de dados Snowflake.
- Acesso ao ambiente de execução (local ou remoto).

## Como Executar

1. Configure o arquivo `profiles.yml` com as credenciais do banco de dados.
2. Execute os seguintes comandos:

- Para compilar os modelos:
  ```bash
  dbt compile
- Para rodar os modelos
  ```bash
  dbt run
- Para rodar os testes
  ```bash
  dbt test

## Contato
Criado por Victor Hugo - victorhugo.op@outlook.com

Para dúvidas ou sugestões, entre em contato!
