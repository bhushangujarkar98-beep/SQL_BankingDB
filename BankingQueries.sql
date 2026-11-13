SHOW databases;

create database BankingDB;
use BankingDB;
CREATE TABLE Customers ( 
CustomerID INT,
 firstname varchar(50),
 lastname varchar(50),
 email varchar(100),
 phone varchar(15)
 );
 Alter table customers
 add constraint pk_customer_id primary key(CustomerID);
 
 desc Customers;
 use BankingDB;
 select * from  customers;
 Alter table customers
 add AccountCreation_Date date;
 create table Accounts(
 AccountID INT,
 AccountType Varchar(20),
 Balance Decimal(10,2));
 Alter table Accounts
 add constraint pk_account_id primary key(AccountID);
 create table Transactions(
 TransactionID Int,
 TransactionDate Date,
 Amount Decimal(10,2),
 TransactionType Varchar(20));
 alter table Transactions
 add constraint pk_transaction_id primary key(TransactionID);
 desc Accounts;
 desc Transactions;
 create table Branches(
 BranchID Int,
 BranchName varchar(100),
 BranchAddress varchar(200),
 BranchPhone varchar(15));
 Create table AccountBranches(
 AssignmentDate date);
 alter table Branches
 add constraint pk_branch_id primary key(BranchID);

 desc branches;
 desc accountbranches;
 create table Loans(
 LoanID INT,
 LoanAmount Decimal(10,2),
 InterestRate Decimal(5,2),
 StartDate Date,
 EndDate Date);
 desc Loans;
 alter table loans
 add constraint pk_loan_id primary key(LoanID);
 
 alter table accounts
 add constraint chk_balance
 check (balance>=1000);
 desc accounts;
 
 drop table accountbranches;
 
 alter table accounts
 add CustomerID int;
 desc accounts;
 
 alter table accounts
 add constraint fk_accounts_customers foreign key(CustomerID) references Customers(CustomerID);
 desc accounts;
 
 alter table customers
 modify firstname varchar(50) NOT NULL;
 Desc customers;
 
 alter table customers
 add constraint uk_email UNIQUE (email);
 desc customers;
 
 alter table customers
 alter column lastname set default "NA";
 
 alter table accounts
 add BranchID int;
 desc accounts;
 
 alter table accounts
 add constraint fk_branches_accounts
 foreign key(BranchID)references branches(BranchID);
 desc accounts;
 
 alter table transactions
 add AccountID int;
 desc transactions;
 
 alter table transactions
 add constraint fk_accounts_transactions foreign key(AccountID) references accounts(AccountID);
 desc transactions;
 
 alter table loans
 add CustomerID int;
 desc loans;
 
 alter table loans
 add constraint fk_customers_loans foreign key(CustomerID) references Customers(CustomerID);
 desc loans;
 
 
 create table KYC(
 kycid int primary key,
 aadhaarNo varchar(12) not null,
 panNo varchar(10) not null,
 customerid int not null,
 constraint fk_customer foreign key(customerid) references customers (customerid));
 
 show create table ACCOUNTS; -- YOU CAN CHANGE TABLE NAME AS PER YOUR REQUIREENTS
 
 -- YOU CAN GET INFORMATION ABOUT CONSTRAINT APPLIED ON A SPECIFIC TABLE
-- BY THE QUERY WRITTEN BELOW
 SELECT
   CONSTRAINT_NAME,
   CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA='BANKINGDB'
  AND TABLE_NAME='KYC';
  select * from customers;
  insert into customers
  values(101,'Amit','Sharma''','amit@gmail.com','9876543210','2024-01-15','1998-05-10');
  select * from customers;
  insert into customers(CustomerID,firstname,lastname,email,phone,AccountCreationDate,AccountCreation_Date)
  values('102','Priya','Patil','priya@gmail.com','9876543211','2024-02-10','1999-08-22');
  select * from customers;
  insert into customers
  (phone,email,lastname,firstname,accountcreationdate,accountcreation_date,customerid)
  values('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);
  select * from customers;
  INSERT INTO Customers
VALUES
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
select * from accounts;

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);
select * from transactions;


INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);
select * from loans;

ALTER TABLE customers
RENAME COLUMN AccountCreation_Date TO dateofbirth;

update customers
set email='amit2026@yahoo.com'
where customerid=101;
update customers
set lastname='Joshi'
where customerid=102;
update customers
set lastname='Sharma'
where customerid=101;
select * from branches;
update branches
set branchaddress='Civil Lines, Nagpur',
branchphone='0712-562692'
where branchid=1;


select * from kyc;
insert into kyc
values(701,'234567829321','HGKUY8585',101),
(701,'896745986754','AJKER7575',102),
(701,'674532987634','IOGHY3434',103);
insert into kyc
values(701,'234567829321','HGKUY8585',101),
(702,'896745986754','AJKER7575',102),
(703,'674532987634','IOGHY3434',103);
 
 
Delete from kyc where kycid=702; 
 delete from kyc;
 
 -- get all data for all customers
 select * from customers;
 -- Find firstname,email of all customers
 select firstname, email from customers;
 
 
 select * from accounts;
-- Find account who have balance>20000 
 select * from accounts
 where balance>40000;
 
 
 select accountid,balance from accounts
 where balance>40000;
 
 -- Find all customers having acccounttype=current
 select accountid,accounttype,balance from accounts
 where accounttype='current';
 
 -- Find detail of customerid=104
 select * from customers
 where customerid=104;
 
 -- Find all customers whose accounttype is savings and balance>20000(using AND ,OR operator)
 select * from accounts
 where accounttype='savings' and balance>20000;
 
 
 select * from accounts
 where accounttype='savings' or balance>20000;
 
 
 select * from accounts
 where accounttype='current' or balance>20000;
 
 -- Using not operator
 select * from accounts
 where accounttype !='savings';
 
 select * from accounts
 where not  accounttype ='savings';
 
 select * from accounts
 where accounttype <> 'savings';
 
 
 select * from loans;
 select * from loans
 where interestrate=8.5 or interestrate=9.0;
 
 -- Using IN operator 
 select * from loans
 where interestrate in (8.5,9.0);
 
 
 -- Using NOT IN operator
 select * from transactions
where transactiontype not in ("deposit","transfer");


 -- Using BETWEEN operator 
 select * from loans
 where interestrate between 7.5 and 8.5;
 
 -- Find all customers having balance between 40k to 60k
 select * from accounts
 where balance between 20000 and 60000;
 
 
-- Find all customers having balance between 40k to 60k where accounttype=current
select * from accounts
where balance between 20000 and 60000 and accounttype='current';

-- Using LIKE operator
select * from customers;
select * from customers
where lastname like 'J%';
 
 
select * from customers
where lastname like '%a';


select * from customers
where firstname like 'P____';


select * from customers
where firstname like '%ya';


select * from customers;
select * from accounts;


-- Sort accounts table as per balance in descending order
select * from accounts
order by balance desc;


select * from accounts
order by balance ;


select * from accounts
order by balance and branchid desc;

create database  pizza_sales_analysis;
use  pizza_sales_analysis;

desc branches;
-- BRANCHES  (NULL address / NULL phone; branch 6 has no accounts)
INSERT INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');
select * from branches;

-- CUSTOMERS  (NULL lastname / email / Phone / dates)
INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');
select * from customers;

-- lastname omitted on purpose, so the DEFAULT 'NA' is applied
INSERT INTO customers (customerID, FirstName, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(114, 'Kavita', 'kavita@gmail.com', '9876543223', '2025-03-03', '2002-04-17');

-- ACCOUNTS  (NULL AccountType / Balance / CustomerID / BranchID)
-- Customers 114 and 115 intentionally have NO account.
INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES
(1006, 'Savings', 32000.00,  106,  1),
(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);

select * from accounts;

-- KYC  (table was empty; only some customers have KYC)
-- No KYC for 108, 110, 111, 113, 114, 115
INSERT INTO kyc (kycid, aadhaarNo, panNo, customerid) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);
select * from kyc;

