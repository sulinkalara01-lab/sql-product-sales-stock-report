-- Rank products by stock quantity in descending order within specific categories--

SELECT stock_quantity, 
       category,
	   ROW_NUMBER() OVER(ORDER BY category ASC, stock_quantity DESC)
FROM products
WHERE category IN ('Beauty','Electronics', 'Clothing', 'Books');
