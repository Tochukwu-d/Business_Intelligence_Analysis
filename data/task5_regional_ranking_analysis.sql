-- Task 5: Regional customer ranking analysis

WITH regional_customer_sales AS (
    SELECT 
        c.region,
        s.customer_id,
        c.customer_name,
        SUM(s.sales_amount) AS total_sales
    FROM sales_data s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.region, s.customer_id, c.customer_name
)
SELECT 
    region,
    customer_id,
    customer_name,
    total_sales,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_sales DESC) AS regional_rank
FROM regional_customer_sales
ORDER BY region, regional_rank;