/*
Program 7 charges a service fee for each customer 
whose current balance is greater than the credit limit and ✅
add the charge to the balance. ✅
The service fee is 10% of the portion over the credit limit. ✅
The program then displays the name of each of such customers and the new balance.✅
Date : Tuesday november 1 2022
Author : Wadson Vaval 
OWNER : Karla Gomez
*/

DROP FUNCTION IF EXISTS fn_vendors_service_fee();
CREATE OR REPLACE FUNCTION fn_vendors_service_fee() 
RETURNS TABLE(customer_name VARCHAR, new_balance numeric)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY
SELECT 
C.cname AS customer_name,
round((C.balance +(10* (C.balance-C.crlimit)/100)),2)AS new_balance
From customer AS C
WHERE C.balance > C.crlimit;
END
$$;

SELECT * FROM fn_vendors_service_fee();