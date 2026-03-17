use olist_db;

/*Basic Question*/

/*Que1: List all unique cities where customers are located*/
SELECT DISTINCT customer_city
FROM mastertable;

/*Que2: Count the number of orders placed in 2017*/
SELECT COUNT(DISTINCT order_id) AS total_orders_2017
FROM mastertable
WHERE YEAR(order_purchase_timestamp) = 2017;

/*Que3: Find the total sales per category*/
SELECT product_category, SUM(payment_value)  AS total_sales 
FROM mastertable
GROUP BY product_category
ORDER BY total_sales DESC;

/*Que4: Calculate the percentage of orders that were paid in installments*/
SELECT (COUNT(CASE WHEN payment_installments > 1 THEN 1 END) * 100
/ count(DISTINCT order_id)) AS installements_percentage
from mastertable;

/*Que5: Count the number of customers from each state*/
SELECT customer_state, COUNT(DISTINCT customer_unique_id) AS total_customer
from mastertable
GROUP BY customer_state
ORDER BY total_customer DESC;