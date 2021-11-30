/*
Powerful Queries
*/

-- Sum the number of payments for each user.
SELECT customer_name, count(*) 
FROM payments
GROUP BY customer_name
GROUP BY count DESC;

-- Sum the payment amount for each month.
SELECT sum(amount), extract(year from processed_at) as year, exttract(month from processed_at) as month
FROM payments
GROUP BY customer_name, month, year
GROUP BY customer_name DESC;

-- Find the largest single-user payments for each month
SELECT MAX(amount), extract(year from processed_at) as year, extract(month from processed_at) as month
FROM (
    SELECT customer_name, sum(amount), extract(year from processed_at) as year, extract(month from processed_at) as month
    FROM payments
    GROUP BY customer_name, month, year
) AS monthly_sums
GROUP BY year, month;

/*
Transactions
*/

-- Transfer 100 from Aman to Linkan.
BEGIN TRANSACTION;
UPDATE balances SET balance = balance - 100 WHERE username = "Aman";
UPDATE balances SET balance = balance + 100 WHERE username = "Linkan";
COMMIT;

/*
Indexes
*/

--Find the 10 largest ints.
SELECT * FROM large_table ORDER BY random_int DESC LIMIT 10;

-- Create an index on the ints inthe table.
CREATE INDEX large_table_random_int ON large_table(random_int);