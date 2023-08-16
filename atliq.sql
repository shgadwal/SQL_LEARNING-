SELECT * FROM mymodeldb.actors;
select * from actors where birth_year is NULL;
DELETE from actors where birth_year IS NULL;
insert into mymodeldb values 

select * from dim_product;
select distinct * from dim_product;
select distinct division from dim_product;
select distinct segment,category from dim_product;

select * from dim_customer;
select distinct count(customer)from dim_customer;
select distinct(customer)from dim_customer;
select distinct(platform)from dim_customer;
select distinct(channel)from dim_customer;
select distinct(market)from dim_customer;
select distinct count(market)from dim_customer;
select distinct sub_zone from dim_customer;
select distinct count(market)from dim_customer;
---------
--fiscal year , calender year starts from jan

9,10,11 ---q1
12,1,2 --q2
3,4,5 q3
6,7,8 -q4


select * from fact_sales_monthly;

select month(date)from fact_sales_monthly

select month("2023-05-02");

select * from fact_sales_monthly
where customer_code= 90002002 and year(date)=2021
order by date desc ;

select *, year(date), month(date),day(date) from fact_sales_monthly
where customer_code= 90002002 
order by date desc;

select *,get_fiscal_year(date) from fact_sales_monthly
where customer_code= 90002002 and get_fiscal_year(date)=2021

--  any calender date if you want to get fiscal year then add four months 

select date_add("2021-09-01", interval 4 month);


select * from fact_sales_monthly
where customer_code = 90002002 and year(date_add(date, interval 4 month))=2021
order by date desc ;

select count(*) from 
(select * from fact_sales_monthly
where customer_code = 90002002 and get_fiscal_year(date)=2021
order by date desc) a


select count(*) from fact_sales_monthly;

select count(*)
from 
(select  date,date_add(date, interval 4 month), get_fiscal_year(date) from fact_sales_monthly) a
where customer_code = 90002002 and get_fiscal_year(date)=2021
order by date desc
limit 10000 ;

Note : for the userdefined functions filtered column =2021, with respect to fiscal year will be display the 2021 


select  date,date_add(date, interval 4 month), get_fiscal_year(date) from fact_sales_monthly
where customer_code = 90002002 and get_fiscal_year(date)=2021
order by date desc
limit 10000 

select date,date_add(date, interval 4 month) fiscal_date,
year(date_add(date, interval 4 month)) fiscal_year, 
get_fiscal_year(date) fy_from_function from fact_sales_monthly
where customer_code = 90002002 
order by date desc
limit 10000 ;

---integer / string .. 
where as in the other programming laguages it displayed at the begining in the function and there is no explicit return 

select * from fact_sales_monthly
where customer_code = 90002002 and get_fiscal_year(date)=2021 and get_fiscal_quater(date)="q4"

order by date desc ;


---fiscal year , calender year starts from jan

9,10,11 ---q1
12,1,2 --q2
3,4,5 q3
6,7,8 -q4

below command gives which month the date falls in 
select month("2019-10-01")


select * from fact_sales_monthly;
select * from dim_product;
select * from fact_gross_price;

select * from fact_sales_monthly s
join dim_product p on s.product_code = p.product_code
where customer_code = 90002002 and get_fiscal_year(date)=2021 and get_fiscal_quater(date)="q4";

select s.date, s.product_code, get_fiscal_year(date), p.product, p.variant, s.sold_quantity from fact_sales_monthly s
join dim_product p on s.product_code = p.product_code
where customer_code = 90002002 and get_fiscal_year(date)=2021 and get_fiscal_quater(date)="q4"
order by date asc;

select s.date, s.product_code, get_fiscal_year(date), p.product, p.variant, s.sold_quantity,g.gross_price from fact_sales_monthly s
join dim_product p on s.product_code = p.product_code
join fact_gross_price g on g.fiscal_year = get_fiscal_year(s.date) and g.product_code = s.product_code
where customer_code = 90002002 and get_fiscal_year(date)=2021 and get_fiscal_quater(date)="q4"
order by date asc;

select s.date, s.product_code, get_fiscal_year(date), p.product, p.variant, s.sold_quantity,g.gross_price from fact_sales_monthly s
join dim_product p on s.product_code = p.product_code
join fact_gross_price g on g.fiscal_year = get_fiscal_year(s.date) and g.product_code = s.product_code
where customer_code = 90002002 and get_fiscal_year(date)=2021 
order by date asc;

select s.date, s.product_code, get_fiscal_year(date), p.product, p.variant, s.sold_quantity,g.gross_price, round (s.sold_quantity*g.gross_price, 2) total_price from fact_sales_monthly s
join dim_product p on s.product_code = p.product_code
join fact_gross_price g on g.fiscal_year = get_fiscal_year(s.date) and g.product_code = s.product_code
where customer_code = 90002002 and get_fiscal_year(date)=2021 
order by date asc;

