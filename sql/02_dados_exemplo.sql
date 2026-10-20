-- Dados fictícios para testar o modelo.
-- Execute após sql/01_schema.sql.

INSERT INTO cliente (nome, email, telefone, tipo_cliente, endereco)
VALUES ('Matheus Almeida', 'matheus@example.com', '(61) 90000-0001', 'INDIVIDUAL', 'Brasília - DF');

INSERT INTO cliente (nome, email, telefone, tipo_cliente, endereco)
VALUES ('Carlos Souza', 'carlos@example.com', '(61) 90000-0002', 'REPRESENTANTE_EQUIPE', 'Brasília - DF');

INSERT INTO equipe (nome, quantidade_jogadores, percentual_desconto)
VALUES ('Tigres do Cerrado', 18, 10);

INSERT INTO representante (nome, email, telefone)
VALUES ('Ana Martins', 'ana.martins@example.com', '(61) 90000-0101');

INSERT INTO representante (nome, email, telefone)
VALUES ('João Ribeiro', 'joao.ribeiro@example.com', '(61) 90000-0102');

INSERT INTO produto (nome, categoria, descricao, preco_lista, quantidade_estoque)
VALUES ('Bola de beisebol', 'Bolas', 'Bola oficial para treino', 39.90, 100);

INSERT INTO produto (nome, categoria, descricao, preco_lista, quantidade_estoque)
VALUES ('Luva de beisebol', 'Acessórios', 'Luva para jogador', 129.90, 35);

INSERT INTO produto (nome, categoria, descricao, preco_lista, quantidade_estoque)
VALUES ('Camiseta do time', 'Uniformes', 'Camiseta serigrafada', 59.90, 60);

-- Pedido individual
INSERT INTO pedido (id_cliente, id_representante, status, observacao)
VALUES (1, NULL, 'ABERTO', 'Compra individual de materiais de treino');

-- Pedido feito em nome de uma equipe
INSERT INTO pedido (id_cliente, id_equipe, id_representante, status, observacao)
VALUES (2, 1, 1, 'PAGO', 'Compra de uniformes para a equipe');

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, percentual_desconto)
VALUES (1, 1, 2, 39.90, 0);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, percentual_desconto)
VALUES (2, 2, 18, 129.90, 10);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, percentual_desconto)
VALUES (2, 3, 18, 59.90, 10);

INSERT INTO reclamacao (id_cliente, id_representante, descricao, status)
VALUES (1, 1, 'Cliente relatou dúvida sobre a entrega do pedido.', 'ABERTA');

COMMIT;
