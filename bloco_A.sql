-- 1. 20 pedidos entregues mais recentes
SELECT order_id, order_delivered_customer_date
FROM olist_orders_dataset
WHERE order_status = 'delivered'
ORDER BY order_delivered_customer_date DESC
LIMIT 20;

-- 2. Produtos de uma categoria específica (ex: cama_mesa_banho)
SELECT p.product_id, t.product_category_name
FROM olist_products_dataset p
JOIN product_category_name_translation t
  ON p.product_category_name = t.product_category_name_english
WHERE t.product_category_name = 'cama_mesa_banho';

-- 3. Métodos de pagamento distintos
SELECT DISTINCT payment_type
FROM olist_order_payments_dataset;

-- 4. Produtos com peso acima de 10kg
SELECT product_id, product_weight_g
FROM olist_products_dataset
WHERE product_weight_g > 10000
ORDER BY product_weight_g DESC;