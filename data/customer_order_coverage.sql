-- Task 2; Customer Order Average
SELECT
	c.customer_id,
    c.customer_name,
    c.email,
    c.age,
    COALESCE(COUNT(DISTINCT o.order_id), 0) AS total_orders,
    COALESCE(SUM(o.order_amount), 0) AS total_order_value
