-- Task 8: Customer Life Time Value

SELECT
    c.customer_id,
    c.customer_name,
    MIN(o.order_date) AS first_purchase_date,
    MAX(o.order_date) AS last_purchase_date,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_amount) AS total_sales
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC;
