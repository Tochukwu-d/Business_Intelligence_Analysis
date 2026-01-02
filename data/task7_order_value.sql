-- Task 7: Order Value Segmentation
SELECT 
    order_id,
    customer_id,
    sales_amount,
    CASE 
        WHEN sales_amount >= 5000 THEN 'High Value'
        WHEN sales_amount >= 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS segment
FROM sales_data
ORDER BY sales_amount DESC;