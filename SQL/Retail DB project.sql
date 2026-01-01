#creating database named retail_db and using it 
CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

#creating 4 tables customers, order_items, orders, products
#customers
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name  VARCHAR(50),
  email      VARCHAR(100),
  city       VARCHAR(50),
  state      VARCHAR(10),
  signup_date DATE
);

#products
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category   VARCHAR(50),
  price      DECIMAL(10,2)
);

#orders
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  channel   VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

#order_items
create table order_items (
  order_id int,
  product_id int,
  quantity int,
  unit_price decimal(10,2),
  discount_pct int,
  primary key (order_id, product_id),
  foreign key (order_id) references orders(order_id),
  foreign key (product_id) references products(product_id)
);

#count rows in each table
SELECT COUNT(*) FROM customers;
SELECT COUNT(email) FROM customers;
select count(distinct customer_id) from orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM products;

#Filters
#website sales
select * from orders where channel = 'website';

# count website sales
select count(*) from orders where channel = 'website';

#customers from mumbai
select * from customers where city = 'Mumbai';
select count(*) from customers where city = 'Mumbai';

# total no. of orders ?
select count(*) from orders;

#sales came from amazon channel
select count(*) from orders  where channel = 'Amazon';

# grouping
# Group by - how many sales came from each channel - Amazon,Myntra,Website?
select channel, count(*) from orders group by channel;

# what % total orders came from each channel
select channel, count(*) as orders_count from orders group by channel;
select channel, count(*) as orders_count, (count(*)/(select count(*) from orders)) * 100 as percentage_of_orders from orders group by channel;

# no of customers in each city and % of no of customers in each city
select city, count(*) as city_of_customers from customers group by city;
select city, count(*) No_of_customers_from_each_city, (count(*)/(select count(*) from customers))*100 as 
percentage_of_customers_from_each_city from customers group by city;

#no of and Percentage_of_No_of_Products_in_each_category
select category, count(*) as No_of_Products_in_each_category  from products group by category;

Select category, count(*) as No_of_Products_in_each_category, round((count(*)/(select count(*) from products))*100,2) as 
Percentage_of_No_of_Products_in_each_category from products group by category;

#sorting
select category, count(*) as product_count  from products group by category order by product_count asc;

#all customers sorted by first name A-Z
select * from customers order by first_name asc;

#all customers sorted by first name Z-A
select* from customers order by first_name desc;

#all customers sorted by city A-z
select * from customers order by city asc;

#all products sorted by price low - high.
select * from products order by price asc;

#all orders sorted by date - latest orders first
select * from orders order by order_date desc;

#all products sorted by category A-Z, and within each category sort by price high-low
select * from products order by category asc, price desc;

#Which city has the most customers? Sort from highest-lowest
select city, count(*) as customer_count from customers group by city order by customer_count desc;

#Which product category has the most types of products ? Sort from highest-lowest
select category , count(*) as Product_count from products group by category order by Product_count desc;










 













