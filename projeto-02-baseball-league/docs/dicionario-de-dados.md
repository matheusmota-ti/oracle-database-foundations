# Dicionário de dados

`*` = obrigatório; `o` = opcional. PK = chave primária; UK = chave única; FK = chave estrangeira.

## customers (`ctr`)
| Tipo chave | Obrigatório? | Coluna | Tipo Oracle | Tamanho/precisão |
|---|---|---|---|---|
| PK | * | ctr_number | VARCHAR2 | 6 |
| UK | * | email | VARCHAR2 | 50 |
| — | * | first_name | VARCHAR2 | 20 |
| — | * | last_name | VARCHAR2 | 30 |
| — | * | phone_number | VARCHAR2 | 11 |
| — | * | current_balance | NUMBER | 6,2 |
| UK | o | loyalty_card_number | VARCHAR2 | 6 |
| FK | o | tem_id | VARCHAR2 | 4 |
| FK | o | sre_id | VARCHAR2 | 4 |

## Demais tabelas
| Tabela | Coluna | Tipo Oracle | Obrigatório? | Chave/observação |
|---|---|---|---|---|
| customers_addresses (`cad`) | id | VARCHAR2(6) | * | PK |
| customers_addresses (`cad`) | address_line_1 | VARCHAR2(100) | * | — |
| customers_addresses (`cad`) | address_line_2 | VARCHAR2(100) | o | — |
| customers_addresses (`cad`) | city | VARCHAR2(60) | * | — |
| customers_addresses (`cad`) | postal_code | VARCHAR2(12) | * | — |
| customers_addresses (`cad`) | ctr_number | VARCHAR2(6) | * | FK → customers |
| teams (`tem`) | id | VARCHAR2(4) | * | PK |
| teams (`tem`) | name | VARCHAR2(80) | * | UK |
| teams (`tem`) | number_of_players | NUMBER(3) | * | — |
| teams (`tem`) | discount | NUMBER(5,2) | o | percentual |
| teams (`tem`) | sre_id | VARCHAR2(4) | o | FK → sales_representatives |
| sales_representatives (`sre`) | id | VARCHAR2(4) | * | PK |
| sales_representatives (`sre`) | email | VARCHAR2(100) | * | UK |
| sales_representatives (`sre`) | first_name | VARCHAR2(30) | * | — |
| sales_representatives (`sre`) | last_name | VARCHAR2(30) | * | — |
| sales_representatives (`sre`) | phone_number | VARCHAR2(15) | * | — |
| sales_representatives (`sre`) | commission_rate | NUMBER(5,2) | * | percentual |
| sales_representatives (`sre`) | supervisor_id | VARCHAR2(4) | o | FK autorreferente |
| sales_representatives_address (`sra`) | id | VARCHAR2(6) | * | PK |
| sales_representatives_address (`sra`) | address_line_1 | VARCHAR2(100) | * | — |
| sales_representatives_address (`sra`) | address_line_2 | VARCHAR2(100) | o | — |
| sales_representatives_address (`sra`) | city | VARCHAR2(60) | * | — |
| sales_representatives_address (`sra`) | postal_code | VARCHAR2(12) | * | — |
| sales_representatives_address (`sra`) | sre_id | VARCHAR2(4) | * | FK → sales_representatives |
| orders (`odr`) | id | VARCHAR2(10) | * | PK |
| orders (`odr`) | order_date | DATE | * | data e hora do pedido |
| orders (`odr`) | number_of_units | NUMBER(6) | * | — |
| orders (`odr`) | ctr_number | VARCHAR2(6) | * | FK → customers |
| ordered_items (`oim`) | odr_id | VARCHAR2(10) | * | PK composta/FK → orders |
| ordered_items (`oim`) | itm_number | VARCHAR2(10) | * | PK composta/FK → items |
| ordered_items (`oim`) | quantity_ordered | NUMBER(6) | * | — |
| ordered_items (`oim`) | quantity_shipped | NUMBER(6) | * | — |
| items (`itm`) | itm_number | VARCHAR2(10) | * | PK |
| items (`itm`) | name | VARCHAR2(80) | * | — |
| items (`itm`) | description | VARCHAR2(250) | * | — |
| items (`itm`) | category | VARCHAR2(40) | * | — |
| items (`itm`) | color | VARCHAR2(30) | o | — |
| items (`itm`) | size | VARCHAR2(10) | o | — |
| items (`itm`) | ilt_id | VARCHAR2(10) | * | FK → inventory_list |
| inventory_list (`ilt`) | id | VARCHAR2(10) | * | PK |
| inventory_list (`ilt`) | unit_cost | NUMBER(8,2) | * | — |
| inventory_list (`ilt`) | units_on_hand | NUMBER(8) | * | — |
| price_history (`prh`) | start_date | DATE | * | parte da PK composta |
| price_history (`prh`) | start_time | VARCHAR2(8) | * | parte da PK composta |
| price_history (`prh`) | price | NUMBER(8,2) | * | — |
| price_history (`prh`) | end_date | DATE | o | — |
| price_history (`prh`) | end_time | VARCHAR2(8) | o | — |
| price_history (`prh`) | itm_number | VARCHAR2(10) | * | PK/FK → items |

## Decisões de implementação
- `orders.order_date` armazena data e hora em uma única coluna `DATE`, embora a tabela conceitual mostre data e hora separadamente.
- `ordered_items` usa chave primária composta (`odr_id`, `itm_number`) para impedir duplicação do mesmo item no mesmo pedido. Caso o sistema permita várias linhas do mesmo item em um pedido, deve ser adicionado um identificador próprio.
- `price_history` usa `start_date`, `start_time` e `itm_number` na chave primária para identificar cada versão do preço.
- `customers.current_balance` utiliza `NUMBER(6,2)`, conforme o exemplo original.
