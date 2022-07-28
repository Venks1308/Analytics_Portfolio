use SQL_basics;
-- Maximum quantity sold in a transaction
SELECT max(Quantity),count(*)
FROM tr_orderdetails;
-- Finding unique products in all transactions
SELECT distinct ProductID, Quantity
from tr_orderdetails
WHERE Quantity = 3
order by ProductID asc, Quantity desc;
-- Finding all unique properties 
SELECT distinct PropertyID
from tr_orderdetails;
-- The above were Basic Business Questions 

-- Finding the Product category that has maximum products 
select ProductCategory, count(*)
from tr_products
group by ProductCategory
order by 2 desc;
-- Finding the states where the most stores are present 
select PropertyState, count(*) as COUNT
from tr_propertyinfo
group by PropertyState
order by 2 desc;
-- Find the top 5 produc ids that did maximum sales in terms of quantity 
select ProductID, sum(Quantity) as Total_Quantity
from tr_orderdetails
GROUP BY ProductID 
order by 2 desc
LIMIT 5;
-- Find the top 5 properties that did maximum sales in terms of quantity
select PropertyID, sum(Quantity) as Total_Quantity
from tr_orderdetails
GROUP BY PropertyID 
order by 2 desc
LIMIT 5;
-- Finding the top 5 product names that did maximum sales in terms of quantity 
SELECT o.*,p.ProductName,p.ProductCategory,p.Price
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID;
 -- Top 5 product names that did maximum sales
SELECT p.ProductName,sum(o.Quantity) as Total_Quantity
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by 2 desc;
-- top 5 products that did maximum sales 
select p.ProductName,sum(o.Quantity * p.Price) as Sales
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by Sales desc
LIMIT 5;
-- Top 5 cities that did maximum sales
select
pi.PropertyCity,
sum(o.Quantity * p.Price) as Sales
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
group by pi.PropertyCity
order by Sales desc
Limit 5;
-- Sales and Product name per city 
select
pi.PropertyCity,
p.ProductName,
sum(o.Quantity * p.Price) as Sales
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
where pi.PropertyCity = 'Seattle'
group by pi.PropertyCity, p.ProductName
order by Sales desc
LIMIT 5;
