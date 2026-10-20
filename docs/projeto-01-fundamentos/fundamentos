# Diagrama Entidade-Relacionamento

O diagrama abaixo usa Mermaid. No GitHub, ele pode ser exibido diretamente no Markdown.

```mermaid
erDiagram
    CLIENTE ||--o{ PEDIDO : realiza
    EQUIPE o|--o{ PEDIDO : "compra em nome de"
    REPRESENTANTE o|--o{ PEDIDO : acompanha
    PEDIDO ||--|{ ITEM_PEDIDO : contem
    PRODUTO ||--o{ ITEM_PEDIDO : aparece_em
    CLIENTE ||--o{ RECLAMACAO : registra
    REPRESENTANTE ||--o{ RECLAMACAO : atende

    CLIENTE {
        NUMBER id_cliente PK
        VARCHAR2 nome
        VARCHAR2 email
        VARCHAR2 telefone
        VARCHAR2 tipo_cliente
        VARCHAR2 endereco
    }
    EQUIPE {
        NUMBER id_equipe PK
        VARCHAR2 nome
        NUMBER quantidade_jogadores
        NUMBER percentual_desconto
    }
    REPRESENTANTE {
        NUMBER id_representante PK
        VARCHAR2 nome
        VARCHAR2 email
        VARCHAR2 telefone
    }
    PRODUTO {
        NUMBER id_produto PK
        VARCHAR2 nome
        VARCHAR2 categoria
        NUMBER preco_lista
        NUMBER quantidade_estoque
    }
    PEDIDO {
        NUMBER id_pedido PK
        NUMBER id_cliente FK
        NUMBER id_equipe FK
        NUMBER id_representante FK
        DATE data_pedido
        VARCHAR2 status
    }
    ITEM_PEDIDO {
        NUMBER id_item_pedido PK
        NUMBER id_pedido FK
        NUMBER id_produto FK
        NUMBER quantidade
        NUMBER preco_unitario
        NUMBER percentual_desconto
    }
    RECLAMACAO {
        NUMBER id_reclamacao PK
        NUMBER id_cliente FK
        NUMBER id_representante FK
        DATE data_reclamacao
        VARCHAR2 descricao
        VARCHAR2 status
    }
```

## Cardinalidades principais

- **Cliente 1:N Pedido:** um cliente pode realizar vários pedidos; cada pedido pertence a um cliente.
- **Equipe 1:N Pedido (opcional no pedido):** uma equipe pode estar associada a vários pedidos; um pedido pode ser individual ou feito em nome de uma equipe.
- **Pedido 1:N Item_Pedido:** cada pedido contém um ou mais itens.
- **Produto 1:N Item_Pedido:** um produto pode aparecer em diversos itens de pedidos.
- **Cliente 1:N Reclamação:** um cliente pode registrar várias reclamações.
- **Representante 1:N Reclamação:** um representante pode atender várias reclamações.
- **Representante 1:N Pedido (opcional):** um pedido pode ser associado a um representante, especialmente em vendas para equipes.
