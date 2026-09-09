
 MYSQL BANKING PROJECT


DROP DATABASE IF EXISTS banking;
CREATE DATABASE banking;
USE banking;


 1. BRANCHES TABLE


CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_code VARCHAR(20) UNIQUE NOT NULL,
    branch_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    address VARCHAR(255),
    ifsc_code VARCHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(15),
    manager_name VARCHAR(100),
    opening_date DATE,
    status VARCHAR(20)
);

INSERT INTO branches VALUES
(1,'BR001','Hazratganj Branch','Lucknow','Uttar Pradesh','226001',
'MG Road','BANK000001','9876500001','Rajesh Sharma','2015-04-10','ACTIVE'),
(2,'BR002','Connaught Place Branch','Delhi','Delhi','110001',
'Connaught Place','BANK000002','9876500002','Amit Verma','2014-06-15','ACTIVE'),
(3,'BR003','Gomti Nagar Branch','Lucknow','Uttar Pradesh','226010',
'Vibhuti Khand','BANK000003','9876500003','Neha Singh','2018-01-20','ACTIVE'),
(4,'BR004','Sector 18 Branch','Noida','Uttar Pradesh','201301',
'Sector 18','BANK000004','9876500004','Vikas Gupta','2017-08-12','ACTIVE'),
(5,'BR005','Main Branch','Kanpur','Uttar Pradesh','208001',
'Mall Road','BANK000005','9876500005','Priya Singh','2016-03-25','ACTIVE');



 2. CUSTOMERS TABLE


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_number VARCHAR(20) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    DOB DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    customer_since DATE,
    customer_status VARCHAR(20)
);

INSERT INTO customers VALUES
(1,'CUST001','Aman','Sharma','aman@gmail.com','9000000001',
'1999-05-10','Male','Hazratganj','Lucknow','Uttar Pradesh','226001',
'2020-01-10','ACTIVE'),

(2,'CUST002','Riya','Verma','riya@gmail.com','9000000002',
'2000-08-15','Female','Connaught Place','Delhi','Delhi','110001',
'2021-03-15','ACTIVE'),

(3,'CUST003','Ankit','Gupta','ankit@gmail.com','9000000003',
'1998-11-20','Male','Gomti Nagar','Lucknow','Uttar Pradesh','226010',
'2019-07-20','ACTIVE'),

(4,'CUST004','Priya','Singh','priya@gmail.com','9000000004',
'2001-02-12','Female','Sector 18','Noida','Uttar Pradesh','201301',
'2022-02-10','ACTIVE'),

(5,'CUST005','Neha','Yadav','neha@gmail.com','9000000005',
'1997-09-25','Female','Civil Lines','Kanpur','Uttar Pradesh','208001',
'2018-05-18','ACTIVE'),

(6,'CUST006','Rahul','Mishra','rahul@gmail.com','9000000006',
'1999-12-05','Male','Aliganj','Lucknow','Uttar Pradesh','226024',
'2020-08-12','ACTIVE'),

(7,'CUST007','Pooja','Gupta','pooja@gmail.com','9000000007',
'2000-04-17','Female','Dwarka','Delhi','Delhi','110075',
'2021-09-01','ACTIVE'),

(8,'CUST008','Arjun','Patel','arjun@gmail.com','9000000008',
'1996-06-30','Male','Indira Nagar','Lucknow','Uttar Pradesh','226016',
'2017-11-22','INACTIVE'),

(9,'CUST009','Karan','Malhotra','karan@gmail.com','9000000009',
'1995-03-11','Male','Vasundhara','Noida','Uttar Pradesh','201012',
'2019-10-05','ACTIVE'),

(10,'CUST010','Sneha','Agarwal','sneha@gmail.com','9000000010',
'2001-07-19','Female','Swaroop Nagar','Kanpur','Uttar Pradesh','208002',
'2022-06-14','ACTIVE');



 3. EMPLOYEES TABLE


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_code VARCHAR(20) UNIQUE,
    branch_id INT,
    employee_name VARCHAR(100),
    job_role VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    salary DECIMAL(10,2),
    joining_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

INSERT INTO employees VALUES
(1,'EMP001',1,'Rajesh Kumar','Manager','rajesh@bank.com',
'9111111111',85000,'2015-04-10','ACTIVE'),

(2,'EMP002',1,'Vikas Singh','Clerk','vikas@bank.com',
'9111111112',45000,'2018-06-12','ACTIVE'),

(3,'EMP003',2,'Amit Verma','Manager','amit@bank.com',
'9111111113',90000,'2014-06-15','ACTIVE'),

