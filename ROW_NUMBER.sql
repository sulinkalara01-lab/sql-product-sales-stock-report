WITH Category_Avg_Prices AS (
    SELECT 
        category,
        AVG(price) AS avg_price
    FROM products
    GROUP BY category
)
SELECT 
    category,
    avg_price,
    ROW_NUMBER() OVER (ORDER BY avg_price DESC) AS Row_N
FROM Category_Avg_Prices
ORDER BY avg_price DESC;