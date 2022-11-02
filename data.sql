/*
Conditions: 
*Use PostgreSQL to create tables and develop application programs.✅
*The database is the tiny credit card company database. ✅
*The tables store data of customers, vendors, and transactions. ✅
*Write a PostgreSQL script to create the three tables with names vendor, customer, and transaction,✅ 
*and insert data into the three tables. ✅ 
*The data are those on slide 5 in “4. The Structured Query Language (SQL)”. 
*Specify the vendor number, account number and transaction number as the primary keys respectively, ✅ 
*and insert data into the tables. Use the PostgreSQL date format to store dates.✅ 
*Write a script to create the tables and insert the data. The file should be named ‘data.sql’.✅ 
Date : Tuesday november 1 2022
Author : Wadson Vaval 
OWNER : Karla Gomez
*/

DROP DATABASE IF EXISTS tiny_credit_card_company;

CREATE DATABASE IF NOT EXISTS tiny_credit_card_company;

DROP TABLE IF EXISTS vendor CASCADE;
CREATE TABLE IF NOT EXISTS vendor (
vendor_number serial PRIMARY KEY, 
name VARCHAR ( 50 ) NOT NULL,
city VARCHAR ( 50 ) NOT NULL,
balance INT DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS customer CASCADE; 
CREATE TABLE IF NOT EXISTS customer (
account_number serial PRIMARY KEY, 
name VARCHAR ( 50 ) UNIQUE NOT NULL,
province VARCHAR ( 50 ) NOT NULL,
balance INT DEFAULT 0,
crlimit INT DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS transaction;
CREATE TABLE IF NOT EXISTS transaction (
transaction_number serial PRIMARY KEY, 
vendor_number INT NOT NULL,
account_number INT NOT NULL,
amount INT NOT NULL,
date DATE NOT NULL DEFAULT NOW(),
FOREIGN KEY (vendor_number) REFERENCES vendor (vendor_number),
FOREIGN KEY (account_number) REFERENCES customer (account_number)
);

-- Adding data to customers table 
INSERT INTO customer(account_number, name, province, balance, crlimit)VALUES 
(1, 'Smith', 'ONT', 2515.00, 2000), 
(2, 'Jones', 'BC', 2014.00, 2500),
(3, 'Doc', 'ONT', 150.00, 1000)

RETURNING *; 
-- Adding data to vendors table 

INSERT INTO vendor(vendor_number, name, city, balance)VALUES 
(1, 'IKEA', 'Toronto', 200.00), 
(2, 'Walmart', 'Waterloo', 671.00),
(3, 'Esso', 'Windsor', 0.00),
(4, 'Esso', 'Waterloo', 225.00)

RETURNING *; 

-- Adding data in transaction table 

INSERT INTO transaction(transaction_number, vendor_number, account_number, amount, date)VALUES 
(1, 2, 1, 1325.00,'2022-07-15'), 
(2, 2, 3, 1900.00,'2021-12-16'),
(3, 3, 1, 2500.00,'2022-09-01'),
(4, 4, 2, 1613.00,'2022-03-20'),
(5, 4, 3, 2212.00,'2022-07-31')

RETURNING *; 


