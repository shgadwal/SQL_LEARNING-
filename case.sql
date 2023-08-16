use moviesdb;
SELECT * FROM movies;
SELECT COUNT(*) FROM MOVIES;
SELECT COUNT(*) FROM MOVIES WHERE STUDIO != "";
SELECT release_year,count(RELEASE_YEAR),max(imdb_rating)FROM MOVIES group by RELEASE_YEAR ORDER BY RELEASE_YEAR;
SELECT RELEASE_YEAR FROM MOVIES group by RELEASE_YEAR;
SELECT distinct release_year  from MOVIES order by release_year;

select * FROM movies WHERE TITLE LIKE '%THOR%';
select title, release_year from movies where studio like '%studios%' ;
select * from movies where title like '%Avenger%';
select release_year, title from movies where title = 'The Godfather'; 
select distinct (studio) from movies where industry= 'Bollywood' ;
select *  from movies where Release_year != "" order by Release_year desc  ;
select * from movies where Release_year = "2022";
select * from movies where Release_year > "2020";
select * from movies where Release_year > "2020" AND imdb_rating >8 ; 
select * from movies where studio in ("Hombale Films" ,"Marvel Studios");
select * from movies where title like '%Thor%'  order by Release_year ;
select * from movies where studio != 'Marvel Studios';
select * from movies where Release_year != "";
select count(*) from movies where Release_year != "";
select *  from movies where Release_year != "" order by Release_year desc LIMIT  5;
select *  from movies where Release_year != "" order by Release_year desc LIMIT  5 OFFSET 2 ;
DESCRIBE MOVIES;
show movies;

SELECT COUNT (*), COUNTRY FROM nobel_win GROUP BY COUNTRY HAVING COUNT(*) >1
ORDER BY 1 DESC ;


SELECT COUNT (*), Country FROM nobel_win  WHERE CATEGORY = 'Scientist' GROUP BY country having COUNT(*) >1
ORDER BY 1 DESC ;

SELECT distinct release_year,release_year from MOVIES order by 1;
SELECT count(*) TOT from movies where release_year between 2015 AND 2022;
SELECT MAX(release_year) RECENT , MIN(release_year) OLD FROM MOVIES ;
SELECT release_year, COUNT(release_year) FROM MOVIES group by release_year ORDER BY  release_year DESC;
SELECT release_year, COUNT(release_year) FROM MOVIES group by release_year;


select * from actors;
select year (curdate());
select curdate();
select *, year (curdate())- birth_year as age from actors;

select * from financials;
select *, (revenue - budget) as profit,round((revenue - budget)/ budget *100),2 as profit_per from financials;
select *, if (currency ="USD",REVENUE*77, REVENUE)as revenue_inr from financials;
select distinct unit from financials;
select *, 
case 
when unit= "Billions" then revenue*1000
when unit= "Thousands" then revenue/1000
/*when unit = "millions" then revenue*/ -- used to comment 
else revenue
end as revenue_million from financials;
select count(distinct imdb_rating),stddev(imdb_rating) from movies;
SELECT * FROM Financials where mod  (Movie_id, 2 )= 1 ; 
SELECT * FROM Financials where Movie_id % 2 = 1 ; 

SELECT * from movies WHERE imdb_rating between 5 AND 6 and title LIKE "THE%";
SELECT 'This is SQL Exercise, Practice and Solution';
select 1, 2, 3;
select 10+15 sum ; 

SELECT * from movies WHERE imdb_rating>5 and imdb_rating <=6 and title LIKE "The%";
SELECT * from movies WHERE imdb_rating >=6 and title LIKE "The%";
select * from movies WHERE title LIKE "THE%";
SELECT * FROM nobel_win  WHERE (subject ='Physics' AND year=1970) OR (subject ='Economics' AND year=1971);
SELECT * FROM nobel_win WHERE year=1970 ORDER BY  CASE WHEN subject IN ('Economics','Chemistry') THEN 1 ELSE 0 END ASC, subject, winner;

SELECT *, 
case 
when 
subject IN ('Economics','Chemistry') then 'ok'
else 'not ok'
end as S
FROM nobel_win
where year=1970
order by S;


select industry, count(*), count(studio), count(imdb_rating), launguage_id from movies
group by industry, language_id ;

select industry, count(*), count(studio), count(imdb_rating), max(language_id), min(language_id), sum(language_id)
from movies
 group by industry;

select industry,language_id, count(*), count(studio), count(imdb_rating)
from movies
 group by industry,language_id;


select sum(language_id) from movies where industry in ("Hollywood");
select language_id, count(*),count(industry),count(release_year)from movies group by language_id;