-- LOANS  (NULL InterestRate / LoanAmount / EndDate / CustomerID)
INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES
(504, 400000.00, 8.25, '2025-01-10', '2030-01-10', 105),
(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);
select * from loans;

-- TRANSACTIONS  (NULL Amount / TransactionType / AccountID / TransactionDate)
-- Accounts 1008, 1009, 1012, 1014 have no transactions.
INSERT INTO transactions (TransactionID, TransactionDate, Amount, TransactionType, AccountID) VALUES
(6,  '2025-01-18', 1500.00,  'Deposit',    1005),
(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);
select * from transactions;


-- DISTINCT CLAUSE
select distinct accounttype from accounts;
select distinct transactiontype from transactions;
select distinct customerid,loanid from loans;

-- LIMIT CLAUSE
select * from transactions
Limit 5;

select * from transactions
order by amount desc
limit 3;

-- find top 2 transaction having highest withdrawl amount
select * from transactions
where transactiontype='withdrawal'
order by amount desc
limit 2;


-- OFFSET CLAUSE
select * from customers
limit 5 offset 5;


-- Find the customer having 3rd highest loan amount
select * from loans;
select * from loans
order by loanamount desc
limit 1 offset 2 ;


-- NULL
Select customerid,firstname,lastname,email from customers
where lastname is null;


Select customerid,firstname,lastname,email from customers
where email is null;

Select customerid,firstname,lastname,email,phone from customers
where email is null and phone is null;


--  CASE STATEMENTS
select * from loans;

select loanid,loanammount,customerid,
case
when loanammount>=500000 then "High Value Loan"
when loanammount>=200000 then "Medium Value Loan"
else "Low Value Loan"
end as LoanCategory
from loans;

select * from transactions
when transactiontype = "deposit" and amount >= 5000 then "medium amount"
when transactiontype = "deposit" and amount >= 0 then "low amount"
else "not applicable" end as "depositCategory"
from transactions;

-- string function
-- upper function
select * from customers;
select upper ("hello");
select upper(firstname) as firstname , phone, email from customers;

-- lower() function

select * from customers; 
select lower(firstname) as firstname, lower(lastname) lastname from customers;

-- length() function
select length("nagpur") As "NoofCharacters"; -- gives o/p in number of bytes

select length("नागपुर"); -- gives o/p in number of characters
select char_length ("nagpur");-- gives o/p in number of bytes
select char_length("नागपुर");-- gives o/p in number of characters

select concat("Hello", "World")as concatenatedString;
select concat(firstname," ",lastname) as fullname, phone, email from customers;

-- substring() or substr() function
select substr("hello world india",7,5) as extractedstring;

select customerid, concat(substr(firstname,1,1)," ", lastname) as fullname, phone,email from customers;

-- tri() function

select length("  Hello World"  );
select length(trim("  Hello World  "));
select length(trim(substring("hello world",6)));

-- Replace() function

select replace("Mat mat Mat", "M", "C");

-- Mathematical() functions 

-- Round() function
select * from accounts;

select avg(Balance) from accounts
where accounttype = "Savings";

select round(avg(balance),2) as avgbalance from accounts
where accounttype = "savings";

select round(3.6);
select round(3.3);
select round(3.5);

 -- ceil() Ceiling() function
 select ceiling(avg(balance)) from accounts
 where accounttype = "savings";
 
  select floor(avg(balance)) from accounts
 where accounttype = "savings";
 
 -- absolute() function.......it removes the sign
 select abs(-3656);
  select abs(-1.34);
   select abs(-6.464);
   
   -- mod() function
   select (7/3);
   select mod(7,3);
   
   -- power()
   select power(2,3);
   select power(1,5);
   
   -- sqrt()
   select sqrt(123);
   select sqrt(144);