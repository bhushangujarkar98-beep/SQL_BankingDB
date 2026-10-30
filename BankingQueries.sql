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

