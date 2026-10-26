SHOW databases;

CREATE database bankingDB;
use bankingdb;

create table customers (
customerID int,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
phone varchar(10)
);

desc customers;