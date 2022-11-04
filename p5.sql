/*
Program 5 calculates the total amount of transactions of every vendor in the transaction table, ✅
and add the total amount to the vendor’s current balance. ✅
The program then displays vendor numbers, vendor names and the new balances.✅
Date : Tuesday november 1 2022
Author : Wadson Vaval 
OWNER : Karla Gomez
*/

DROP FUNCTION IF EXISTS fn_vendors_total_transaction();
CREATE OR REPLACE FUNCTION fn_vendors_total_transaction() 
RETURNS TABLE(vendor_number VARCHAR, vendor_name VARCHAR, new_balances bigint)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY
SELECT 
V.vendor_number, 
V.cname AS vendor_name,
balance+(
SELECT COUNT(*)
From transaction 
WHERE transaction.vendor_number =V.vendor_number
)AS new_balances
From vendor AS V;
END
$$;

SELECT * FROM fn_vendors_total_transaction();
