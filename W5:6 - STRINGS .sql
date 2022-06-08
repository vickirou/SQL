-- string are the dimensions 
-- second: numbers 
-- characters: times and dates 
-- string matching: operations for string matching 

SELECT * 
FROM actor 
WHERE first_name LIKE '%NI%' ; 

SELECT * 
FROM film 
WHERE description LIKE '%a' AND description LIKE 'a%'; 

SELECT * 
FROM film 
WHERE description LIKE '%a' AND description LIKE 'a%';

/* __ -- as a wildcard it matches any single character or single number 
/*  % - any character(S) */ 

SELECT  * 
FROM city 
WHERE city LIKE 'ad___'; 

SELECT * FROM film_text 
WHERE description LIKE '%boring%dentist%' ; 

SELECT * FROM film_text 
WHERE description LIKE '%boring_dentist%' ;    -- underscore is SPACE for #of underscore things -- e.g. 1 

SELECT * 
FROM city 
WHERE BINARY city LIKE 'ad___';  -- binary makes the ad stay lowercase/ case sensitive and not case insensitive 

SELECT * 
FROM city 
WHERE BINARY city LIKE 'Ad___'; 