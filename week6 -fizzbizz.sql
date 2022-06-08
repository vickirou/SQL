SELECT category_id, name, 
	CASE 
	WHEN (category_id % 3 = 0 AND category_id % 5 = 0) THEN 'FizzBuzz' 
    WHEN category_id % 3 = 0 THEN 'Fizz' 
    WHEN category_id % 5 = 0 THEN 'Bizz' 
	
	ELSE category_id 
END AS fizz_or_bizz  
FROM category; 