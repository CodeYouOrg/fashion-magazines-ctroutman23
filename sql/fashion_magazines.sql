-- query to filter customers name and total
-- amount of money they owe for each customer
-- in unpade mag. subs. 
-- Column names should be "Customer"
-- and "Amount Due"

-- Step 1: view tables
-- SELECT *
-- FROM orders
-- LIMIT 5;

-- SELECT *
-- FROM subscriptions
-- LIMIT 5;

-- SELECT * 
-- FROM customers
-- LIMIT 5;

-- Step 2: select desired columns from combined table
SELECT customers.customer_name as 'Customer',
PRINTF('$%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length))
as 'Amount Due'
FROM orders
INNER JOIN customers 
  ON orders.customer_id = customers.customer_id  
INNER JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = 'unpaid' AND 
      subscriptions.description = 'Fashion Magazine'
GROUP BY customers.customer_name;
