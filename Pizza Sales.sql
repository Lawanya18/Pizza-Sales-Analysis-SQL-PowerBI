-- KPI Analysis

Select * from pizza_sales;

-- 1. Total Revenue
SELECT 
    SUM(total_price) AS Total_Revenue
FROM
    Pizza_Sales;

-- 2. Average Order Value
SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM
    pizza_Sales;

-- 3. Total Pizzas Sold
SELECT 
    sum(quantity) AS Total_Pizza_Sold
FROM
    pizza_sales; 

-- 4. Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales;

-- 5. Average Pizza Per Order
SELECT 
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id),
            2) AS Average_Pizza_Per_Order
FROM
    pizza_sales;

-- Charts Analysis

-- 1. Daily Trend for Total Orders
SELECT 
    DAYNAME(order_date) AS Order_Day,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Order_Day;

-- 2. Monthly Trend for Total Orders
SELECT 
    MONTHNAME(order_date) AS Month_Name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Month_Name
Order by Total_Orders Desc;

-- 3. Percentage of Sales by Pizza Category
SELECT 
    Pizza_category,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_Sales),
            2) AS Sales_by_Category
FROM
    pizza_sales
GROUP BY pizza_category;

-- 4. Percentage of Sales by Pizza Size
SELECT 
    Pizza_size,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(Total_price)
                FROM
                    pizza_sales),
            2) AS Sales_by_Order_Size
FROM
    pizza_sales
GROUP BY pizza_size
ORDER BY Sales_by_Order_Size DESC;

-- 6. Top 5 Best Sellers by Revenue
SELECT 
    Pizza_name, SUM(Total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY Pizza_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- 7. Bottom 5 Sellers by Revenue
SELECT 
    Pizza_name, SUM(Total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY Pizza_Name
ORDER BY Total_Revenue
LIMIT 5;

-- 8. Top 5 Best Sellers by Quantity
SELECT 
    Pizza_name, SUM(quantity) AS Total_Quantity
FROM
    pizza_sales
GROUP BY Pizza_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- 9. Bottom 5 Sellers by Quantity
SELECT 
    Pizza_name, SUM(quantity) AS Total_Quantity
FROM
    pizza_sales
GROUP BY Pizza_Name
ORDER BY Total_Quantity
LIMIT 5;

-- 10. Top 5 Best Sellers by Orders
SELECT 
    Pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Pizza_Name
ORDER BY Total_Orders DESC
LIMIT 5;

-- 11. Bottom 5 Sellers by Orders
SELECT 
    Pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Pizza_Name
ORDER BY Total_Orders
LIMIT 5;