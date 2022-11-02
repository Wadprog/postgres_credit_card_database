/*
Program 3: inserts a new customer record (tuple).
*Write this program as a function,✅
*which takes data of the customer as parameters and stores the data into the customer table.✅
*It then displays all the customer records. The balance of the new customer should be zero (0.00).✅
*/

DROP FUNCTION IF EXISTS fn_add_customer(text,text);
CREATE OR REPLACE FUNCTION fn_add_customer( name TEXT, province TEXT) 
RETURNS void AS--TABLE(account_number INT, name TEXT, province TEXT, crlimit INT)
$$
BEGIN
 INSERT INTO customer(name, province)
 VALUES( name, province);

END;
$$
LANGUAGE 'plpgsql' VOLATILE
COST 100;



-- Calling the function 
SELECT * FROM fn_add_customer('Jeff','ONT');
SELECT * FROM customer