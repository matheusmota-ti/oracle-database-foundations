-- 1. Listar pedidos com cliente, equipe e representante.
SELECT
    p.id_pedido,
    p.data_pedido,
    c.nome AS cliente,
    e.nome AS equipe,
    r.nome AS representante,
    p.status
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
LEFT JOIN equipe e ON e.id_equipe = p.id_equipe
LEFT JOIN representante r ON r.id_representante = p.id_representante
ORDER BY p.data_pedido DESC;

-- 2. Detalhar itens e calcular o subtotal com desconto.
SELECT
    ip.id_pedido,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.percentual_desconto,
    ROUND(ip.quantidade * ip.preco_unitario * (1 - ip.percentual_desconto / 100), 2) AS subtotal
FROM item_pedido ip
JOIN produto pr ON pr.id_produto = ip.id_produto
ORDER BY ip.id_pedido, pr.nome;

-- 3. Calcular o total de cada pedido.
SELECT
    p.id_pedido,
    c.nome AS cliente,
    ROUND(SUM(ip.quantidade * ip.preco_unitario * (1 - ip.percentual_desconto / 100)), 2) AS total_pedido
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
JOIN item_pedido ip ON ip.id_pedido = p.id_pedido
GROUP BY p.id_pedido, c.nome
ORDER BY p.id_pedido;

-- 4. Consultar estoque baixo (até 10 unidades).
SELECT id_produto, nome, quantidade_estoque
FROM produto
WHERE quantidade_estoque <= 10 AND ativo = 'S'
ORDER BY quantidade_estoque;

-- 5. Listar reclamações e respectivos responsáveis.
SELECT
    rc.id_reclamacao,
    c.nome AS cliente,
    r.nome AS representante,
    rc.data_reclamacao,
    rc.descricao,
    rc.status
FROM reclamacao rc
JOIN cliente c ON c.id_cliente = rc.id_cliente
JOIN representante r ON r.id_representante = rc.id_representante
ORDER BY rc.data_reclamacao DESC;
