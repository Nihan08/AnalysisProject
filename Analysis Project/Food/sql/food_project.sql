-- 🍕 Food Delivery Orders Project

CREATE DATABASE IF NOT EXISTS food_project;
USE food_project;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100)
);

CREATE TABLE restaurants (
  restaurant_id VARCHAR(10) PRIMARY KEY,
  restaurant_name VARCHAR(100),
  city VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  restaurant_id VARCHAR(10),
  amount FLOAT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO customers VALUES
(1,'Anu'),(2,'Bala'),(3,'Chitra'),(4,'Deepak');

INSERT INTO restaurants VALUES
('R10','Pizza Palace','Chennai'),('R20','Burger Street','Chennai'),('R30','Curry Corner','Chennai');

INSERT INTO orders VALUES
(1001,'2025-07-01',1,'R10',400),(1002,'2025-07-01',2,'R20',250),
(1003,'2025-07-02',1,'R30',600),(1004,'2025-07-02',3,'R10',350),
(1005,'2025-07-03',4,'R20',300),(1006,'2025-07-03',1,'R10',450);

-- Total revenue by restaurant
SELECT r.restaurant_name, SUM(o.amount) AS total_revenue
FROM orders o JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name ORDER BY total_revenue DESC;

-- Number of repeat customers
SELECT COUNT(*) AS repeat_customers
FROM (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) > 1) AS sub;

-- Highest single order
SELECT o.order_id, c.customer_name, r.restaurant_name, o.amount
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
ORDER BY o.amount DESC LIMIT 1;
