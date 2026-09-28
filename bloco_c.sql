-- 1. Faturamento total por estado do cliente
SELECT
  c.customer_state,
  SUM(i.price) AS faturamento_total
FROM olist_orders_dataset o
JOIN olist_order_items_dataset i
ON o.order_id = i.order_id
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY faturamento_total DESC;
-- 2. Top 10 vendedores por faturamento
SELECT
  s.seller_id,
  SUM(i.price) AS faturamento
FROM olist_order_items_dataset i
JOIN olist_sellers_dataset s
ON i.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY faturamento DESC
LIMIT 10;
-- 3. Ticket médio por categoria
SELECT
  p.product_category_name,
  AVG(i.price) AS ticket_medio
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
ON i.product_id = p.product_id
GROUP BY p.product_category_name;
-- 4. Vendedores com nota média abaixo de 3
SELECT
  s.seller_id,
  AVG(r.review_score) AS nota_media
FROM olist_order_items_dataset i
JOIN olist_sellers_dataset s
ON i.seller_id = s.seller_id
JOIN olist_orders_dataset o
ON i.order_id = o.order_id
JOIN olist_order_reviews_dataset r
ON o.order_id = r.order_id
GROUP BY s.seller_id
HAVING AVG(r.review_score) < 3;