-- Task 4: Top Customers (Revenue)
-- BUSINESS OBJECTIVE:
-- Identify and rank the highest-value customers by total revenue contribution
-- to enable targeted retention strategies, personalized engagement
--
-- ANALYSIS PURPOSE:
-- 1. Pinpoint the most financially significant customers for the business
-- 2. Enable data-driven customer relationship management (CRM) prioritization
-- 3. Support development of loyalty and VIP programs for high-value clients
-- 4. Provide insights for account-based marketing and sales strategies
-- 5. Identify revenue concentration risks and customer dependency levels
--
-- EXPECTED BUSINESS INSIGHTS:
-- ✓ Identification of revenue-generating customer elite (top 10)
-- ✓ Understanding of geographic distribution of high-value customers
-- ✓ Basis for customer lifetime value (CLV) tier segmentation

WITH customer_sales AS (
	SELECT
		s.customer_id,
        c.customer_name,
        c.region,
        SUM(s.sales_amount) AS total_sales
        FROM sales_data s
        JOIN customers c ON s.customer_id = c.customer_id
        GROUP BY s.customer_id, c.customer_name, c.region
)
SELECT
	customer_id,
    customer_name,
    region,
    total_sales,
    ROW_NUMBER() OVER(ORDER BY total_sales DESC) AS overall_rank
    FROM customer_sales
    ORDER BY total_sales DESC
    LIMIT 10;
    