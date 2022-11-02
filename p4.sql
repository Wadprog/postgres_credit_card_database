/*

Program 4 displays the most recent transaction of every customer.
The program displays account number, customer name, amount, and vendor name.
If a customer has no transaction (e.g. the new one), the program should display “no transaction”.
*/

DROP FUNCTION IF EXISTS fn_cst_recent_transaction();
CREATE OR REPLACE FUNCTION fn_cst_recent_transaction() 
RETURNS TABLE(account_number INT, customer_name VARCHAR, amount INT, vendor_name VARCHAR)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY
  SELECT 
  C.account_number,
  C.name AS customer_name, 
  (
  SELECT amount
	FROM transaction
	--INNER JOIN customer AS C on transaction.account_number=C.account_number
   WHERE transaction.account_number=C.account_number
   GROUP BY transaction.account_number
   ORDER BY transaction.date DESC
  
   --LIMIT 1
  )AS amount
  FROM customer AS C
  
END
$$;

-- Calling the function 
SELECT * FROM fn_display_customer_transaction('Smith');
SELECT * FROM customer