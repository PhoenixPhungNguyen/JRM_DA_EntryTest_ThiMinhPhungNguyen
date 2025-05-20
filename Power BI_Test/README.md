# 🍕 Business Insights & Recommendations – Pizza Sales 2015

## 📊 Overview

This project provides detailed insights into pizza sales throughout **2015**. It analyzes quarterly, monthly, daily, and hourly trends, as well as performance by **pizza category, size, and ingredients**. Top and bottom-performing pizzas are also identified by **revenue, quantity**, and **number of orders**.

These insights aim to help the company understand customer behavior and make informed, data-driven decisions to **expand operations** and **increase profitability**.

The dataset includes order details from 2015, capturing the exact **date and time** of each order and the **quantity** of each pizza type and size sold.

---

## 🎯 Project Goals

### 🔹 Key Performance Indicators (KPIs)
- Total Revenue  
- Total Quantity Sold  
- Total Orders  
- Average Order Value  
- Average Pizzas per Order

### 🔹 Sales Trends & Anomalies
- Analyze daily, weekly, and monthly sales trends
- Identify peak sales periods and seasonal patterns
- Review performance by day of the week and time of day
- Investigate spikes or drops in sales and identify potential causes

### 🔹 Product Performance Analysis
- Rank pizza categories by total quantity sold and revenue
- Identify top 5 and bottom 5 pizzas by quantity and revenue

### 🔹 Size & Ingredient Analysis
- Analyze the relationship between pizza size and sales volume
- Identify most and least popular ingredients by category

### 🔹 Order & Ingredient Correlation
- Explore correlations between specific ingredients and sales metrics
- Segment using average reference lines and calculate correlation coefficients
- Examine price vs. quantity correlations

### 🔹 Order Frequency & Timing
- Analyze the ratio of single-item vs. multi-item orders
- Calculate average, maximum, and minimum time intervals between orders

---

## 🧮 Data Transformation

The raw data was cleaned and organized into **7 relational tables** for efficient analysis:

![Pizza Sales Dashboard](assets/modelView.png)

| Table Name     | Description |
|----------------|-------------|
| `Category`     | Category ID and category name |
| `PizzaType`    | Pizza type ID, name, category ID, and ingredients |
| `Pizza`        | Pizza ID, size, price, pizza type ID |
| `Order`        | Order ID, order date and time |
| `OrderDetails` | Order ID, pizza ID, and quantity |

---

## 📈 Dashboard Insights (Power BI)

![Pizza Sales Dashboard](assets/SalesTrend&Product_Dashboard.png)

Some of the key findings from the dashboard:

- **Classic pizzas** generated the highest revenue and sales quantity  
  → ~20K units, ~16.82B revenue  
  → Source: *Total Quantity by Category*, *Total Revenue by Category*

- **Peak sales months**: **July**, **November**, and **January**  
  → Source: *Total Revenue by Month*
  
![Pizza Sales Dashboard](assets/OrderCorrelation_Dashboard.png)

- **Multi-item orders** accounted for **61.59%** of total orders  
  → Multi-item: 13.15K, Single-item: 8.2K  
  → Source: *Order Type Breakdown*

![Pizza Sales Dashboard](assets/SizeIngredient&OrderFrequencyTiming_Dashboard.png)

- **Most popular sizes**: L and XL pizzas  
  → Source: *Total Quantity by Size and Category*

- **Top Ingredients** (by frequency & quantity):
  - **Tomatoes**: 7,693 (Classic), 4,322 (Supreme), 907 (Veggie)
  - **Red Peppers**: 8,680 (Chicken), 3,891 (Supreme)
  - **Chicken**: 8,618 (Chicken category)

---

## ✅ Business Recommendations

1. **Focus Marketing on Classic Pizzas**  
   → Promote best-performing category to boost already strong sales

2. **Launch Campaigns in July, November, and January**  
   → Maximize revenue during known peak months with targeted promotions

3. **Encourage Upgrades from Single-Item Orders**  
   → 38.41% of orders are single-item  
   → Offer combo deals or limited-time upsell campaigns

4. **Review Bottom 5 Low-Performing Pizzas**  
   → Consider removing or improving based on sales data

5. **Investigate Anomalies in Order Timing**  
   → Example: -53 minutes between some orders → possible data error

6. **Add Weekday & Time-of-Day Analysis**  
   → Helps optimize staffing and campaign scheduling


