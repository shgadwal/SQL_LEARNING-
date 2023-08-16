select c. name, o.OrderID 
from customers c
inner join oders o
on c.CustomerID = o.CustomerID;


select c.name, o.OrderID 
from customers c
left  join oders o
on c.CustomerID = o.CustomerID;

select c.name, o.OrderID 
from customers c
Right inner join oders o
on c.CustomerID = o.CustomerID;
Inner join query to display the Name and OrderID of customers who have placed more than one order:
sql
Copy code
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Orders.CustomerID
HAVING COUNT(Orders.OrderID) > 1;

select c.name, o.OrderID , count (o.OrderID)
from customers c
left  join oders o
on c.CustomerID = o.CustomerID
group by o.CustomerID;


USE moviesdb;

select * From actors WHERE (actor_id,birth_year) in
(select actor_id,1986 From movie_actor where movie_id IN (101, 110, 121));


select * from actors where (actor_id,birth_year) = (50,1986);

select * from actors where (actor_id,birth_year) in
(select 50,1986
union
select 51,1959
)


select actor_id,1986 From movie_actor where movie_id IN (101, 110, 121);

select * from actors
where actor_id in (50,51,65,66,86,87,107) ;
select * from movie_actor;

/* select the actors who acted in any of these movies(101,110,121)

select * from actors
where actor_id in 
(select actor_id from movie_actor where movie_id in (101,110,121)) ;

select * from actors
where actor_id =ANY 
(select actor_id from movie_actor where movie_id in (101,110,121)) ;
/* SELECT all movies who rate id greater than any of the *any* of the marvel movies

select * from movies where imdb_rating > ALL 
(select imdb_rating from movies where studio = "marvel studios")

select * from movies where imdb_rating >
(select MAX(imdb_rating) from movies where studio = "marvel studios")

select * from movies where imdb_rating > ANY
(select imdb_rating from movies where studio = "marvel studios")

select * from movies where imdb_rating >
(select MIN(imdb_rating) from movies where studio = "marvel studios")



select a.name,a.actor_id from actors a 
join movie_actor ma
on a.actor_id = ma.actor_id
where ma.movie_id in (101,110,121)


corelated subquery 

select actor id,actor name and the total number of movies they acted in 

select name from actors where actor_id in 
select actor_id,count(movie_id) from movie_actor 
group by actor_id;

select actor_id, count(movie_id) from movie_actor 
group by actor_id
union 
select name from actors;

select a.actor_id, a.name, m.count(movie_id) as m.tot from actors a 
inner join movie_actor m
on a.actor_id=m.actor_id
group by a.actor_id;