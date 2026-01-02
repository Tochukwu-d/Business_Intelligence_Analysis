-- Task 9: Regional Contribution Analysis
SELECT 
    region,
    SUM(sales_amount) AS total_sales,
    ROUND(
        (SUM(sales_amount) * 100.0 / SUM(SUM(sales_amount)) OVER ()), 
        2
    ) AS percent_contribution
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;