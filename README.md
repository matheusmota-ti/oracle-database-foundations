# Oracle Baseball League (OBL) — Projeto de Banco de Dados

Projeto de modelagem de banco de dados para a loja fictícia **Oracle Baseball League (OBL)**, desenvolvido a partir do enunciado do projeto.

## Objetivo

Modelar clientes individuais e equipes que compram artigos de beisebol, registrar pedidos e itens vendidos, aplicar descontos para equipes conforme o número de jogadores e registrar reclamações atendidas por representantes de vendas.

## Estrutura do repositório

- `docs/DER.md` — diagrama Entidade-Relacionamento em Mermaid.
- `sql/01_schema.sql` — criação das tabelas, chaves e restrições para Oracle Database.
- `sql/02_dados_exemplo.sql` — dados fictícios para testar o modelo.
- `sql/03_consultas.sql` — consultas SQL demonstrativas.
- `docs/decisoes_modelagem.md` — regras e decisões adotadas.

## Como executar

1. Abra o Oracle SQL Developer ou outro cliente compatível com Oracle Database.
2. Execute `sql/01_schema.sql`.
3. Execute `sql/02_dados_exemplo.sql`.
4. Execute as consultas de `sql/03_consultas.sql`.

> Execute os arquivos na ordem indicada. O script de criação usa nomes de tabelas próprios deste projeto; se você já tiver tabelas com esses nomes no seu esquema, remova-as ou use outro esquema de teste.

## Regras modeladas

- Um cliente pode ser individual ou representar uma equipe ao fazer um pedido.
- Uma equipe pode ter vários pedidos e o desconto é definido a partir da quantidade de jogadores.
- Cada pedido pertence a um cliente e pode estar associado a uma equipe e a um representante de vendas.
- Um pedido possui um ou mais itens; cada item do pedido registra quantidade e preço praticado no momento da venda.
- O estoque mantém o preço de lista e a quantidade disponível.
- Reclamações registram o cliente, o representante responsável, a data e a descrição.

## Observação

O enunciado não fornece todas as regras de negócio detalhadas (por exemplo, faixas exatas de desconto). Por isso, o modelo guarda a quantidade de jogadores e a taxa de desconto na equipe, permitindo que a regra seja definida pela loja. Os dados de exemplo são fictícios.
