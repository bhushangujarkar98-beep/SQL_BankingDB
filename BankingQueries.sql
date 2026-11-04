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

alter table customers
add constraint pk_customer_ID primary key (customerID);

select * from customers;

alter table customers
add AccountCreationDate date;

alter table customers
add DateOfBirth date;

alter table customers
modify Phone varchar(20);

desc customers;

alter table Customers
modify FirstName varchar(50) not null;

alter table Customers
add constraint uq_Email unique (Email);

alter table customers 
alter column lastname set default "NA";

create table Accounts (
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);

desc Accounts;

alter table Accounts
add constraint pk_Account_ID primary key (AccountID);

alter table Accounts
add constraint chk_MinBalance
check (Balance >= 1000);

alter table Accounts
add CustomerID int;
alter table Accounts
add constraint fk_Accounts_Customers
foreign key (CustomerID)
references customers(CustomerID);

create table Transaction(
TransactionID int,
TransactionDate date,
account decimal(10,2),
TransactionType varchar(20)
);


alter table transaction
add AccountID int;
alter table transaction
add constraint fk_transaction_account
foreign key(AccountID)
references Accounts(AccountID);

desc Transaction;

alter table Transaction
add constraint pk_Transaction_ID primary key (TransactionID);

create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);
desc Branches;

alter table Branches
add constraint pk_Branch_ID primary key (BranchID);

create table AccountBranches (
AssignmentDate date
);
desc accountBranches;

drop table AccountBranches;

alter table accounts
add branchID int;
alter table Accounts
add constraint fk_Accounts_Branches
foreign key(BranchID)
references Branches(BranchID);

create table Loans(
LoanID int, 
LoanAmmount Decimal(10,2),
InterestRate Decimal(5,2),
StartDate date,
EndDate date
);

desc Loans;

ALTER TABLE Loans
ADD CONSTRAINT pk_Loan_ID PRIMARY KEY (LoanID);

alter table Loans
add CustomerID int;
alter table Loans
add constraint fk_Loans_customer
foreign key(CustomerID)
references Customers(CustomerID);

create table KYC(
KYCID int primary key,
Adhar_num varchar(12) not null,
Pan_num varchar(10) not null,
CustomerID int not null,
constraint fk_customer
foreign key(customerID) references Customers(CustomerID)
);
drop table KYC;

create table KYC(
KYCID int primary key,
Adhar_num varchar(12) not null,
Pan_num varchar(10) not null,
CustomerID int not null,
constraint fk_customer
foreign key(customerID) references Customers(CustomerID)
);

show create table KYC; -- you can change table name as per your requirement

-- you can get information about contraints applied on a specific table
-- by the query written below
select
constraint_name,
constraint_type
from information_schema.table_constraints
where table_schema = 'bankingdb'
and table_name = 'KYC';
select * from customers;
  insert into customers
  values(101,'Amit','Sharma''','amit@gmail.com','9876543210','2024-01-15','1998-05-10');
  select * from customers;
  insert into customers(CustomerID,firstname,lastname,email,phone,AccountCreationDate,DateOfBirth)
  values(102,'Priya','Patil','priya@gmail.com','9876543212','2024-02-10','1999-08-22');
  
  select * from customers;
  
  
  insert into customers
  (phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerid)
  values ('9876543211' , 'rahul@gmail.com' , 'verma' , 'rahul' , '2024-03-12' , '1997-11-14' , 103);  
  
insert into customers
values 
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');
select * from branches;

INSERT INTO Accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);
select* from accounts;

INSERT INTO Transaction
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);
select * from transaction;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);
select* from loans;

update customers
set email = 'amit2026@yahoo.com'
where customerid = 101;
select * from customers;


update customers 
set Phone = '9876543212'
where customerid = 103;
 select * from branches;
 
 update branches
 set branchaddress = 'Cvil Lines, Nagpur',
 branchphone = '0712562692'
 where branchid = 1;
 
 insert into kyc
 values (701, '672635738265', 'HDSHD8686H', 101),
 (702, '737673766273', 'HFHJH8756J', 102),
 (703, '73579852437', 'HSKGD9784K', 103);
 
 delete from kyc where kycid = 702;
 select * from kyc;
 
 delete from kyc;
 
 select * from customers;
 select firstname, email, phone from customers;
 
-- get all data for all customers

 select customerid,balance from accounts
 where balance > 40000;
 
 select accountid, accounttype, balance from accounts
 where accounttype = 'savings';
 
 select customerid from customers
 where customerid =104;
 
 -- find all customers whose account type is saving and balance is greater than 20000-- 
 SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        AND balance > 20000;
 
 SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        AND balance > 20000;
 
 SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        AND balance > 20000;
 
 SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'current'
        or balance > 20000; 
        -- find all accounts  where account type is not savings 
select * from accounts
where not accounttype = 'savings';

select *  from accounts
where accounttype != 'savings';

select *  from accounts
where accounttype <> 'savings';

select * from loans;
select * from loans 
where interestrate = 8.5 or interestrate =9.0;

select * from loans 
where interestrate in (8.5,9.0);

-- find all customers having balance between 20k to 60k
select * from accounts
where balance between 20000 and 60000;

-- find all customers having balance between 20k to 60k
-- and account type should be current
select * from accounts
where balance between 20000 and 60000 and accounttype = 'current';

select * from customers;

-- Like operator

select * from customers
where lastname LIKE 'J%';

select * from customers
where firstname LIKE '%ya';

select * from customers
where firstname LIKE 'P____';

-- that is not single line that is underscores
select * from customers
where firstname LIKE 'A___';

select * from accounts;

-- sort accounts tble as per balance in descending order

select * from accounts
order by balance desc;

select * from accounts
order by accounttype desc,balance desc;
