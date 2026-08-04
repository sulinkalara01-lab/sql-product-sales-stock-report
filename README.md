# Product Sales and Inventory Report

This repository contains a SQL query designed to analyze sales performance and inventory availability for selected product categories.

## 📊 Query Overview

The script joins the product catalog with order items to generate:
- **Total Revenue (`total_facturado`):** The sum of generated sales (`quantity * unit_price`), using `COALESCE` to default to `0` for unsold products.
- **Stock Status (`stock_status`):** Real-time inventory classification:
  - `Out of Stock`: 0 units available.
  - `Running Out of Stock`: Between 1 and 10 units available.
  - `Sufficient`: More than 10 units available.

## 🎯 Filtering Criteria

Only key categories meeting specific price thresholds are included:
- **Electronics:** Price greater than $1.
- **Clothing:** Price greater than $1.
- **Sports:** Price greater than $50.

## 🛠️ Prerequisites

The target database should contain the following table structures:

- `products`: (`product_id`, `name`, `category`, `price`, `stock_quantity`)
- `order_items`: (`product_id`, `quantity`, `unit_price`)
