-- 1. Ranking dos vendedores por faturamento dentro de cada estado
SELECT
  s.seller_state,
  s.seller_id,
  SUM(i.price) AS faturamento,
  RANK() OVER (PARTITION BY s.seller_state ORDER BY SUM(i.price) DESC) AS ranking
FROM olist_order_items_dataset i
JOIN olist_sellers_dataset s
ON i.seller_id = s.seller_id
GROUP BY s.seller_state,
  s.seller_id;