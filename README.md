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

