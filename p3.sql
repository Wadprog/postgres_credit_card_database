/*
Program 3: inserts a new customer record (tuple).
*Write this program as a function,✅
*which takes data of the customer as parameters and stores the data into the customer table.✅
*It then displays all the customer records. The balance of the new customer should be zero (0.00).✅
*/

DROP FUNCTION IF EXISTS fn_add_customer(text,text,text,INT,INT);
CREATE OR REPLACE FUNCTION fn_add_customer(_account_number TEXT, cname TEXT, province TEXT, _balance INT,_crlimit INT) 
RETURNS void AS
$$
BEGIN
 INSERT INTO customer(account_number,cname, province,balance,crlimit)
 VALUES(_account_number, cname, province,_balance,_crlimit);

END;
$$
LANGUAGE 'plpgsql' VOLATILE
COST 100;



-- Calling the function 
SELECT * FROM fn_add_customer('c4','Jeffr','ONT',0,0);
SELECT * FROM customer