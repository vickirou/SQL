-- SELECT first_name, last_name
-- FROM actor 
-- LIMIT 10; 

-- SELECT COUNT(*) FROM film WHERE rental_rate > 1 AND length > 160;  

-- SELECT first_name, last_name 
-- FROM actor 
-- WHERE first_name = 'Scarlett'; 

-- SELECT first_name, last_name 
-- FROM actor 
-- WHERE last_name LIKE '%son%'
-- ORDER BY first_name; 

-- SELECT COUNT(DISTINCT(last_name))
-- FROM actor;

SELECT DISTINCT(name)
FROM language
ORDER by name; 

SELECT c.first_name, c.last_name, SUM(p.amount) AS total, AVG(p.amount) AS average
FROM payment AS p
LEFT JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total DESC 
LIMIT 5; 

-- i need list of actors (first name, last name) and number of movies/  MAY NEED DISTINCT COUNT -- given unperfect data 
SELECT a.first_name, a.last_name, COUNT(f.film_id) AS total_movies 
FROM actor AS a
LEFT JOIN film_actor AS f
ON a.actor_id = f.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY total_movies DESC;
-- can have multiple JOINs if needed */ 

-- I NEED list of films, categories, sorted by film title  
SELECT f.title AS title, c.name AS category, fc.film_id AS film_id
FROM film AS f 
LEFT JOIN film_category AS fc 
ON f.film_id = fc.film_id 
LEFT JOIN category AS c
ON fc.category_id = c.category_id 
ORDER BY title; 
-- "Sort" == ORDER by 


-- I NEED film, language and film title 
-- SELECT f.title AS title, l.name AS film_language 
-- FROM film AS f 
-- LEFT JOIN language AS l 
-- ON f.language_id = l.language_id 
-- ORDER BY title DESC;

-- I NEED categories and number of films/ category 
SELECT c.name AS categories, COUNT(f.title) AS number_of_films
FROM category AS c 
JOIN film_category AS fc 
ON c.category_id = fc.category_id 
JOIN film AS f 
 ON fc.film_id = f.film_id 
GROUP BY categories 
ORDER BY number_of_films DESC; 

-- I NEED customers, and number of rentals - sort by rentals 
/*SELECT c.first_name AS F_name, c.last_name AS L_name, COUNT(DISTINCT r.rental_id) AS number_of_rentals 
FROM customer AS c
LEFT JOIN rental AS r 
ON c.customer_id = r.customer_id
GROUP BY F_name, L_name
ORDER BY number_of_rentals; */ 

/*SELECT CONCAT(first_name,' ', last_name) AS full_name
FROM actor*/ 


-- CAN use INDEXING through the use of columns 


-- removing tables 

DROP TABLE actor_julia;


CREATE TABLE actor_julia (
actor_id INT NOT NULL,
first_name VARCHAR (35) NOT NULL,
last_name VARCHAR (35) NOT NULL,
LAST_update TIMESTAMP NOT NULL
)
;

INSERT INTO actor_julia 
SELECT * 
FROM actor 
WHERE first_name = 'Julia'; 

select * 
from actor_julia;