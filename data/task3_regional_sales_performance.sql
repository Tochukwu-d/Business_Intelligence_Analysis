-- Task 3: Regional Sales Performance

-- BUSINESS OBJECTIVE:
-- Analyze and compare sales performance across different geographic regions
-- to inform strategic business decisions, resource allocation, and market
-- expansion plans. This query provides management with a comprehensive view
-- of regional contribution to overall revenue.
--
-- ANALYSIS PURPOSE:
-- 1. Identify top-performing and underperforming regions
-- 2. Calculate average transaction value per region for pricing strategy
-- 3. Measure order volume to understand regional market activity
-- 4. Enable data-driven decisions for sales team deployment and incentives
-- 5. Support regional budget allocation and target setting
--
-- METHODOLOGY:
-- - GROUP BY region aggregates metrics at geographic level
-- - COUNT(DISTINCT) ensures accurate order counting (prevents duplicates)
-- - SUM calculates total revenue generated per region
-- - AVG computes mean order value for regional transaction analysis
-- - ROUND formats monetary values to standard 2 decimal places
-- - ORDER BY prioritizes regions by revenue contribution (highest first)
--
-- EXPECTED BUSINESS INSIGHTS:
-- ✓ Regional revenue contribution to overall business
-- ✓ Average customer spending patterns by geography
-- ✓ Order density and market penetration per region
-- ✓ Identification of high-value vs. high-volume regions
-- ✓ Data for regional performance benchmarking

-- BUSINESS DECISIONS SUPPORTED:
-- 1. Sales team allocation and territory planning
-- 2. Marketing budget distribution across regions
-- 3. Inventory planning and distribution center placement

SELECT 
	region,
    COUNT(DISTINCT order_id) AS number_of_orders,
    SUM(sales_amount) AS total_sales,
    ROUND(AVG(sales_amount), 2) AS avg_sales_per_order
    
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;