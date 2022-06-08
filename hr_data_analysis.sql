CREATE TABLE hr_data( 
id_employee INT NOT NULL PRIMARY KEY, 
sat_level FLOAT NOT NULL, 
last_eval FLOAT, 
num_projects INT,
avg_monthly_hrs INT NOT NULL, 
time_spend_company INT,
work_accident INT,  
employee_left INT,
promotion INT, 
sales VARCHAR(255) NOT NULL, 
salary VARCHAR(255)
);
 
-- Check 

-- DESC hr_data

SELECT id_employee, salary, avg_monthly_hrs, employee_left, promotion, NUM_PROJECTS, time_spend_company, sales, sat_level, LAST_EVAL
FROM hr_data 
WHERE 
employee_left=1 
AND
(time_spend_company >= 4 OR num_projects >= 5 OR last_eval > 0.716) 
ORDER BY avg_monthly_hrs AND salary;

-- during lesson 5/6 -- MAY 24TH 

-- Q1// analysing the various level of employees who left and who didnt leave -- this is why we want the AVERAGE of everything else + we can GB the employees who left and stayed 
SELECT employee_left, 
avg(sat_level), 
avg(last_eval), 
avg(num_projects), 
avg(time_spend_company), 
avg(avg_monthly_hrs)
FROM hr_data 
GROUP BY employee_left;

-- Q2// now find which ones are good employees and which AINT! 
SELECT employee_left, 
avg(sat_level), 
avg(last_eval), 
avg(num_projects), 
avg(time_spend_company), 
avg(avg_monthly_hrs)
FROM hr_data 
WHERE
time_spend_company >= 4 OR num_projects >= 5 OR last_eval > 0.7161017 
GROUP BY employee_left; 

-- NOT 
SELECT employee_left, 
avg(sat_level), 
avg(last_eval), 
avg(num_projects), 
avg(time_spend_company), 
avg(avg_monthly_hrs)
FROM hr_data 
WHERE
time_spend_company < 4 OR num_projects < 5 OR last_eval < 0.7161017 
GROUP BY employee_left; 


-- LAST THING FOR Q1/Q2: take into excel and compare those differences, the high performers who left are burnt out, the low performers are still burnt out to a degree 
SELECT title, rental_rate, length, 
	IF (length >= 50, 'long_movie', 'short_movie') as movie_length
FROM film; 

-- Q3: finding the sales department worked in 
SELECT sales AS department_name, COUNT(employee_left) As num_of_employees_left 
FROM hr_data 
WHERE employee_left = 1 
GROUP BY department_name
ORDER BY num_of_employees_left DESC ; 




/* NEW TOPIC: IF & CASE WHEN */ 

SELECT AVG(length) AS average_length, AVG(rental_rate) AS average_rental_rate, 
	IF (length >= 50, 'long_movie', 'short_movie') as movie_length 
FROM film
GROUP BY movie_length ; 

-- IF ( CONDITION, value if condition TRUE, value if condition FALSE) 


-- CASE 
-- CASE WHEN is easier to update -- just use this bc any parameter can be used 
SELECT title, rental_rate, length, 
	CASE 
    WHEN length < 50 THEN 'short_movie' 
    WHEN (length >= 50 AND length <= 120) THEN 'regular_movie' -- or just the 120 bc by the time it gets first line itll hit the second line and movie forward with that 
    ELSE "long_movie" 
    END AS length_type 
FROM film; 


SELECT employee_left AS employee_leave_stay, AVG(time_spend_company) AS avg_time_working_at_company, AVG(num_projects) AS avg_project, AVG(last_eval) AS avg_last_evaluation, 
AVG(sat_level) AS average_satisfaction, 
CASE 
WHEN employee_left = 1 AND (time_spend_company >= 4 OR num_projects >= 5 OR last_eval > 0.7161017)  THEN 'employee_left_high_performer' 
WHEN employee_left = 1 AND (time_spend_company < 4 OR num_projects < 5 OR last_eval < 0.7161017)  THEN 'employee_left_low_performer' 
WHEN employee_left = 0 AND (time_spend_company >= 4 OR num_projects >= 5 OR last_eval > 0.7161017)  THEN 'employee_stay_high_performer' 
ELSE 'employee_stay_low_performer' 
END AS performance_indicator 
FROM hr_data
GROUP BY performance_indicator, employee_left   
; 


 
 -- IF STATEMENT CANNOT DO MORE THAN VALUE, IF TRUE, IF FALSE 
-- i believe has something to do with not getting any promotions in the 4 years, additionally can be due to the extended hours put in with no recogniztion 
-- also can narrow down promotion for what the "type" of work is (e.g. hr, sales, etc.) 
-- salary can also be used to compare the time spent at the company W/OUT a promotion -- if low for 5 years of course will leave 