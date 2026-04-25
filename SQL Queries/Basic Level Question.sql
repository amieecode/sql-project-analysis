use olist_db;

/*Basic Question*/

/*Que1: List all unique cities where customers are located*/
SELECT COUNT(DISTINCT customer_city) AS total_unique_cities
FROM customers;

/*Que2: Count the number of orders placed in 2017*/
SELECT 
    YEAR(order_purchase_timestamp) AS order_year, 
    COUNT(distinct order_id) AS total_orders
FROM orders
WHERE YEAR(order_purchase_timestamp) = 2017
GROUP BY YEAR(order_purchase_timestamp);

SELECT COUNT(*) FROM orders;
SELECT COUNT(DISTINCT order_id) FROM orders;
/*Que3: Find the total sales per category*/
SELECT 
    p.product_category, 
    SUM(oi.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN payments pay ON oi.order_id = pay.order_id
GROUP BY p.product_category
ORDER BY total_revenue DESC
LIMIT 10; 

/*Que4: Calculate the percentage of orders that were paid in installments*/
SELECT 
    CASE 
        WHEN payment_installments > 1 THEN 'Installments' 
        ELSE 'Single Payment' 
    END AS payment_type,
    COUNT(*) AS total_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage
FROM payments
GROUP BY 1;

/*Que5: Count the number of customers from each state*/
SELECT 
    customer_state, 
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC
limit 10;