(4,'EMP004',2,'Rohit Sharma','Clerk','rohit@bank.com',
'9111111114',42000,'2019-02-20','ACTIVE'),

(5,'EMP005',3,'Neha Singh','Manager','neha@bank.com',
'9111111115',88000,'2018-01-20','ACTIVE'),

(6,'EMP006',3,'Kavita Gupta','Clerk','kavita@bank.com',
'9111111116',44000,'2020-03-10','ACTIVE'),

(7,'EMP007',4,'Vikas Gupta','Manager','vg@bank.com',
'9111111117',87000,'2017-08-12','ACTIVE'),

(8,'EMP008',5,'Priya Singh','Manager','priya@bank.com',
'9111111118',86000,'2016-03-25','ACTIVE');



 4. ACCOUNTS TABLE


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_number VARCHAR(30) UNIQUE NOT NULL,
    account_type VARCHAR(30),
    balance DECIMAL(15,2),
    minimum_balance DECIMAL(15,2),
    opened_date DATE,
    status VARCHAR(20),
    currency VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

INSERT INTO accounts VALUES
(101,1,1,'ACC100001','SAVINGS',150000,5000,
'2020-01-10','ACTIVE','INR'),

(102,1,1,'ACC100002','CURRENT',75000,10000,
'2021-05-15','ACTIVE','INR'),

(103,2,2,'ACC100003','SAVINGS',250000,5000,
'2021-03-15','ACTIVE','INR'),

(104,3,3,'ACC100004','SAVINGS',95000,5000,
'2019-07-20','ACTIVE','INR'),

(105,3,3,'ACC100005','FD',500000,0,
'2022-01-10','ACTIVE','INR'),

(106,4,4,'ACC100006','SALARY',120000,0,
'2022-02-10','ACTIVE','INR'),

(107,5,5,'ACC100007','SAVINGS',80000,5000,
'2018-05-18','ACTIVE','INR'),

(108,6,1,'ACC100008','SAVINGS',175000,5000,
'2020-08-12','ACTIVE','INR'),

(109,6,1,'ACC100009','CURRENT',60000,10000,
'2021-09-20','ACTIVE','INR'),

(110,7,2,'ACC100010','SAVINGS',300000,5000,
'2021-09-01','ACTIVE','INR'),

(111,8,3,'ACC100011','SAVINGS',45000,5000,
'2017-11-22','CLOSED','INR'),

(112,9,4,'ACC100012','SAVINGS',210000,5000,
'2019-10-05','ACTIVE','INR'),

(113,10,5,'ACC100013','SAVINGS',135000,5000,
'2022-06-14','ACTIVE','INR');



 5. TRANSACTIONS TABLE


CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(30),
    transaction_mode VARCHAR(30),
    amount DECIMAL(15,2),
    transaction_date DATETIME,
    description VARCHAR(255),
    reference_number VARCHAR(50) UNIQUE,
    balance_after DECIMAL(15,2),
    transaction_status VARCHAR(20),
    location VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO transactions VALUES
(10001,101,'DEPOSIT','UPI',50000,
'2025-01-10 10:15:00','Salary Credit','TXN001',
150000,'SUCCESS','Lucknow'),

(10002,101,'WITHDRAWAL','ATM',10000,
'2025-01-12 14:20:00','ATM Withdrawal','TXN002',
140000,'SUCCESS','Lucknow'),

(10003,102,'PAYMENT','NET_BANKING',25000,
'2025-01-15 09:30:00','Bill Payment','TXN003',
75000,'SUCCESS','Lucknow'),

(10004,103,'DEPOSIT','NEFT',100000,
'2025-01-18 11:10:00','Salary Credit','TXN004',
250000,'SUCCESS','Delhi'),

(10005,103,'WITHDRAWAL','ATM',20000,
'2025-01-20 17:30:00','Cash Withdrawal','TXN005',
230000,'SUCCESS','Delhi'),

(10006,104,'DEPOSIT','UPI',30000,
'2025-02-01 10:00:00','Deposit','TXN006',
95000,'SUCCESS','Lucknow'),

(10007,105,'INTEREST','BRANCH',25000,
'2025-02-05 12:00:00','FD Interest','TXN007',
500000,'SUCCESS','Lucknow'),

(10008,106,'DEPOSIT','NEFT',80000,
'2025-02-10 09:45:00','Salary','TXN008',
120000,'SUCCESS','Noida'),

(10009,107,'WITHDRAWAL','ATM',15000,
'2025-02-12 16:00:00','ATM Withdrawal','TXN009',
80000,'SUCCESS','Kanpur'),

(10010,108,'DEPOSIT','UPI',75000,
'2025-02-15 10:20:00','Salary','TXN010',
175000,'SUCCESS','Lucknow'),

