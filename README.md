# Sales Analysis Dashboard (Power BI-style)

An interactive sales report built from three related tables: **Customer**, **Order** and **Product**.
Covers 1,000 orders from 100 customers across 20 products in 2025.

![Dashboard preview](images/dashboard-preview.png)

## Features
- 5 KPI cards: total revenue, orders, units sold, average order value, active customers
- Monthly revenue and order trend
- Revenue share by category (click a slice to filter)
- Top 10 products and revenue by city
- Top 10 customers table
- Category and City slicers with a Reset button
- Works in light and dark mode, and on mobile

## Key numbers
- Total revenue: about ₹1.67 Cr across 1,000 orders
- Average order value: about ₹16,731
- Electronics is the dominant category; Laptop, Smartphone and Tablet lead product revenue
- Hyderabad and Mumbai are the top cities by revenue

## How to run
Open `index.html` in any browser (needs internet once, to load Chart.js from a CDN).

To host it free: GitHub repo → **Settings → Pages → Deploy from branch → main / root**.

## Data
`data/Book1.xlsx` contains the raw Customer, Order and Product tables.
Revenue = `quantity × price` (joined through `product_id`).

## Tools
HTML, CSS, JavaScript, Chart.js. Data prepared with Python (openpyxl).
