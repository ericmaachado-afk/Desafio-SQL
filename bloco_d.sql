-- 1. Clientes cujo gasto total está acima da média geral
SELECT
  customer_id,
  SUM(price) AS gasto_total
FROM olist_orders_dataset o
JOIN olist_order_items_dataset i
ON o.order_id = i.order_id
GROUP BY customer_id
HAVING SUM(price) > (
  SELECT
    AVG(total_gasto)
  FROM (
    SELECT
      customer_id,
      SUM(price) AS total_gasto
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset i
    ON o.order_id = i.order_id
    GROUP BY customer_id
  ) sub
);