(10011,109,'PAYMENT','UPI',30000,
'2025-02-16 13:00:00','Online Payment','TXN011',
60000,'SUCCESS','Lucknow'),

(10012,110,'DEPOSIT','NEFT',120000,
'2025-02-18 11:00:00','Deposit','TXN012',
300000,'SUCCESS','Delhi'),

(10013,112,'WITHDRAWAL','ATM',25000,
'2025-02-20 18:00:00','ATM Withdrawal','TXN013',
210000,'SUCCESS','Noida'),

(10014,113,'DEPOSIT','UPI',50000,
'2025-02-22 10:00:00','Deposit','TXN014',
135000,'SUCCESS','Kanpur'),

(10015,101,'PAYMENT','UPI',5000,
'2025-02-25 12:30:00','Shopping','TXN015',
145000,'SUCCESS','Lucknow');



 6. CARDS TABLE


CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    customer_id INT,
    account_id INT,
    card_number VARCHAR(30) UNIQUE NOT NULL,
    card_type VARCHAR(20),
    card_network VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    status VARCHAR(20),
    credit_limit DECIMAL(15,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO cards VALUES
(1,1,101,'4111111111111111','DEBIT','VISA',
'2022-01-10','2027-01-10','ACTIVE',NULL),

(2,2,103,'5222222222222222','DEBIT','MASTERCARD',
'2022-03-15','2027-03-15','ACTIVE',NULL),

(3,3,104,'6333333333333333','DEBIT','RUPAY',
'2021-07-20','2026-07-20','EXPIRED',NULL),

(4,4,106,'4444444444444444','DEBIT','VISA',
'2022-02-10','2027-02-10','ACTIVE',NULL),

(5,6,108,'5555555555555555','DEBIT','VISA',
'2020-08-12','2025-08-12','BLOCKED',NULL),

(6,7,110,'6666666666666666','DEBIT','RUPAY',
'2021-09-01','2026-09-01','ACTIVE',NULL);



 7. CARD TRANSACTIONS TABLE


CREATE TABLE card_transactions (
    card_transaction_id BIGINT PRIMARY KEY,
    card_id INT,
    amount DECIMAL(15,2),
    merchant_name VARCHAR(100),
    merchant_category VARCHAR(50),
    transaction_date DATETIME,
    city VARCHAR(50),
    transaction_status VARCHAR(20),
    reference_number VARCHAR(50),
    payment_channel VARCHAR(30),
    FOREIGN KEY (card_id) REFERENCES cards(card_id)
);

INSERT INTO card_transactions VALUES
(20001,1,2500,'Amazon','ONLINE_SHOPPING',
'2025-03-01 10:30:00','Lucknow','SUCCESS','CTX001','ONLINE'),

(20002,2,4500,'Flipkart','ONLINE_SHOPPING',
'2025-03-02 11:00:00','Delhi','SUCCESS','CTX002','ONLINE'),

(20003,3,1200,'DMart','GROCERY',
'2025-03-03 17:30:00','Lucknow','SUCCESS','CTX003','POS'),

(20004,4,3000,'Reliance','SHOPPING',
'2025-03-04 15:00:00','Noida','SUCCESS','CTX004','POS'),

(20005,5,1800,'Swiggy','FOOD',
'2025-03-05 20:00:00','Lucknow','FAILED','CTX005','ONLINE'),

(20006,6,2200,'Myntra','ONLINE_SHOPPING',
'2025-03-06 13:00:00','Delhi','SUCCESS','CTX006','ONLINE');



 8. BENEFICIARIES TABLE


CREATE TABLE beneficiaries (
    beneficiary_id INT PRIMARY KEY,
    customer_id INT,
    beneficiary_name VARCHAR(100),
    account_number VARCHAR(30),
    bank_name VARCHAR(100),
    ifsc_code VARCHAR(20),
    nickname VARCHAR(50),
    added_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO beneficiaries VALUES
(1,1,'Rohit Sharma','BEN10001','ABC Bank',
'ABC000001','Rohit','2024-01-10','ACTIVE'),

(2,1,'Priya Singh','BEN10002','XYZ Bank',
'XYZ000002','Priya','2024-02-15','ACTIVE'),

(3,2,'Aman Gupta','BEN10003','ABC Bank',
'ABC000003','Aman','2024-03-20','ACTIVE'),

(4,3,'Rahul Verma','BEN10004','XYZ Bank',
'XYZ000004','Rahul','2024-04-10','ACTIVE'),

(5,6,'Neha Sharma','BEN10005','ABC Bank',
'ABC000005','Neha','2024-05-05','ACTIVE');



 9. TRANSFERS TABLE


CREATE TABLE transfers (
    transfer_id BIGINT PRIMARY KEY,
    sender_account_id INT,
    receiver_account_id INT,
    amount DECIMAL(15,2),
    transfer_mode VARCHAR(30),
    transfer_date DATETIME,
    reference_number VARCHAR(50) UNIQUE,
    transfer_status VARCHAR(20),
    remarks VARCHAR(255),
    FOREIGN KEY (sender_account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (receiver_account_id) REFERENCES accounts(account_id)
);

INSERT INTO transfers VALUES
(30001,101,103,20000,'NEFT',
'2025-03-10 10:00:00','TRF001','SUCCESS','Family transfer'),

(30002,103,108,15000,'IMPS',
'2025-03-11 12:00:00','TRF002','SUCCESS','Personal transfer'),

(30003,108,110,25000,'UPI',
'2025-03-12 15:00:00','TRF003','SUCCESS','Payment'),

(30004,110,112,30000,'NEFT',
'2025-03-13 11:00:00','TRF004','SUCCESS','Business payment');


SHOW TABLES;



 BASIC DATA CHECKS


SELECT COUNT(*) AS total_branches FROM branches;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT COUNT(*) AS total_accounts FROM accounts;

SELECT COUNT(*) AS total_transactions FROM transactions;

SELECT COUNT(*) AS total_cards FROM cards;

SELECT COUNT(*) AS total_card_transactions FROM card_transactions;

SELECT COUNT(*) AS total_beneficiaries FROM beneficiaries;

SELECT COUNT(*) AS total_transfers FROM transfers;



-- 18 REQUIRED ANALYSIS QUERIES



-- 1. FIND ALL ACTIVE CUSTOMERS

SELECT *
FROM customers
WHERE customer_status = 'ACTIVE';


-- 2. FIND ALL SAVINGS ACCOUNTS

SELECT *
FROM accounts
WHERE account_type = 'SAVINGS';


-- 3. FIND ACCOUNTS WITH BALANCE GREATER THAN 1 LAKH

SELECT *
FROM accounts
WHERE balance > 100000;


-- 4. FIND ALL ATM TRANSACTIONS

SELECT *
FROM transactions
WHERE transaction_mode = 'ATM';


-- 5. FIND CUSTOMERS FROM DELHI

SELECT *
FROM customers
WHERE city = 'Delhi';


-- 6. TOTAL BALANCE BY BRANCH

SELECT b.branch_name,
       SUM(a.balance) AS total_balance
FROM branches b
JOIN accounts a
ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;


-- 7. AVERAGE BALANCE BY ACCOUNT TYPE

SELECT account_type,
       AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;


-- 8. NUMBER OF ACCOUNTS PER CUSTOMER

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(a.account_id) AS total_accounts
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name;


-- 9. TOTAL TRANSACTION AMOUNT PER CUSTOMER

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
GROUP BY c.customer_id, customer_name;


-- 10. TOTAL TRANSACTIONS BY MODE

SELECT transaction_mode,
       COUNT(transaction_id) AS total_transactions,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_mode;


-- 11. CUSTOMER + ACCOUNT DETAILS

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       c.email,
       a.account_number,
       a.account_type,
       a.balance,
       a.status
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;


-- 12. CUSTOMER + ACCOUNT + BRANCH DETAILS

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       a.account_number,
       a.account_type,
       a.balance,
       b.branch_name,
       b.city AS branch_city
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN branches b
ON a.branch_id = b.branch_id;


-- 13. CUSTOMERS HAVING CARDS

SELECT DISTINCT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers c
JOIN cards cd
ON c.customer_id = cd.customer_id;


-- 14. CUSTOMERS WITHOUT CARDS

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers c
LEFT JOIN cards cd
ON c.customer_id = cd.customer_id
WHERE cd.card_id IS NULL;


-- 15. CUSTOMERS HAVING MULTIPLE ACCOUNTS

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(a.account_id) AS total_accounts
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name
HAVING COUNT(a.account_id) > 1;


-- 16. CUSTOMERS WITH ABOVE-AVERAGE BALANCE

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > (
    SELECT AVG(balance)
    FROM accounts
);


-- 17. SECOND-HIGHEST BALANCE

SELECT MAX(balance) AS second_highest_balance
FROM accounts
WHERE balance < (
    SELECT MAX(balance)
    FROM accounts
);


-- 18. CUSTOMERS ABOVE THEIR BRANCH AVERAGE

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       a.branch_id,
       a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > (
    SELECT AVG(a2.balance)
    FROM accounts a2
    WHERE a2.branch_id = a.branch_id
);


