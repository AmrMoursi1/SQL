/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
   This guide covers various SELECT query techniques used for retrieving, 
   filtering, sorting, and aggregating data efficiently.

   Table of Contents:
     1. SELECT ALL COLUMNS
     2. SELECT SPECIFIC COLUMNS
     3. WHERE CLAUSE
     4. ORDER BY
     5. GROUP BY
     6. HAVING
     7. DISTINCT
     8. TOP
     9. Combining Queries
	 10. COOL STUFF - Additional SQL Features
================================================================================= */



/* ==============================================================================
   COMMENTS
=============================================================================== */

-- This is a single-line comment.

/* This
   is
   a multiple-line
   comment
*/



/* ==============================================================================
   SELECT ALL COLUMNS
=============================================================================== */

-- Retrieve All Customer Data
USe MyDatabase
SELECT *
FROM customers

-- Retrieve all Order Data
SELECT *
FROM orders

/* ==============================================================================
   SELECT A FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score
SELECT 
	first_name, 
	country, 
	score
FROM customers
/* ==============================================================================
   WHERE Claus- 
   What exactly is WHERE? We use WHERE in order to filter our data based on a condition
   and any data fulfills the condition will show in the result
   ** Score Higher than 500
   ** Country ='Egypt' 
   ** etc
=============================================================================== */

-- 1- Retrieve customers with a score not equal to 0
-- 2- Retrieve the name and country of customers from Germany

-- 1
SELECT *
FROM customers
WHERE score != 0

-- 2 
SELECT 
	first_name,
	country
FROM customers 
WHERE country = 'Germany'

/*=============================================================================== 
ORDER BY 
We use this kind of Clous when we need to sort our data
You have to decide on two mechanisms, either to sort your data 

ASC: ascending from the lowest value to the highest value, or 
DESC: descending from the highest to the lowest

-- If you don't specify the mechanism, the default will be ASC
=============================================================================== */

-- Retrieve all customers and sort the results by the highest score first

SELECT *
FROM customers
ORDER BY  score DESC 

-- Retrieve all customers and sort the results by the Lowest score first

SELECT *
FROM customers
ORDER BY  score ASC

/* Retrieve all customers and 
   sort the results by country and then by the highest score. */

SELECT *
FROM customers 
ORDER BY country ASC, score DESC

/* Retrieve the name, country, and score of customers 
   whose score is not equal to 0
   and sort the results by the highest score first. */

SELECT 
	first_name,
	country,
	score
FROM customers
WHERE score != 0
ORDER BY  score DESC



SELECT
	first_name,
	country,
	score 
FROM customers
WHERE score != 0
ORDER BY score DESC

/* ==============================================================================
   GROUP BY
=============================================================================== */
-- Find the total score for each country

SELECT
	country,
	sum(score)
FROM customers
GROUP BY country

-- Find the total score and total number of customers for each country

SELECT
	country,
	sum(score) AS total_scor,  
	count(id) AS total_customer 
FROM customers
GROUP BY country

/*==============================================================================
Having 
Filter Aggregated Data
Filtering data after aggregation can be used only with GROUP BY
============================================================================== */
/*
-- Find the average score for each country, considering only customers with a score not equal to 0 
-- Return only those countries with an average greater than 420
-- Sort the results by the highest average score first.*/

SELECT 
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score)> 420
ORDER BY AVG(score) DESC

/*==============================================================================
DISTINCT
Almost equivalent to UNIQE in Python
Return a unique list of a column
==============================================================================*/

-- Return a unique list of all countries

SELECT DISTINCT country 
FROM customers

/*==============================================================================
TOP

SELECT top 3 *
FROM customers

==============================================================================*/
-- Retrieve only 3 Customers

SELECT * FROM customers
LIMIT 3

-- Retrieve the Top 3 Customers with the Highest Scores

SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3

-- Retrieve the Lowest 2 Customers based on the score

SELECT *
FROM customers
ORDER BY score ASC
LIMIT 2

-- Get the Two Most Recent Orders

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 2

-- Find the two oldest orders.
SELECT *
FROM orders
ORDER BY order_date ASC
LIMIT 2
