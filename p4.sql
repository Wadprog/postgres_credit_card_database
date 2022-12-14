/*
Program 4 displays the most recent transaction of every customer.
The program displays account number, customer name, amount, and vendor name.
If a customer has no transaction (e.g. the new one), the program should display “no transaction”.
Date : Tuesday 2 November 2 2022
Author : Wadson Vaval 
OWNER : Karla Gomez
*/

DROP FUNCTION IF EXISTS fn_cst_recent_transaction();
CREATE OR REPLACE FUNCTION fn_cst_recent_transaction() 
RETURNS TABLE(account_number VARCHAR, customer_name VARCHAR, amount TEXT)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY SELECT 
  C.account_number,
  C.cname AS customer_name,
  COALESCE(MAX(T.amount)::TEXT,'no transaction')AS transaction_amount
  FROM transaction AS T
  RIGHT JOIN customer AS C  USING(account_number)
  GROUP BY T.account_number, C.account_number,C.cname;
END;
$$;

-- Calling the function 
SELECT * FROM fn_cst_recent_transaction();
