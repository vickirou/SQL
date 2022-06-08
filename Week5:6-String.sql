-- Q1// How many (count) films are there that have dentist 
SELECT COUNT(description) AS num_films 
FROM film 
WHERE description LIKE '%dentist%'
; 
-- Q2// Which actord have first name scarlett ?
SELECT first_name, last_name 
FROM actor 
WHERE first_name LIKE 'Scarlett%' ; 

-- Q3// Which actors have las name with SON ?
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE '%son%' ; 

-- Q4// How many films are actors with last name SON in? 
SELECT a.last_name AS last_name, COUNT(f.title) AS total_films 
FROM actor AS a 
JOIN film_actor AS fa 
ON a.actor_id = fa.actor_id 
JOIN film AS f 
ON f.film_id = fa.film_id 
WHERE a.last_name LIKE '%son%' 
GROUP BY last_name; 

-- Q5// Most common FIRST LETTER for customer FIRSTNAME? -- regex
SELECT COUNT(first_name) AS num_of_time_letter_in_first_name 
FROM customer 
WHERE first_name REGEXP '^[A-Za-z]' 
;
/*OR  first_name LIKE 'b%'
OR first_name LIKE 'c%')*/ 
