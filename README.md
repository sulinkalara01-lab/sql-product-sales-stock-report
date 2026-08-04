SELECT 
       p.name, 
       p.category,
	   SUM(COALESCE(oi.quantity * oi.unit_price, 0)) AS total_facturado,
  CASE
     WHEN p.stock_quantity = 0 THEN 'Out of Stock'
	 WHEN p.stock_quantity BETWEEN 1 AND 10 THEN 'Runing Out of Stock'
	 ELSE 'Suficient'
  END AS stock_status
FROM products AS p
LEFT JOIN order_items AS oi 
     ON p.product_id = oi.product_id
  WHERE (p.category = 'Electronics' AND p.price > 1)
    OR (p.category = 'Clothing' AND p.price > 1)
    OR (p.category = 'Sports' AND p.price > 50)
GROUP BY 
    p.product_id, 
    p.name, 
    p.category, 
    p.stock_quantity;
