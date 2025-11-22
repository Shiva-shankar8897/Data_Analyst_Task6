use Ecommerce

create table Online_sales(
    order_date date,
	amount int,
	product_id int,
	revenue int,
	order_id varchar(50)
)

BULK INSERT dbo.online_sales
FROM 'D:\Shanku\Data Analyst\Task6\online_sales_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

select * from Online_sales;

-- extract a month,year 
select month(order_date) as Month from Online_sales;
select year(order_date) as Year from Online_sales order by amount asc
select format(order_date,'dd-MM-yyyy')as Day_format from Online_sales

-- Group by, Order by
select year(order_date)as groupby_year from Online_sales group by year(order_date)
select month(order_date) as groupby_month from Online_sales group by month(order_date)

select year(order_date) as order_year,month(order_date) as order_month from Online_sales 
group by year(order_date),month(order_date) order by order_month,order_year

select * from Online_sales order by order_date asc
select * from Online_sales order by revenue desc

--sum
select sum(revenue)as Total_Revenue from Online_sales
select sum(amount) as Total_Amount from Online_sales 

--count
select count(order_id) as Total from Online_sales
select count(distinct order_id) as Total_values from Online_sales
select count(product_id) as Total_products from Online_sales

--top
select top(5) format(order_date,'MM-yyyy')as Month_format from Online_sales
select top(5)datename(month,order_date) as month from Online_sales
select top(100) * from Online_sales order by amount asc 
select top(10) * from Online_sales order by product_id desc 
select top(50) * from Online_sales where year(order_date)>2023

