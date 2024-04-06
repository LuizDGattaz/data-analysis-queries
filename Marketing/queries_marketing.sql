/* Custo por Clique (CPC) de Campanhas */
/* Calcula o custo médio que a empresa paga por cada clique em uma determinada campanha de marketing. */
SELECT (Valor_Gasto_em_Marketing / Cliques) AS CPC
FROM campanhas_table
WHERE campanha = 'Nome_da_Campanha';

/* Custo de Aquisição do Cliente (CAC) */
/* Calcula o custo médio para adquirir um novo cliente através de uma campanha de marketing. */
SELECT (Valor_Gasto_em_Marketing / Novos_Clientes_Adquiridos) AS CAC
FROM campanhas_table
WHERE campanha = 'Nome_da_Campanha';

/* Retorno sobre o investimento em marketing (ROI) */
/* Calcula o retorno financeiro gerado por uma campanha de marketing em relação ao investimento feito. */
SELECT ((Receita_Gerada - Valor_Gasto_em_Marketing) / Valor_Gasto_em_Marketing) AS ROI
FROM campanhas_table
WHERE campanha = 'Nome_da_Campanha';

/* Taxa de Cliques (CTR) */
/* Mede a proporção de cliques em relação ao número de impressões de anúncios. */
SELECT (Cliques / Impressões) AS CTR
FROM campanhas_table
WHERE campanha = 'Nome_da_Campanha';

/* Conversão */
/* Calcula a taxa de conversão de cliques em pedidos. */
SELECT (Pedidos / Cliques) AS Conversão
FROM campanhas_table
WHERE campanha = 'Nome_da_Campanha';


/* Taxa de Conversão de Cliques em Pedidos (CCR) */
/* Métrica para medir a eficácia das campanhas de marketing em gerar pedidos. */
SELECT (COUNT(DISTINCT pedidos) / COUNT(DISTINCT cliques)) AS CCR
FROM cliques_table
WHERE campanha = 'Nome_da_Campanha';

/* Taxa de Retenção de Clientes */
/* Indica a porcentagem de clientes que retornam para fazer pedidos novamente. */
SELECT (COUNT(DISTINCT clientes_retornados) / COUNT(DISTINCT todos_os_clientes)) AS Retenção_Clientes
FROM pedidos_table
WHERE data BETWEEN '2024-01-01' AND '2024-03-31';

/* Custo por Aquisição (CPA)*/
/* Quanto custa para adquirir um novo cliente através de uma campanha de marketing. */
SELECT (Valor_Gasto_em_Marketing / Novos_Clientes_Adquiridos) AS CPA
FROM campanhas_table
WHERE data = '2024-03-01';

/* Lifetime Value (LTV) do Cliente */
/* Valor total esperado que um cliente gasta durante seu relacionamento com a marca. */
SELECT AVG(valor_total_pedidos) AS LTV
FROM pedidos_table
WHERE data BETWEEN '2023-01-01' AND '2024-01-01';

/* Taxa de Engajamento nas Redes Sociais */
/* Mede a interação dos usuários com o conteúdo da empresa nas redes sociais. */
SELECT (Interações / Seguidores) AS Engajamento
FROM redes_sociais
WHERE plataforma = 'Instagram'
AND data_postagem BETWEEN '2024-01-01' AND '2024-03-31';

/* Vendas totais por campanha (GMV) */
/* Calcula o valor total das vendas gerado por uma campanha de marketing. */
SELECT campanha, SUM(valor_total_pedidos) AS GMV
FROM pedidos_table
WHERE campanha = 'Nome_da_Campanha'
GROUP BY campanha;


/* Número de pedidos */
/* Conta o número total de pedidos realizados. */
SELECT campanha, COUNT(DISTINCT order_id) AS Num_Pedidos
FROM pedidos_table
WHERE campanha = 'Nome_da_Campanha'
GROUP BY campanha;


/* Número de Clientes por Campanha */
/* Conta o número de clientes distintos que fizeram pedidos durante uma campanha. */
SELECT COUNT(DISTINCT cliente_id) AS Num_Clientes
FROM pedidos_table
WHERE campanha = 'Nome_da_Campanha';

/* Vendas por segmentação de parte do dia */
/* Calcula as vendas por segmento de horário do dia (Manhã, Meio-dia, Anoitecer/Final da Tarde, Noite, De manhã cedo).*/
SELECT 
    CASE 
        WHEN hora > 4 AND hora <= 8 THEN 'Early Morning'
        WHEN hora > 8 AND hora <= 12 THEN 'Morning'
        WHEN hora > 12 AND hora <= 16 THEN 'Afternoon'
        WHEN hora > 16 AND hora <= 20 THEN 'Evening'
        WHEN hora > 20 AND hora <= 24 THEN 'Night'
        WHEN hora <= 4 THEN 'Late Night'
    END AS part_of_day,
    COUNT(DISTINCT order_id) AS Num_Pedidos
FROM pedidos_table
WHERE campanha = 'Nome_da_Campanha'
AND data_pedido BETWEEN '2024-01-01' AND '2024-03-31' 
GROUP BY part_of_day;




