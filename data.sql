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

CREATE DATABASE tiny_credit_card_company;

DROP TABLE IF EXISTS vendor CASCADE;
CREATE TABLE IF NOT EXISTS vendor (
vendor_number VARCHAR(5) PRIMARY KEY, 
cname VARCHAR ( 50 ) NOT NULL,
city VARCHAR ( 50 ) NOT NULL,
balance INT DEFAULT 0
);

DROP TABLE IF EXISTS customer CASCADE; 
CREATE TABLE IF NOT EXISTS customer (
account_number VARCHAR(5) PRIMARY KEY, 
cname VARCHAR ( 50 ) UNIQUE NOT NULL,
province VARCHAR ( 50 ) NOT NULL,
balance INT DEFAULT 0,
crlimit INT DEFAULT 0
);

DROP TABLE IF EXISTS transaction;
CREATE TABLE IF NOT EXISTS transaction (
transaction_number VARCHAR(5) PRIMARY KEY, 
vendor_number VARCHAR(5) NOT NULL,
account_number VARCHAR(5) NOT NULL,
amount INT NOT NULL,
date DATE NOT NULL DEFAULT NOW(),
FOREIGN KEY (vendor_number) REFERENCES vendor (vendor_number),
FOREIGN KEY (account_number) REFERENCES customer (account_number)
);

-- Adding data to customers table 
INSERT INTO customer(account_number, cname, province, balance, crlimit)VALUES 
('c1', 'Smith', 'ONT', 2515.00, 2000), 
('c2', 'Jones', 'BC', 2014.00, 2500),
('c3', 'Doc', 'ONT', 150.00, 1000);

-- Adding data to vendors table 

INSERT INTO vendor(vendor_number, cname, city, balance)VALUES 
('v1', 'IKEA', 'Toronto', 200.00), 
('v2', 'Walmart', 'Waterloo', 671.00),
('v3', 'Esso', 'Windsor', 0.00),
('v4', 'Esso', 'Waterloo', 225.00);


-- Adding data in transaction table 

INSERT INTO transaction(transaction_number, vendor_number, account_number, amount, date)VALUES 
('t1', 'v2', 'c1', 1325.00,'2022-07-15'), 
('t2', 'v2', 'c3', 1900.00,'2021-12-16'),
('t3', 'v3', 'c1', 2500.00,'2022-09-01'),
('t4', 'v4', 'c2', 1613.00,'2022-03-20'),
('t5', 'v4', 'c3', 2212.00,'2022-07-31');

 


