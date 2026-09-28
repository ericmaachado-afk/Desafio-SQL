-- 1. Classificar pedidos por prazo de entrega
SELECT
  order_id,
  CASE WHEN order_delivered_customer_date < order_estimated_delivery_date THEN 'adiantado' WHEN order_delivered_customer_date = order_estimated_delivery_date THEN 'no prazo' ELSE 'atrasado' END AS status_entrega
FROM olist_orders_dataset;