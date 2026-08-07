-- Assign a unique sequential number to each distinct product category sorted alphabetically--

Select category,
  ROW_NUMBER() OVER () AS number_of_unique_category
FROM(
   SELECT DISTINCT category
   FROM products
   ORDER BY category ASC
) AS categories_subquery
ORDER BY category ASC;
