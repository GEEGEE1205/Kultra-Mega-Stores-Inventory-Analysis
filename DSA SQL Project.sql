CREATE DATABASE KMS_Orders;
GO

USE KMS_Orders;
Go

----- Creating Table ---

CREATE TABLE KMS(
Row_ID INT PRIMARY KEY,
Order_ID INT ,
Order_Date DATE,
Order_Priority NVARCHAR(100),
Order_Quantity INT,
Sales Decimal(10,2),
Discount Decimal(4,2),
Ship_Mode VARCHAR(50),
Profit Decimal(10,2),
Unit_Price Decimal(10,2),Shipping_Cost Decimal(10,2),
Customer_Name VARCHAR(100),
Province VARCHAR(50),
Region VARCHAR(50),
Customer_Segment VARCHAR(50),
Product_Category VARCHAR(50),
Product_Sub_Category VARCHAR(100),
Product_Name NVARCHAR(100),
Product_Container NVARCHAR(50),
Product_Base_Margin Decimal(4,2),
Ship_Date DATE
);


----Product Category with Highest Sales ----

SELECT TOP 3 Product_category, SUM(Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
GROUP BY Product_category
ORDER BY Total_Sales DESC;

---- Top 3 regions by sales ----

SELECT TOP 3 Region, SUM(Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
GROUP BY Region
ORDER BY Total_Sales DESC;

---- Bottom 3 regions by sales -----

SELECT TOP 3 region, SUM(Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
GROUP BY Region
ORDER BY Total_Sales ASC;

---- Total sales of appliances in Ontario ----

SELECT SUM(Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
WHERE Product_Category = 'Appliances' AND Province = 'Ontario';

---- Bottom 10 customers by total revenue ----

SELECT TOP 10 Customer_Name, SUM(Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
GROUP BY Customer_Name
ORDER BY total_sales ASC;

---- Shipping method with highest cost ----

SELECT TOP 1 Ship_Mode, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
GROUP BY Ship_Mode
ORDER BY Total_Shipping_cost DESC;

---- Most valuable customers and what they purchase -----

WITH Top_Customers AS (
    SELECT TOP 10 Customer_Name
    FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
    GROUP BY Customer_Name
    ORDER BY SUM(Sales) 
	DESC )

SELECT o.Customer_Name, o.Product_Category, SUM(o.Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy] o
JOIN Top_Customers t ON o.Customer_Name = t.Customer_Name
GROUP BY o.Customer_Name, o.Product_Category
ORDER BY o.Customer_Name, Total_Sales DESC;

---- Top small business customer by sales ----

SELECT TOP 1 Customer_Name, SUM(Sales) AS Total_Sales
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

---- Corporate customer with most orders (2009–2012) ----

SELECT TOP 1 k.Customer_Name, COUNT(k.Order_ID) AS Order_Count
FROM [dbo].[KMSSqlCaseStudy] k
JOIN [dbo].[Order_Status] o ON k.Order_ID = o.Order_ID
WHERE k.Customer_Segment = 'Corporate'
  AND YEAR(k.Order_Date) BETWEEN 2009 AND 2012
GROUP BY k.Customer_Name
ORDER BY Order_Count DESC;

---- Most profitable consumer customer ----

SELECT TOP 1 customer_name, SUM(Profit) AS total_profit
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;

---- Customers who returned items (negative profit) ----

SELECT DISTINCT Customer_Name, Customer_Segment
FROM [dbo].[Order_Status],[dbo].[KMSSqlCaseStudy]
WHERE Profit < 0;

---- Shipping cost vs order priority ----

SELECT Order_Priority, Ship_Mode,
       AVG(Shipping_Cost) AS Avg_Shipping_Cost,
       COUNT(Order_ID) AS Total_Orders
FROM [dbo].[KMSSqlCaseStudy]
GROUP BY Order_Priority, Ship_Mode;



