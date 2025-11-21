-- 1. View all customers
SELECT * FROM customers;

-- 2. View all products
SELECT * FROM products;

-- 3. View all inventory levels
SELECT 
    products.product_name,
    inventory.quantity_in_stock
FROM inventory
JOIN products ON inventory.product_id = products.product_id;

-- 4. View all orders with customer and product names
SELECT 
    orders.order_id,
    customers.customer_name,
    products.product_name,
    orders.quantity,
    orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;

-- 5. Total revenue per product
SELECT 
    products.product_name,
    SUM(orders.quantity * products.price) AS total_revenue
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC;

-- 6. Total number of orders per customer
SELECT 
    customers.customer_name,
    COUNT(orders.order_id) AS total_orders
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_name
ORDER BY total_orders DESC;

-- 7. Which products are selling the most? (by quantity)
SELECT 
    products.product_name,
    SUM(orders.quantity) AS total_quantity_sold
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_quantity_sold DESC;

-- 8. Daily sales summary
SELECT 
    order_date,
    SUM(quantity) AS total_units_sold
FROM orders
GROUP BY order_date
ORDER BY order_date;
