-- 1. View consolidada de pedidos completos
CREATE VIEW vw_pedidos_completos AS
SELECT
  o.order_id,
  o.order_purchase_timestamp,
  c.customer_id,
  c.customer_state,
  i.product_id,
  i.price,
  p.product_category_name,
  pay.payment_type,
  pay.payment_value,
  s.seller_id,
  s.seller_state
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset i
ON o.order_id = i.order_id
JOIN olist_products_dataset p
ON i.product_id = p.product_id
JOIN olist_order_payments_dataset pay
ON o.order_id = pay.order_id
JOIN olist_sellers_dataset s
ON i.seller_id = s.seller_id;