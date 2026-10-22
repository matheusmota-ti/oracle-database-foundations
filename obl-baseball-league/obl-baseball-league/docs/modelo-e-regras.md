# Modelo e regras de negócio

## Cenário
A Oracle Baseball League (OBL) vende equipamentos e vestuário de beisebol. Clientes individuais e equipes podem comprar itens. Equipes recebem desconto conforme a quantidade de jogadores. A empresa possui representantes de vendas que atendem equipes e também podem tratar reclamações de clientes individuais.

## Regras consideradas
1. Um cliente é identificado por `ctr_number`; o e-mail é único e obrigatório, conforme o exemplo fornecido.
2. O modelo usa uma única tabela `customers` para os tipos de cliente, como indicado no enunciado. `loyalty_card_number`, `tem_id` e `sre_id` são opcionais.
3. Uma equipe pode estar associada a um representante de vendas.
4. Um cliente pode ter mais de um endereço; cada endereço pertence a um cliente.
5. Um representante pode ter endereço(s) registrado(s) na tabela de endereços.
6. Um cliente pode realizar vários pedidos; cada pedido pertence a um cliente.
7. Um pedido contém linhas em `ordered_items`; cada linha referencia um pedido e um item.
8. Um item pode ter registro de estoque e histórico de preços.
9. `price_history` usa a combinação de item, data e hora de início como chave primária composta.
10. Os campos de término do histórico de preço são opcionais para permitir um preço vigente.

## Observações sobre hipóteses
O diagrama fornecido contém relações visuais e nomes de atributos, mas algumas cardinalidades/atributos de ligação não são perfeitamente recuperáveis do texto extraído do PDF. Para permitir um esquema executável, este projeto assume:
- `teams.sre_id` como representante responsável pela equipe;
- `sales_representatives.supervisor_id` como autorrelacionamento opcional;
- `items.ilt_id` como referência a `inventory_list`;
- `customers_addresses` e `sales_representatives_address` com identificadores próprios e chave estrangeira para a entidade proprietária.
Essas hipóteses estão documentadas para facilitar a revisão, não devem ser tratadas como informação explicitamente declarada pelo enunciado.

## Tipos de dados
Os tipos e tamanhos são escolhas para um modelo físico inicial. As colunas `customers` mantêm os tipos/tamanhos do exemplo do enunciado. Para chaves estrangeiras, os tipos são compatíveis com as chaves referenciadas.
