-- IT 2351 NICOLE TIRADO
-- This query adds IF GROUPING. =1 to both category and product name, if it equals 1, it will be included in the result. if null, it will not. 

SELECT  
IF(GROUPING(category_name) = 1, 'All Categories', category_name) as "Category",
IF(GROUPING(product_name) = 1, 'All Products', product_name) as "Product", 
COUNT(DISTINCT products.product_id) as "Number of products",
SUM(quantity) as "Quantity Sold"
FROM products
INNER JOIN categories ON products.category_id=categories.category_id
LEFT JOIN order_items ON products.product_id=order_items.product_id
GROUP BY  category_name, product_name WITH ROLLUP
