### Kultra Mega Stores (KMS) Inventory Analysis

**Project Overview**:

Kultra Mega Stores (KMS) is a Lagos-based retailer specializing in office supplies and furniture, serving customers across Lagos and Abuja. As part of my Business Intelligence training with **DSA Incubatorhub**, I was tasked to analyze KMS’s order data (2009–2012) using SQL and extract actionable insights for the Abuja division.

This project includes:

- Data ingestion and exploration
- Business questions answered using SQL
- Recommendations for improving sales and reducing operational inefficiencies

 **Tools Used**:

  - Microsoft SQL Server Management Studio (SSMS)
  - SQL (DDL & DML)

**Project Files**:

  - DSA_SQL_Project.sql – Contains all queries and table creation scripts
  - README.md – Project summary and insights

 **Case Scenario I – Business Questions & Answers**:

1. **Product category With the highest sales?**
   
   - Office Supplies had the highest total sales.
   - (From: ORDER BY Total_Sales DESC on Product\_Category)

2. **Top 3 regions in terms of sales?**

    **Top 3**:
     1. Central
     2. East
     3. West

    **Bottom 3 regions in terms of sales?**:

      **Bottom 3**:
     1. South
     2. North-East
     3. North-West

3. **Total sales of appliances in Ontario?**
   
      -  = ₦3,480.00
      - (From the query filtering Product_Category = 'Appliances' AND Province = 'Ontario')
 
5. **Advice on increasing revenue from the bottom 10 customers**

      - Offer personalized promotions and discounts
      - Implement a customer loyalty program
      - Upsell through bundled offers and free shipping
      - Provide customer success support to understand their needs
      - Follow-up via email marketing campaigns to increase engagement

6. **Shipping method with the highest cost?**
   
      - = Express Air
      - (From: ORDER BY Total_Shipping_cost DESC)

---

**Case Scenario II – Advanced Analysis**:

6. **Most valuable customers and what they purchase?**
   
 - The top customers typically purchased:
     - Office Supplies
     - Technology Products
     - (Based on Top 10 customers product category breakdown)

7. **Highest spending small business customer?**
   
      - = James Haddadin with ₦6,580.00 in total sales
      - (From query filtered on Customer_Segment = 'Small Business')

8. **Corporate customer with most orders (2009–2012)?**
    
      -  = James Haddadin placed the highest number of orders
      - (Based on COUNT(Order_ID) from Customer_Segment = 'Corporate')

9. **Most profitable consumer customer?**
    
      - = Clay Rozendal with ₦1,636.00 in total profit
      - (From WHERE Customer_Segment = 'Consumer' ORDER BY Total_Profit DESC)

10. **Which customer returned items, and what segment do they belong to?**

   - Customers who returned items (Profit < 0) include:
      - Daniel Finitz – Consumer
      - Stefanie Copperstone – Small Business
      - Lisa Cummings – Consumer

12. **Did the company spend wisely on shipping based on order priority?**
    
  - Yes,Partially.The shipping cost analysis shows:
      - Express Air was often used for Low and Medium priority orders
      - Delivery Truck (cheapest) was sometimes used for Critical orders
      - This indicates misalignment between shipping cost and urgency
    
---

 **Recommendations to KMS Management**:

- Customer Segmentation: Focus on turning low-spending customers into repeat buyers through incentives and personalized offers.
- Shipping Optimization: Match shipping methods more closely with order priority to avoid overspending.
- Product Focus: Continue to promote Office Supplies and Technology, the top-selling categories.
- Returns Monitoring: Reduce returns by improving product accuracy, pre-sale customer education, and stronger support.
- Enforce strict rules tying Order Priority to the most appropriate Shipping Mode to reduce unnecessary costs and ensure timely delivery.

---

##### About Me

My name is **Kolapo Ilerioluwa Great-Grace**, a passionate data analyst in training. This project is part of my SQL journey during my 4-month training at **DSA Incubatorhub**. I am growing in my ability to draw insights from raw data and present strategic recommendations to businesses.

---

##### Connect with Me

- @ http://linkedin.com/in/kolapo-ilerioluwa-830530246
- @ https://github.com/GEEGEE1205

