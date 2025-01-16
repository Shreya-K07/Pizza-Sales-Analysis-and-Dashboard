create database Pizza_DB;
use Pizza_DB;
SELECT *from pizza_sales;

SET sql_mode = '';
SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';

/*Total_Revenue*/
select sum(total_price) as Total_Revenue from pizza_sales;

/*Average Order Value*/
select (sum(total_price) / count(distinct order_id))as Avg_Order_Value  from pizza_sales; 	

/*Total Pizza Sold*/
select sum(quantity) as Total_Pizza_Sold from pizza_sales;

/*Total_Orders*/
select count(distinct order_id)as Total_Orders from pizza_sales;

/*Avg Pizzas per order*/
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(count(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) as Avg_Pizzas_per_order from pizza_sales;

DESCRIBE pizza_sales;

SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day, 
    COUNT(order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));


/* % of Sales by Pizza Category*/
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


/* % of Sales by Pizza Size*/
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

/*Total Pizzas Sold by Pizza Category*/
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

/*Top 5 Pizzas by Revenue*/
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

/*Bottom 5 Pizzas by Revenue*/
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;

/*Top 5 Pizzas by Quantity*/
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

/* Bottom 5 Pizzas by Quantity*/
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
limit 5;

/*Top 5 Pizzas by Total Orders*/
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;

/*Bottom 5 Pizzas by Total Orders*/
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
limit 5;

