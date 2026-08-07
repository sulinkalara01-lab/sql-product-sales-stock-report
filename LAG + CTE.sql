WITH Monthly_Sales AS (
    SELECT 
        DATE_TRUNC('month', o.order_date) AS sales_month,
        SUM(i.quantity * i.unit_price) AS total_sales
    FROM orders AS o
    JOIN order_items i ON o.order_id = i.order_id
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT 
    sales_month,
    total_sales AS current_month_sales,
    LAG(total_sales, 1) OVER (ORDER BY sales_month ASC) AS previous_month_sales
FROM Monthly_Sales
ORDER BY sales_month ASC;