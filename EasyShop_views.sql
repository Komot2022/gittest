--This view will provide insights into the best performing product and category across the business based on profit.

select p.product_name, p.category, sum(s.profit) as Total_profit
     from products p 
     join Orders o on o.order_id = p.order_id
	 join sales s on s.product_id = p.product_id
	 group by p.product_name, p.product_name, p.category
	 order by total_profit
	 
--This view would provide a timeline for the biggest sales events in the year by month. 
--It would help the business plan towards seasonal sales proomotions.

SELECT o.order_quantity, EXTRACT(MONTH FROM o.order_date) AS month, s.sales_volume AS total_sales
	FROM orders o
	JOIN products p ON p.order_id = o.order_id
	JOIN sales s on s.product_id = p.product_id
	GROUP BY o.order_quantity, EXTRACT(MONTH FROM o.order_date), total_sales
	HAVING SUM(s.sales_volume) > 5000
	ORDER BY total_sales DESC;