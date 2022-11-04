/*
*Program 2: displays data of the customers who have transactions with a given vendor. 
*The data include customer numbers, customer names, and provinces. 
*Write the program as a function that accepts a vendor name as a parameter and displays data of customers.
*/

DROP FUNCTION IF EXISTS fn_display_customer_data(text);
CREATE OR REPLACE FUNCTION fn_display_customer_data(_vendor_name TEXT) 
RETURNS TABLE(customer_number VARCHAR, customer_name VARCHAR, province VARCHAR)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY
 SELECT 
  C.account_number As customer_number,
  C.cname AS customer_name,
  C.province 
 FROM vendor AS V
 INNER JOIN transaction AS TR USING(vendor_number)
 INNER JOIN customer AS C USING(account_number)
 WHERE V.cname ILIKE _vendor_name;
END
$$;

-- Calling the function 
SELECT * FROM fn_display_customer_data('Walmart');