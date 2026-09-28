-- Procedure de relatório por vendedor
CREATE
  OR REPLACE FUNCTION sp_relatorio_vendedor(id_vendedor TEXT, data_inicio DATE, data_fim DATE) RETURNS TABLE (faturamento NUMERIC, ticket_medio NUMERIC, nota_media NUMERIC) AS $$ BEGIN RETURN QUERY
SELECT
  SUM(i.price) AS faturamento,
  AVG(i.price) AS ticket_medio,
  AVG(r.review_score) AS nota_media
FROM olist_order_items_dataset i
JOIN olist_orders_dataset o
ON i.order_id = o.order_id
LEFT JOIN olist_order_reviews_dataset r
ON o.order_id = r.order_id
WHERE i.seller_id = id_vendedor
  AND o.order_purchase_timestamp BETWEEN data_inicio
  AND data_fim;
END;
$$ LANGUAGE plpgsql;