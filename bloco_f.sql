-- 1. CTE de faturamento mensal por estado
WITH faturamento_mensal AS (
  SELECT
    c.customer_state,
    DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,
    SUM(i.price) AS faturamento
  FROM olist_orders_dataset o
  JOIN olist_order_items_dataset i
  ON o.order_id = i.order_id
  JOIN olist_customers_dataset c
  ON o.customer_id = c.customer_id
  GROUP BY c.customer_state,
    DATE_TRUNC('month', o.order_purchase_timestamp)
)
SELECT
  customer_state,
  mes,
  faturamento,
  LAG(faturamento) OVER (PARTITION BY customer_state ORDER BY mes) AS faturamento_anterior,
  (faturamento - LAG(faturamento) OVER (PARTITION BY customer_state ORDER BY mes)) / NULLIF(LAG(faturamento) OVER (PARTITION BY customer_state ORDER BY mes), 0) * 100 AS variacao_percentual
FROM faturamento_mensal;