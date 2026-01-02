-- Task 10: Executive Summary (Simplified MySQL Version)
SELECT 
    c.customer_id,
    c.customer_name,
    c.region,
    COUNT(DISTINCT s.order_id) AS number_of_orders,
    COALESCE(SUM(s.sales_amount), 0) AS total_sales,
    CASE 
        WHEN PERCENT_RANK() OVER (ORDER BY COALESCE(SUM(s.sales_amount), 0)) >= 0.9 
            THEN 'VIP'
        WHEN PERCENT_RANK() OVER (ORDER BY COALESCE(SUM(s.sales_amount), 0)) >= 0.2 
            THEN 'Regular'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
LEFT JOIN sales_data s ON c.customer_id = s.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name,
    c.region
ORDER BY total_sales DESC;