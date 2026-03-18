show databases;
# Create database sales;
USE sales;
SELECT * FROM sales.sales_cleaned;

#Filtering
SELECT * FROM sales.sales_cleaned
WHERE Region = 'East';

#Aggregation
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales.sales_cleaned
GROUP BY Category;

#Sorting
SELECT * FROM sales.sales_cleaned
ORDER BY Sales DESC;

#Window Function
SELECT 
Customer_Name,
Region,
Sales,
ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Sales DESC) AS rank_num
FROM sales_cleaned;

# Total Sales & Profit
SELECT 
	SUM(sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
 FROM sales_cleaned;   
 
 # Sales by Region
SELECT Region, SUM(Sales) AS Sales
FROM sales.sales_cleaned
GROUP BY Region
ORDER BY Sales DESC;

# Top 5 Products by Profit
SELECT Product, SUM(Profit) AS Profit
From sales.sales_cleaned
GROUP BY Product
ORDER BY Profit DESC
LIMIT 5;

# Monthly Sales Trend
SELECT
	EXTRACT(MONTH FROM Order_Date) AS Month,
    SUM(Sales) AS Monthly_sales
FROM sales.sales_cleaned
GROUP BY MONTH
ORDER BY MONTH;





    
