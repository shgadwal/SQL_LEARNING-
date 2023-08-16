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

select * from financials;

