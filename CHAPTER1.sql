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
