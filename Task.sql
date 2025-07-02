----Task1----

Select color, avg(average_rating) as rating from products
where sub_category="Women/shoes"
group by color
order by rating desc;

---Task2---

select p.color, sum(s.item_sold) as items_sold from products as p
inner join
(select max(product_id)as product_id, sum(quantity) as item_sold from sales group by product_id) as s
on s.product_id = p.product_id
group by p.color
ORDER BY `items_sold` DESC Limit 5;

---Task3---


Select product_id, MAX(product_name) as product_name,AVG(average_rating) AS rating,
SUM(reviews_count) AS reviews_count from products
where sub_category like 'men%'
group by product_id
having SUM(reviews_count) > 500
order by rating limit 50;

---Task4---

SELECT c.customer_id, c.customer_name,SUM(s.quantity) as item_bought
from customer as c
inner join sales as s
on c.customer_id = s.customer_id
group by c.customer_id, c.customer_name
order by item_bought DESC
limit 100;

---Task5---

SELECT p.brand_name, SUM (s.quantity) as total_items_sold
FROM products as p
INNER JOIN sales as s ON p.product_id = s.product_id
WHERE p.sub_category = 'men/shoes'
GROUP BY p.brand_name
ORDER BY total_items_sold DESC
LIMIT 2;

---Task6---

SELECT products.sub_category, (SUM(sales.profit) / SUM(sales.sales)) * 100 as profit_margin
FROM products
INNER JOIN sales
ON products.product_id = sales.product_id
GROUP BY products.sub_category
ORDER BY profit_margin DESC
Limit 10;

---Task7---

SELECT p.color, SUM(s.sales) as sum_sales
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
WHERE p.reviews_count >= 100
GROUP BY p.color
HAVING AVG(p.average_rating) > 4
ORDER BY sum_sales DESC;

---Task8---

SELECT delivery_mode, SUM(sales) as total_sales, SUM(profit) as total_profit,
COUNT(DISTINCT order_id) as order_count
FROM sales
WHERE order_date BETWEEN '2022-01-30' AND DATE_ADD('2022-01-30', INTERVAL 1 YEAR)
GROUP BY delivery_mode
ORDER BY total_sales DESC
LIMIT 10;

---Task9---

SELECT brand_name, (total_profit / total_orders) as avg_profit_per_order
FROM (SELECT p.brand_name, SUM(s.profit) as total_profit, COUNT(DISTINCT s.order_id) as total_orders
		FROM sales s
		JOIN products p
		ON s.product_id = p.product_id
		WHERE order_date BETWEEN DATE_SUB('2022-12-30', INTERVAL 1 YEAR) AND '2022-12-30'
		GROUP BY p.brand_name) as c
ORDER BY avg_profit_per_order DESC;

---Task10---

Select p.sub_category,c.state, (SUM(s.quantity)/1365) * 100 as percentage_of_products_sold
from sales as s
Join products as p on p.product_id = s.product_id
Join customer as c on c.customer_id = s.customer_id
Where p.sub_category = 'Men/Shoes' AND order_date BETWEEN DATE_SUB('2022-12-30', INTERVAL 1 YEAR) AND '2022-12-30' AND c.state in ('California', 'New York', 'Texas')
GROUP BY c.state, p.sub_category
order by percentage_of_products_sold DESC;

---Task11---

Select max(p.brand_name) as brand_name, p.product_name, p.color, Max(p.sub_category) as sub_category ,MAX(c.state) as state, SUM(s.quantity) as total_sales
from sales as s
Join products as p on p.product_id = s.product_id
Join customer as c on c.customer_id = s.customer_id
where p.color = 'white' AND c.state = 'California' AND p.sub_category = 'men/shoes'
GROUP BY p.product_name
ORDER BY total_sales desc limit 5;

---Task12---

Select category, sub_category, total_quantity
FROM (SELECT *, 
		Rank() Over(PARTITION BY category ORDER BY total_profit DESC) as rank_
		FROM (Select max(p.category) as category, p.sub_category, SUM(s.quantity) as total_quantity, SUM(s.profit) as total_profit, c.state
				from sales as s
				Join products as p on p.product_id = s.product_id
				Join customer as c on c.customer_id = s.customer_id
				Where c.state = 'New York'
				GROUP BY p.sub_category
				ORDER BY total_profit desc) as subcat_profit)as subcat_ranked
Where rank_ <= 4;

---Task13---

Select p.brand_name, SUM(s.profit) as total_profit
from products as p
JOIN sales as s
on s.product_id = p.product_id
WHERE Month(order_date) BETWEEN 6 AND 8 And Year(order_date) = 2019
GROUP BY p.brand_name
ORDER by total_profit DESC limit 1;

---Task14---

Select p.brand_name, SUM(s.sales) as total_sales
from sales as s
JOIN products as p
on p.product_id = s.product_id
Where order_date BETWEEN '2019-01-01' AND '2019-06-30' AND delivery_mode = 'Standard Delivery' 
AND category = (Select Category
	From (Select category, SUM(profit) as total_profit
		from sales as s
		JOIN products as p
		on p.product_id = s.product_id
		Where order_date BETWEEN '2019-01-01' AND '2019-06-30' AND delivery_mode = 'Standard Delivery'
		GROUP BY category
		ORDER BY total_profit desc limit 1) as z)
Group by p.brand_name
ORDER by total_sales desc;












