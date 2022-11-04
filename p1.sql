/*
Program 1: 
*displays data of all the transactions of a given customer. ✅
For each transaction, the data to display include vendor name, date, and amount. ✅
Write the program as a function that accepts a customer name as a parameter, ✅
and displays transactions of the customer.
*/
DROP FUNCTION IF EXISTS fn_display_customer_transaction(text);
CREATE OR REPLACE FUNCTION fn_display_customer_transaction(_cst_name TEXT) 
RETURNS TABLE(vendor_name VARCHAR, date DATE, amount INT)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY
 SELECT 
  V.cname As vendor_name,
  TR.date,
  TR.amount 
 FROM customer AS C
 INNER JOIN transaction AS TR  USING(account_number) 
 INNER JOIN vendor AS V USING(vendor_number)
 WHERE C.cname ILIKE _cst_name;
END
$$;

-- Calling the function 
SELECT * FROM fn_display_customer_transaction('Smith');