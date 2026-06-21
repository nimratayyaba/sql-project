CREATE DATABASE retail_project;
USE retail_project;
CREATE TABLE customers(
customer_id int primary key,
name varchar(50),
city varchar(50)
);
CREATE TABLE products(
product_id int primary key,
product_name varchar(50),
price decimal(10,2)
);
CREATE TABLE orders(
order_id int primary key,
customer_id int,
product_id int,
quantity int,
order_date date,
foreign key(customer_id) references customers(customer_id),
foreign key(product_id) references products(product_id)
);
insert into customers values 
(1,'Nimra','FSD'),
(2,'Ahmed','LHR'),
(3,'Hashim','GUJ');
insert into products values
(101,'Laptop',120000),
(102,'Phone',50000),
(103,'Headphones',3000);
insert into orders values
(1,1,101,1,'2026-01-10'),
(2,2,102,2,'2026-02-15'),
(3,1,101,3,'2026-04-16'),
(4,3,103,1,'2026-05-05');
select * from customers;
select * from products;
select * from orders;
-- Total Orders
select count(*) as total_orders from orders;
-- Revenue Report
select sum(p.price * o.quantity) as total_revenue from orders o
join products p on o.product_id=p.product_id;
-- Selling Product
select p.product_name,sum(o.quantity) as total_sold from orders o
join products p on o.product_id=p.product_id
group by p.product_name 
order by total_sold desc;
-- Top Selling Product
select top 1p.product_name,sum(o.quantity) as total_sold from orders o
join products p on o.product_id=p.product_id
group by p.product_name 
order by total_sold desc;
-- Orders by City
select c.city,count(o.order_id)as total_orders from orders o
join customers c on o.customer_id=c.customer_id
group by c.city;
-- Monthly Sales
select month(order_date)as month,
sum(quantity)as total_items_sold from orders 
group by month(order_date);



