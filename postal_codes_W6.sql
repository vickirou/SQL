SELECT *, 
CASE 
WHEN 
data REGEXP'^[0-9]{5}$'THEN 'Zip_Code'  -- did CASE WHEN in order to categorize the rest of the information
WHEN 
data REGEXP '^\\([0-9]{3}\\)-[0-9]{3}-[0-9]{4}' THEN 'Phone'
WHEN 
data REGEXP '^[A-Za-z]@[A-Za-z]$' THEN 'email_address'
ELSE 'other' 
END AS data_type
FROM customer_contacts.contactdata; 