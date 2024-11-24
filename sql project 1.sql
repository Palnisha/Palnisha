
----- SQL RETAIL SALES ANALYSIS PROJECT -------
create database sales;
use  sales;
create table retail_sales (transactions_id int ,
sale_date text ,
sale_time text ,
customer_id int ,
gender text, 
age int ,
category text, 
quantiy int ,
price_per_unit int, 
cogs int ,
total_sale int);
select * from  retail_sales;

#### ---data cleaning-----
select * from retail_sales
limit 10 ;
select count(*)from retail_sales;

select * from retail_sales
where transactions_id is null ;

select * from retail_sales
where sale_date is null ;

select * from retail_sales
where sale_time is null ;

select * from retail_sales
where customer_id is null ;

select * from retail_sales
where gender is null ;

select * from retail_sales
where age is null ;

select * from retail_sales
where category is null ;

select * from retail_sales
where quantiy is null ;

select * from retail_sales
where price_per_unit is null ;
 
select * from retail_sales
where cogs is null ;

select * from retail_sales
where total_sale is null ;
------   use to remove null values
 delete from retail_sales
 where transaction_id is null;
###  ---data exploration----
## how many sales we have
select count(*) as total_sales from retail_sales;

### how many customers we have?
select count(customer_id) as total_sale from retail_sales;
 ## there r same people formultiple time we want only uniq people
select count( distinct customer_id) as total_sale from retail_sales;

## want unique catogery nd name of it
select count(distinct  category) as total_sale from retail_sales;
select distinct category from retail_sales;

## #### data analysis nd business key problem nd answer
## write sql quesry to retrive allcolumns for  sales made on 2022-11-05
select  *  from retail_sales
where  sale_date =   '2022-11-05';
## write sql quesry toretrive all transaction where the category is 'clothing' nd the quantity sold is more than 1 in the month of  nov 2022

select  Category,
SUM(quantiy) AS TOTAL_QUANTITY  from retail_sales
where Category = "Clothing" 
and date_format(sale_date,'YYYY-MM') = '2022-11'
GROUP BY Category;

#### writw quesry total sales  nd total orders by category
select category,
sum(total_sale) as net_sales,
count(*) as total_orders
from retail_sales
group by category;

##write sql quesry to find the average age of customers who purchased item from the 'beauty 'category'
 
select avg(age)  from retail_sales
where Category  = 'Beauty';

select  round(avg(age),2)  from retail_sales
where Category  = 'Beauty';

####write sql quesry to find all transection where the total_sale is greater that 1000
select  * from retail_sales
where  total_sale>1000;

##write quesry to find out total number of transection s(from transection id ) made by each gender in each category
select gender ,category,
count(*) as total_trans
from retail_sales
group by gender,category
order by 1;
### write query   calculate avg sales for each mnth. find out best selling month in each year

select avg(total_sale),
month(sale_date),
year(sale_date)
 from retail_sales
group by  sale_date
order by 1,2 desc;


##SQL QUERY TOFIND TOP 5 CUSTOMER BASED ON HIGHEST TOTAL SALSELECT CUSTOMER_ID,
  SELECT 
 CUSTOMER_ID,
 SUM(TOTAL_SALE) AS TOTAL_SALES
 FROM RETAIL_SALES
 GROUP BY CUSTOMER_ID 
 ORDER BY 2 DESC
 LIMIT 5;

### SQL QUERY  TOO FIND  THE NUMBER OF UNIQ CUSTOMER WHO PURCHASED ITEM FROM EACH CATEGORY
SELECT  COUNT(DISTINCT CUSTOMER_ID) as unique_customer,
CATEGORY
FROM   RETAIL_SALES
GROUP BY category;

##sql query to create each shift nd number of orders in morning, afternoon, evening)

with  hourly_sales
as
(

select *,
case
when  hour(sale_time)  <12 then  'morning'
when hour(sale_time)  between 12  and 17 then 'afternoon'
else   'evening'
end as shift
 from retail_sales
 )
 select shift,
 count(*) as total_orders
 from hourly_sales
 group by shift;
-- End of project








