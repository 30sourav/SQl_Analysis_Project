# E-Commerce SQL Analysis Project

**Description:**  
A collection of 14 real-world SQL tasks to support data-driven decisions in retail and e-commerce. This project includes customer loyalty analysis, product sales insights, delivery performance tracking, and profitability evaluation — all done using raw SQL.

---

##  Tools Used
- MySQL 8.0+
- SQL Workbench / DBeaver / any SQL IDE

---

## Project Highlights

| Task | Business Objective |
|------|--------------------|
| Task 1 | Analyze top-rated colors in women's shoes |
| Task 2 | Identify best-selling product colors |
| Task 3 | Recommend top-rated men’s products with 500+ reviews |
| Task 4 | Rank 100 most loyal customers |
| Task 5 | Find top 2 brands in men’s sports shoes |
| Task 6 | Discover profitable sub-categories |
| Task 7 | Optimize stocking by color with reviews & ratings |
| Task 8 | Analyze delivery performance last year |
| Task 9 | Brand-wise average profit per order |
| Task 10 | Allocate inventory for men’s shoes across 3 states |
| Task 11 | Targeted marketing: top-selling white men’s shoes in California |
| Task 12 | Recommend profitable sub-categories for new store in New York |
| Task 13 | Best-performing brand during summer 2019 |
| Task 14 | Identify top brands in the most profitable category with standard delivery |

## Sample Query

```sql
-- /*Task 6: Top 10 profitable sub-categories by margin
SELECT products.sub_category, 
       (SUM(sales.profit) / SUM(sales.sales)) * 100 AS profit_margin
FROM products
JOIN sales ON products.product_id = sales.product_id
GROUP BY products.sub_category
ORDER BY profit_margin DESC
LIMIT 10;*/
```

---

##  Key Skills Demonstrated
- SQL joins, aggregations, filtering, and subqueries
- Window functions: `RANK()`, `OVER (PARTITION BY ...)`
- Time-based analysis with `DATE_SUB`, `BETWEEN`, `YEAR()`
- Business insight extraction from raw sales data
- Retail KPIs: profit margin, customer loyalty, product performance

## License
This project is open-source and intended for learning and portfolio use.
