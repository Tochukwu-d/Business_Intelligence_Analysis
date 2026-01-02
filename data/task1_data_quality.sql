/* Task 1 — Data Quality Audit
Identify all customers with:
missing email
invalid email
missing age
unrealistic age (< 0 or > 120)
Return: customer_id, customer_name, email, age, issue_flag */

SELECT customer_id, customer_name, email, age,
	CASE
		WHEN email IS NULL THEN 'Missing Email'
		WHEN email NOT LIKE '%_@%_.%_' THEN 'Invalid Email Format'
        WHEN email LIKE '% %' THEN 'Email Contains Spaces'
        WHEN age IS NULL THEN 'Missing Age'
        WHEN age < 0 OR age > 120 THEN 'Unrealistic Age'
        ELSE 'No Issues'
	END AS 'Issue_flag'
FROM customers
WHERE email IS NULL 
    OR email NOT LIKE '%_@%_.%_' 
    OR age IS NULL 
    OR age < 0 
    OR age > 120
ORDER BY issue_flag, customer_id;
        