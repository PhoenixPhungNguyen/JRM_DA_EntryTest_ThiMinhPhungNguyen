# 🍕 Business Insights & Recommendations – Pizza Sales 2015

## 📊 Overview

This project provides detailed insights into pizza sales throughout **2015**. It analyzes quarterly, monthly, daily, and hourly trends, as well as performance by **pizza category, size, and ingredients**. Top and bottom-performing pizzas are also identified by **revenue, quantity**, and **number of orders**.

These insights aim to help the company understand customer behavior and make informed, data-driven decisions to **expand operations** and **increase profitability**.

The dataset includes order details from 2015, capturing the exact **date and time** of each order and the **quantity** of each pizza type and size sold.

---

## 🎯 Project Goals

- Calculate total Revenue, Total Quantity Sold, Total Orders, Average 
  Order Value, Average Pizzas per Order.
- Analyze daily, weekly, quarterly and monthly sales trends.
- Investigate daily spikes and drops in sales and identify potential causes.
- Identify peak sales periods, patterns and seasonal trends.
- Analyze sales performance by day of the week and hour.
- Analyze sales voulume Trends by pizza size and category.
- Rank pizza categories by total quantity sold and revenue.
- Identify top 5 and bottom 5 pizzas by quantity and revenue.
- Explore the correlation between sale correlation by ingredient.
- Explore the correlation between price and sales by category.
- Examine price vs. quantity correlations, revenue vs. quantity correlations. 
- Analyze the ratio of single-item vs. multi-item orders
- Calculate average, maximum, and minimum time intervals between orders
- Analyze the ingredient popularity by pizza category.
---

## 🧮 Data Transformation

The raw data was cleaned and organized into **6 relational tables** for efficient analysis:
| Table Name     | Description |
|----------------|-------------|
| `Pizza`     | Contains pizza ID, category ID, name |
| `PizzaType`    | Contains category ID and name|
| `Ingredients`        | Contains ingredients  |
| `Ingredients Pizza`        | Contains pizza ID and ingredients  |
| `Order`        | Contains order ID, date and time|
| `OrderDetails` | Contains order ID, pizza ID, size, price, quantity |

## 🧮 Data Modelling

<img src="assets/modelView.png" width="600px">

---

## 📈 Dashboard Insights (Power BI)
**1. KPI and Sales Dashboard**
The total sales increase from Quarter 1 to Quarter 2 with the top peak at
$2.57 billion and decreased significantly from Quarter 4.
February, September, October and December had the lowest sales compared to other months.
Sales remained stable in Week 2,3, and 4, but showed a decined in Week 1,5 and 6.
Friday had the highest revenue at $1.102 billion, followed by Thursday and Saturday. Sunday had the lowest revenue at $568.992 million.
The highest number of orders occurred between 12 PM and 1 PM from Monday to Friday, and between 5 PM and 6 PM from Monday to Sunday.

<img src="assets/KPI&Sales_Dashboard.png" width="700px">

**2. Product Dashboard**

The large size of pizza was the most preferred by customers.In contrast, the XXL size of pizza was the least preferred by clients.
The classic category is highest in term of quantity (15k) and revenue (3.2 billion).

<img src="assets/Product_Dashboard.png" width="700px">

**3. Order and Ingredient Dashboard**

Multi-item orders accounted for 61.59% (13.15k) while Single-item accounted for 38.41% (8.2k)  of total orders 
3 top ingredients by frequency and quantity was Tomatoes, Red Peppers and Chicken as follow:
  Tomato: 7,693 (Classic), 4,322 (Supreme), 907 (Veggie)
  Red Peppers: 8,680 (Chicken), 3,891 (Supreme)
  Chicken: 8,618 (Chicken category)

<img src="assets/Order&Ingredient_Dashboard.png" width="700px">

---

## ✅ Business Recommendations

1. **Focus Marketing on Classic Pizzas**  
   → Promote best-performing category to boost already strong sales.

2. **Launch Campaigns in July, November, and January**  
   → Maximize revenue during known peak months with targeted promotions.

3. **Encourage Upgrades from Single-Item Orders**  
   → 38.41% of orders are single-item.
   → Offer combo deals or limited-time upsell campaigns.

4. **Review Bottom 5 Low-Performing Pizzas**  
   → Consider removing or improving based on sales data.
   
6. **Add Weekday & Time-of-Day Analysis**  
   → Helps optimize staffing and campaign scheduling.


