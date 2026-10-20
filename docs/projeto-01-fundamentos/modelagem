# Decisões de modelagem

1. **Cliente e equipe são entidades separadas.** O enunciado diferencia clientes individuais e clientes que compram em nome de equipes. O pedido referencia sempre um cliente e pode referenciar uma equipe.
2. **Pedido e item do pedido são separados.** Isso permite registrar vários produtos no mesmo pedido e manter quantidade e preço negociado por item.
3. **Preço histórico.** `ITEM_PEDIDO.preco_unitario` registra o preço aplicado no momento da compra, sem depender de futuras mudanças no preço de lista.
4. **Desconto de equipe.** `EQUIPE.percentual_desconto` guarda o percentual aplicável à equipe. Como o enunciado não informa faixas, elas não foram inventadas.
5. **Representante e reclamação.** A tabela `RECLAMACAO` permite registrar reclamações de clientes individuais ou de equipe, atendidas pelos representantes.
6. **Valores monetários.** São usados `NUMBER(10,2)` para valores e `NUMBER(5,2)` para percentuais.
7. **Restrições.** Chaves primárias e estrangeiras, valores não negativos e faixas de status ajudam a preservar a integridade dos dados.

## Possível evolução

Caso a regra de desconto seja fornecida posteriormente, pode-se criar uma tabela de faixas de desconto baseada no número de jogadores e automatizar o cálculo por meio de uma procedure, trigger ou lógica da aplicação.