///***========

second task 

select * from dim_customer
where market = "india" and customer = "croma" 

select * from fact_sales_monthly
SELECT * FROM FACT_GROSS_PRICE

select * from fact_sales_monthly
where customer_code = 90002002

--- the below statement returns the fiscal month - year format 
select date, date_add(date, interval 4 month),date_format(date_add(date, interval 4 month),'%Y-%m') from fact_sales_monthly
-- below is the function to extraxt the fiscal_year - just by extracting the substring - "2018"
select date, date_add(date, interval 4 month),substring(date_format(date_add(date, interval 4 month),'%Y-%m'),1,4) sub_fiscal_yr from fact_sales_monthly
select date, date_add(date, interval 4 month),substring((get_fiscal_month_year(date)),1,4) sub_fiscal_yr from fact_sales_monthly

----  when groupby is applied can we have derived function listed )
select get_fiscal_month_year(date), sum(sold_quantity) from fact_sales_monthly
where customer_code = 90002002 
group by get_fiscal_month_year(date) ;

select * from fact_sales_monthly; 
select * from fact_gross_price ;

select * from fact_gross_price 
where product_code="A0118150101";

select fiscal_year, sum(gross_price) from fact_gross_price 
group by fiscal_year



select s.date,s.product_code, get_fiscal_month_year(s.date),substring((get_fiscal_month_year(s.date)),1,4) sub_fiscal_yr, g.gross_price from fact_sales_monthly s
JOIN FACT_GROSS_PRICE G
ON g.product_code = s.product_code and g.fiscal_year= substring((get_fiscal_month_year(s.date)),1,4)
where s.customer_code = 90002002; 

select get_fiscal_month_year(s.date), sum(g.gross_price * s.sold_quantity) as gross_tot_price from fact_sales_monthly s
JOIN FACT_GROSS_PRICE G ON g.product_code = s.product_code and g.fiscal_year = substring((get_fiscal_month_year(s.date)),1,4)
where s.customer_code = 90002002
group by get_fiscal_month_year(s.date)
order by get_fiscal_month_year(s.date) asc


select get_fiscal_year(s.date), sum(round(g.gross_price * s.sold_quantity,2)) as gross_tot_price from fact_sales_monthly s
JOIN FACT_GROSS_PRICE G
ON g.product_code = s.product_code and g.fiscal_year = get_fiscal_year(s.date)
where customer_code = 90002002 
group by get_fiscal_year(s.date)
order by get_fiscal_year(s.date);


	select
            get_fiscal_year(date) as fiscal_year,
            sum(round(sold_quantity*g.gross_price,2)) as monthly_sales
	from fact_sales_monthly s
	join fact_gross_price g
	on 
	    g.fiscal_year=get_fiscal_year(s.date) and
	    g.product_code=s.product_code
	where customer_code=90002002
	group by get_fiscal_year(date)
	order by fiscal_year;
		

select * from fact_sales_monthly S
JOIN FACT_GROSS_PRICE G
ON 
where customer_code = 90002002 

select * from dim_customer
where customer like "%amazon%" and market like "india";



==========================group by s. date 

	select s.date,
            sum(round(sold_quantity*g.gross_price,2)) as monthly_sales
	from fact_sales_monthly s
	join fact_gross_price g
	on 
	    g.fiscal_year=get_fiscal_year(s.date) and
	    g.product_code=s.product_code
	where customer_code=90002002
	group by s.date;get_mothly_gross_sales_for_customer
    
    
    ==============where there are multiple customers, 
    Select * from dim_customer
    where customer_code IN (90002008,90002002)
    
    
    select s.date,
            sum(round(sold_quantity*g.gross_price,2)) as monthly_sales
	from fact_sales_monthly s
	join fact_gross_price g
	on 
	    g.fiscal_year=get_fiscal_year(s.date) and
	    g.product_code=s.product_code
	where customer_code IN (90002008,90002002)
	group by s.date;
    
    
    get_mothly_gross_sales_for_customer

		select find_in_set(90002002, "90002002,90002008")
        
        
        
        ===============to find the gold or silver class========
        
        
        
        select * from dim_customer
        select * from fact_sales_monthly
        
        select * from fact_sales_monthly s
        join dim_customer dc on 
        s.customer_code= dc.customer_code
        where get_fiscal_year(s.date)= 2021 
        
        select sum (s.sold_quantity), dc.market from fact_sales_monthly s
        join dim_customer dc on 
        s.customer_code= dc.customer_code
        where get_fiscal_year(s.date)= 2021
        group by dc.market
        
         select sold_quantity, dc.market from fact_sales_monthly s
        join dim_customer dc on 
        s.customer_code= dc.customer_code
        where get_fiscal_year(s.date)= 2021 and market= "india"

