-- cat queries.sql | mysql -uroot -p

USE bb_products;

SELECT product_id, sum(sales) FROM stock GROUP BY product_id;

SELECT product_id, sales
FROM stock
WHERE sales = (SELECT MAX(sales) FROM stock);

SELECT productos, Sum_Sales
FROM 
	(SELECT product_id productos, SUM(SALES) Sum_Sales
	FROM stock
	GROUP BY product_id) as resultado	
ORDER BY Sum_Sales DESC LIMIT 3;

--- This query get three best-selling products
SELECT productos, Sum_Sales, nombre
FROM 
	(SELECT s.product_id productos, SUM(SALES) Sum_Sales, p.name_product nombre  
	FROM stock s
	INNER JOIN products p on s.product_id = p.product_id
	GROUP BY s.product_id) as resultado
ORDER BY Sum_Sales DESC 
LIMIT 3

--- Sales by category

SELECT p.category_id, c.name_category, 
SUM(s.amount * s.sales_price) total_categoria  
from sales s 
INNER JOIN products p ON s.product_id =p.product_id 
INNER JOIN category c ON c.category_id = p.category_id 
GROUP BY c.category_id