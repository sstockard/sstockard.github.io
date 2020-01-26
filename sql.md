---
layout: default
---

# SQL Query of Retail Data

## Background 

I ran basic SQL queries on the following tables: 

[**features:**](./sql/features.txt) Store, Date, Temperature, Fuel_Price, Markdown1, Markdown2, Markdown3, Markdown4, Markdown5, CPI, Unemployment, IsHoliday

[**stores:**](./sql/stores.csv) Stores, Size, Type

[**sales:**](./sql/sales.txt) Store, Date, Dept, Weekly_Sales, IsHoliday

Note: I first mutated the "Date" columns in each table using dyplr package in R so they would be the same format

## Code

#### Queries
```
---PREVIEW TABLES

---FEATURES
SELECT * 
FROM features
LIMIT 10

---SALES
SELECT *
FROM sales
LIMIT 10

---STORES
SELECT *
FROM stores
LIMIT 10

---AVERAGE SALES PER STORE

SELECT Store, sum(Weekly_Sales) as total_store_sales
FROM sales
GROUP BY Store
ORDER BY Store

---AVERAGE SALES PER DEPARTMENT FOR STORE 1

SELECT Dept, avg(Weekly_Sales) as avg_dept_sales
FROM sales
WHERE Store = 1
GROUP BY Dept

---AVG WEEKLY DEPT SALES PER STORE TYPE

SELECT s1.Type, AVG(s2.Weekly_Sales) as avg_dept_sales
FROM stores as s1
LEFT JOIN sales as s2
on s1.Store = s2.Store
GROUP BY Type

---MAX DEPT SALES PER STORE TYPE

SELECT s1.Type, Date, MAX(s2.Weekly_Sales) as max_dept_sales
FROM stores as s1
LEFT JOIN sales as s2
on s1.Store = s2.Store
GROUP BY Type

---FUEL PRICE ON MAX SALES WEEK PER STORE TYPE

SELECT s1.Type, f.Date, MAX(s2.Weekly_Sales) as max_weekly_sales, f.Fuel_Price
FROM stores as s1
LEFT JOIN sales as s2
on s1.Store = s2.Store
LEFT JOIN features as f
on s1.Store = f.Store
GROUP BY Type

---FUEL PRICE ON MIN SALES WEEK PER STORE TYPE

SELECT s1.Type, f.Date, MAX(s2.Weekly_Sales) as max_sales, f.Fuel_Price
FROM stores as s1
LEFT JOIN sales as s2
on s1.Store = s2.Store
LEFT JOIN features as f
on s1.Store = f.Store
GROUP BY Type

---QUERY STORE SIZES

SELECT avg(Size) as avg_size, min(Size) as min_size, max(Size) as max_size
FROM Stores

---MAX WEEKLY DEPT SALES PER STORE SIZE

SELECT avg(s2.Weekly_Sales) as avg_sales,
CASE WHEN Size > 150000 THEN 'large'
WHEN Size > 75000 THEN 'medium'
ELSE 'small' END 
AS store_size_group
FROM stores AS s1
INNER JOIN sales as s2
on s1.Store = s2.Store
GROUP BY store_size_group

```

