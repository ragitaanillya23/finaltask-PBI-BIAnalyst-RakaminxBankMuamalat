CREATE TABLE finaltaskrakamin.master_table AS
WITH master AS (
  SELECT
    o.Date AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
    (o.Quantity * p.Price) AS total_sales,
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
  FROM finaltaskrakamin.Orders AS o
  JOIN finaltaskrakamin.Customers AS c 
    ON o.CustomerID = c.CustomerID
  JOIN finaltaskrakamin.Products AS p 
    ON o.ProdNumber = p.ProdNumber
  JOIN finaltaskrakamin.ProductCategory AS pc
    ON p.Category = pc.CategoryID
)
SELECT *
FROM master
ORDER BY order_date ASC;