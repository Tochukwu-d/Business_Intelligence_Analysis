-- Task 2; Customer Order Average
-- BUSINESS OBJECTIVE:
-- Analyze complete customer purchasing behavior by calculating order metrics 
-- for ALL customers, including those who have never placed an order.
-- This provides management with a holistic view of customer engagement
-- and identifies opportunities for customer retention/reactivation.
--
-- ANALYSIS PURPOSE:
-- 1. Measure customer engagement through order frequency and value
-- 2. Identify inactive customers (zero orders) for targeted marketing
-- 3. Segment customers by purchasing behavior for personalized strategies
-- 4. Establish baseline metrics for customer lifetime value calculation
--
-- METHODOLOGY:
-- - LEFT JOIN ensures all customers from the customers table are included
-- - COALESCE converts NULL values to 0 for customers with no orders
-- - COUNT(DISTINCT) prevents double-counting of duplicate order IDs
-- - GROUP BY aggregates metrics at the individual customer level
--
-- EXPECTED BUSINESS INSIGHTS:
-- ✓ Customer acquisition vs. retention analysis
-- ✓ Identification of high-value vs. low-engagement customers
-- ✓ Customer base segmentation by purchasing patterns
-- ✓ Foundation for customer reactivation campaigns
-- 
-- OUTPUT COLUMNS:
-- 1. customer_id     : Unique identifier for each customer
-- 2. customer_name   : Full name of the customer
-- 3. email           : Contact email (for follow-up on low-engagement customers)
-- 4. age             : Demographic data for segmentation analysis
-- 5. total_orders    : Number of distinct orders placed (0 for inactive customers)
-- 6. total_order_value : Total revenue generated from customer
--
-- PERFORMANCE NOTES:
-- - Index on customers.customer_id and orders.customer_id recommended
-- - For large datasets, consider materialized view for frequent reporting
-- - Query includes all customer fields; trim SELECT if only metrics needed
--
-- DATA QUALITY CONSIDERATIONS:
-- - Assumes order_id is unique in orders table
-- - Handles missing order records gracefully with COALESCE
-- - Includes customers with potentially incomplete profile data
-- ============================================================================

SELECT
	c.customer_id,
    c.customer_name,
    c.email,
    c.age,
    COALESCE(COUNT(DISTINCT o.order_id), 0) AS total_orders,
    -- DISTINCT prevents duplicate counting if data integrity issues exist
        -- Represents customer engagement frequency
    COALESCE(SUM(o.order_amount), 0) AS total_order_value
    -- Cumulative lifetime value from customer
        -- Key metric for customer valuation and prioritization
    
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
-- LEFT JOIN preserves ALL customers regardless of order activity
-- Essential for complete customer base analysis
-- Join condition matches customer records with their order history
-- Customers without matching orders will have NULL order fields
GROUP BY
	c.customer_id,
    c.customer_name,
    c.email,
    c.age
ORDER BY 
total_order_value DESC, -- Primary sort: Highest revenue customers first
						-- Enables quick identification of top clients
total_orders DESC; -- Secondary sort: Order frequency within same value
				   -- Breaks ties and shows most active customers
