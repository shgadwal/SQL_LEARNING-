SELECT salesman.name AS "Salesman",cust_name, customer.city FROM salesman JOIN customer ON  salesman.city=customer.city;


SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.commission 
FROM customer a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id;

select a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission from cutomer a 
INNER JOIN  salesman b 
on a.salesman_id=b.salesman_id where b.commission >0.12 ;

select a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission from cutomer a 
INNER JOIN  salesman b 
on a.salesman_id=b.salesman_id where a.city != b.city and b.commission >0.12 ;

-TO PRINT CITY FROM BOTH TABLES 
SELECT a.cust_name AS "Customer Name", a.city, b.city AS C, b.name AS "Salesman", b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id;
SELECT a.cust_name AS "Customer Name", a.city, b.city AS C, b.name AS "Salesman", b.commission FROM customer a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id WHERE a.city!=b.city and b.commission >0.12 ;

-- three tables 

select o.ord_no, o.ord_date, o.purch_amt, c.cust_name AS "Customer Name", c.grade, s.name AS salesman,s.commission
from orders o
inner join customer c 
on o.salesman_id= c.salesman_id 
inner join salesman s
on c.salesman_id=s.salesman_id ;

select c.cust_name AS CustomerName, c.city, c.grade, s.name AS salesman, s.city
from customer c
inner join salesman s
on c.salesman_id=s.salesman_id
order by c.customer_id;

select c.cust_name AS CustomerName, c.city, c.grade, s.name AS salesman, s.city
from customer c
inner join salesman s
on c.salesman_id=s.salesman_id
where c.grade <300
order by c.customer_id;

select c.*, s.* 
from customer c 
right outer join salesman s
on c.salesman_id=s.salesman_id
order by s.name;

select  c.cust_name AS "Customer Name", c.grade,o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman,s.commission
from customer c 
inner join salesman s
on c.salesman_id= s.salesman_id 
inner join orders o
on s.salesman_id=o.salesman_id ;


select m.*, l.* from movies m
Inner join languages l
on m.language_id=l.language_id;

select m.title from movies m
inner  join languages l
on m.language_id=l.language_id
where l.name = "telugu";

SELECT COUNT(release_year) a, l.name
from movies m 
right join languages l
on m.language_id=l.language_id
group by l.name
order by 1 desc;

SELECT l.name, 
            COUNT(m.movie_id) as no_movies
	FROM languages l
left JOIN movies m USING (language_id)        
	GROUP BY l.language_id
	ORDER BY no_movies DESC;

use food_db;
select * from items;
select * from variants;


select *, concat(name,variant_name) as fullname,( price + variant_price)as fullprice from items i
cross join variants v

use moviesdb

select m.movie_id, m.title, f.budget,f.revenue,f.currency,f.unit,
 case
 when unit = "thousands" then (revenue-budget)/1000
 when unit = "Billions" then (revenue-budget)*1000
 else unit ="millions" then (revenue-budget)
 end as profit_mln
 from movies m
 join financials f 
 on m.movie_id = f.movie_id
 where industry="bollywood"
 order by profit_mln desc;
 
 
 select m.movie_id, m.title, f.budget,f.revenue,f.currency,f.unit,
  case
 when unit = "thousands" then (revenue-budget)/1000
 when unit = "Billions" then (revenue-budget)*1000
 when unit = "millions" then (revenue-budget)
end as profit_mln
 from movies m
 join financials f 
 on m.movie_id = f.movie_id
 where industry="bollywood"
 order by profit_mln;
 
 OR with ELSE 
 
 select m.movie_id, m.title, f.budget,f.revenue,f.currency,f.unit,
  case
 when unit = "thousands" then (revenue-budget)/1000
 when unit = "Billions" then (revenue-budget)*1000
ELSE (revenue-budget)
end as profit_mln
 from movies m
 join financials f 
 on m.movie_id = f.movie_id
 where industry="bollywood"
 order by profit_mln;


select m.title, group_concat(name separator " | ") as actors
from movies m
join movie_actor ma
on m.movie_id= ma.movie_id 
join actors a 
on ma.actor_id=a.actor_id
group by m.title;

select a.name,group_concat(m.title separator " | ") as actors
from movies m
join movie_actor ma
on m.movie_id= ma.movie_id 
join actors a 
on ma.actor_id=a.actor_id
group by a.name;

select a.name,count(title) as totmovies,group_concat(m.title separator " | ") as actors
from movies m
join movie_actor ma
on m.movie_id= ma.movie_id 
join actors a 
on ma.actor_id=a.actor_id
group by a.name
order by totmovies desc;
  
select  group_concat(name separator " | ") as actors
from movies m
join movie_actor ma
on m.movie_id= ma.movie_id 
join actors a 
on ma.actor_id=a.actor_id;

  
  
  

EXPLAIN 
select *
from movies m
join movie_actor ma
on m.movie_id= ma.movie_id 
join actors a 
on ma.actor_id=a.actor_id;


select m.title,f.revenue,f.currency,f.unit,
case 
when unit = "billions" then round (revenue *1000,2)
when unit = "Thousands" then round (revenue /1000,2)
when unit = "millions" then round(revenue,2)
end as unit1 
from movies m 
join financials f
on m.movie_id = f.movie_id
join languages l
on m.language_id= l.language_id 
where l.name ="hindi"
order by unit1;

select distinct(unit) from financials;