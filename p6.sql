/*
Program 6 charges each vendor a service fee 
that is 2.5% of the vendor’s balance, ✅
and subtracts the service fee from the balance. ✅
The program then displays the name of each vendors, the fee charged, and the new balance.✅
Date : Tuesday november 1 2022
Author : Wadson Vaval 
OWNER : Karla Gomez
*/

DROP FUNCTION IF EXISTS fn_vendors_service_fee();
CREATE OR REPLACE FUNCTION fn_vendors_service_fee() 
RETURNS TABLE(vendor_name VARCHAR, fee numeric, new_balance numeric)
 LANGUAGE plpgsql AS
$$
BEGIN
 RETURN QUERY
SELECT 
V.cname AS vendor_name,
round((2.5* V.balance/100),2)AS fee,
round((V.balance-(2.5* V.balance/100)),2)AS new_balance
From vendor AS V;
END
$$;

SELECT * FROM fn_vendors_service_fee();