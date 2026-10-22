# OBL — Oracle Baseball League
Projeto acadêmico de modelagem de banco de dados relacional para uma loja de artigos de beisebol.

## Objetivo
Transformar o modelo conceitual fornecido no enunciado em um mapeamento lógico/físico, documentar tabelas, chaves, nulabilidade e tipos Oracle, e disponibilizar um script SQL para criação do esquema.

## Estrutura do repositório
```text
obl-baseball-league/
├── README.md
├── .gitignore
├── docs/
│   ├── modelo-e-regras.md
│   └── dicionario-de-dados.md
├── data-dictionary/
│   └── mapeamento-tabelas.csv
├── diagrams/
│   └── modelo-relacional.mmd
└── sql/
    └── 01_create_schema.sql
```

## Entidades implementadas
- `customers`: clientes individuais e clientes que representam equipes, conforme a estratégia de tabela única indicada no enunciado.
- `customers_addresses`: endereços de clientes.
- `teams`: equipes.
- `sales_representatives`: representantes de vendas.
- `sales_representatives_address`: endereços dos representantes.
- `orders`: pedidos.
- `ordered_items`: itens que pertencem a cada pedido.
- `items`: catálogo de produtos.
- `inventory_list`: estoque e custo unitário.
- `price_history`: histórico de preços por período.

## Como executar
1. Abra o Oracle SQL Developer ou outra ferramenta compatível com Oracle Database.
2. Conecte-se a um schema de teste.
3. Execute `sql/01_create_schema.sql`.
4. Se necessário, execute o script em um schema vazio, pois os nomes das tabelas precisam estar livres.

> **Importante:** os tamanhos e algumas decisões de relacionamento são propostas de projeto baseadas no diagrama e nos dados de amostra do enunciado. Confirme-os com o professor antes da entrega. A tabela `customers` preserva os campos e tamanhos do exemplo original.

## Convenções
- `PK`: chave primária.
- `UK`: chave única.
- `FK`: chave estrangeira.
- `*`: atributo obrigatório.
- `o`: atributo opcional.
- Nomes físicos em `snake_case`, sem espaços.
- Tipos compatíveis com Oracle (`VARCHAR2`, `NUMBER`, `DATE`).

## Como publicar no GitHub
Consulte a seção **Publicar no GitHub** no final deste README. Não envie senhas, tokens, credenciais nem dados pessoais.

## Base do trabalho
O projeto foi elaborado a partir do enunciado fornecido para o exercício de modelagem de dados da Oracle Baseball League. Os campos de `customers` e seus tamanhos seguem o exemplo incluído no documento. Para as demais entidades, os tipos e tamanhos são escolhas justificadas para um modelo físico inicial.

### Publicar no GitHub (pelo navegador)
1. Entre em https://github.com e faça login.
2. Clique em **New repository**.
3. Nome sugerido: `obl-baseball-league`.
4. Descrição: `Projeto acadêmico de modelagem e implementação de banco de dados Oracle para a Oracle Baseball League (OBL).`
5. Selecione **Public** (ou **Private**, se o professor preferir).
6. Não marque a opção para adicionar README, pois este projeto já tem um.
7. Clique em **Create repository**.
8. Na página do repositório, escolha **Add file → Upload files**.
9. Extraia o ZIP no computador e arraste os arquivos e pastas de dentro de `obl-baseball-league` para a área de upload. Envie a estrutura toda, não apenas o ZIP.
10. Escreva a mensagem de commit `Adiciona projeto de modelagem de banco de dados OBL` e clique em **Commit changes**.

### Publicar com Git (alternativa)
Depois de instalar o Git e criar o repositório vazio no GitHub, abra o terminal dentro desta pasta e execute:
```bash
git init
git add .
git commit -m "Adiciona projeto de modelagem de banco de dados OBL"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/obl-baseball-league.git
git push -u origin main
```
Troque `SEU-USUARIO` pelo seu nome de usuário do GitHub. Não compartilhe tokens ou senhas.
