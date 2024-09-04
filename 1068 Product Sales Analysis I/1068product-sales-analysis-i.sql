# Write your MySQL query statement below
select product_name, year, price from Sales s inner join Product p where s.product_id = p.product_id