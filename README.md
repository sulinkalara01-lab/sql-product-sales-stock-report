# Product Sales & Inventory Analysis (SQL Portfolio)

Welcome to the **Product Sales & Inventory Analysis** repository. This project consists of a collection of analytical SQL queries designed to extract key insights regarding sales revenue, pricing benchmarks, stock inventory management, and month-over-month (MoM) performance trends from a relational e-commerce database.

---

## 📌 Repository Overview

This repository demonstrates the practical application of intermediate to advanced SQL clauses, including:
- **Window Functions** (`ROW_NUMBER()`, `LAG()`)
- **Common Table Expressions (CTEs)** (`WITH ... AS`)
- **Aggregations & Grouping** (`SUM()`, `AVG()`, `GROUP BY`)
- **Conditional Logic** (`CASE WHEN`, `COALESCE`)
- **Table Joins** (`LEFT JOIN`, `INNER JOIN`)
- **Date & Time Manipulation** (`DATE_TRUNC()`)

All queries are built around a unified e-commerce database schema, operating on interconnected tables for products, orders, and order line items.

---

## 🛠️ Database Schema & Prerequisites

To execute these queries, your database environment should contain the following tables and relationships:

* **`products`**: `(product_id, name, category, price, stock_quantity)`
* **`orders`**: `(order_id, order_date, customer_id, ...)`
* **`order_items`**: `(order_id, product_id, quantity, unit_price)`

---

## 🚀 Queries & Scripts Summary

### 1. Product Sales Performance & Stock Status Report
* **Objective:** Analyzes total revenue per product and categorizes current stock availability into actionable inventory states.
* **Key Techniques:** `LEFT JOIN`, `COALESCE`, `CASE WHEN`, Conditional Filtering (`WHERE`).

```sql
-- Analyze product sales performance and classify stock inventory status
SELECT 
    p.name, 
    p.category,
    SUM(COALESCE(oi.quantity * oi.unit_price, 0)) AS total_facturado,
    CASE
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity BETWEEN 1 AND 10 THEN 'Running Out of Stock'
        ELSE 'Sufficient'
    END AS stock_status
FROM products AS p
LEFT JOIN order_items AS oi 
    ON p.product_id = oi.product_id
WHERE (p.category = 'Electronics' AND p.price > 1)
   OR (p.category = 'Clothing' AND p.price > 1)
   OR (p.category = 'Sports' AND p.price > 50)
GROUP BY 
    p.product_id, 
    p.name, 
    p.category, 
    p.stock_quantity;
