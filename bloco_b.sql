-- 1. Categoria traduzida, valor do item e cidade do vendedor
SELECT
  t.product_category_name AS categoria_pt,
  i.price AS valor_item,
  s.seller_city
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
ON i.product_id = p.product_id
LEFT JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name_english
JOIN olist_sellers_dataset s
ON i.seller_id = s.seller_id;
-- 2. Pedidos com atraso na entrega
SELECT
  o.order_id,
  o.order_estimated_delivery_date,
  o.order_delivered_customer_date
FROM olist_orders_dataset o
WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date;
-- 3. Pedidos e formas de pagamento
SELECT
  o.order_id,
  pay.payment_type,
  pay.payment_installments
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset pay
ON o.order_id = pay.order_id;
-- 4. Produtos com categoria traduzida (incluindo sem tradução)
SELECT
  p.product_id,
  p.product_category_name,
  t.product_category_name
FROM olist_products_dataset p
LEFT JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name_english;
-- 5. Pedidos em que cliente e vendedor são do mesmo estado
SELECT
  o.order_id,
  c.customer_state,
  s.seller_state
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset i
ON o.order_id = i.order_id
JOIN olist_sellers_dataset s
ON i.seller_id = s.seller_id
WHERE c.customer_state = s.seller_state;