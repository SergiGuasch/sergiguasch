SELECT 
	* 
FROM 
	bank.trans; #interesting to write in different lines just to check where is the error
    
use sakila; # this is a comment, use is to set as default a table
USE bank;

SELECT date, type, account_id from trans WHERE type = 'PRIJEM'; #strings are case sensitive

SELECT 
COUNT(*)
from 
	trans 
WHERE 
	type = 'PRIJEM';

SELECT 
COUNT(*)
from 
	trans;
    
SELECT 
*
from 
	trans
    LIMIT 10;  #like head() in python

SELECT 
DISTINCT type
FROM 
	trans
    LIMIT 10;

SELECT 
COUNT(DISTINCT type)
FROM 
	trans
    LIMIT 10;

SELECT 'Hello World';

SELECT SUM(2+3);

SELECT 
	DISTINCT type
FROM 
	card;
    
SELECT A2, A3 from district LIMIT 30;
    
# ALIASING is used for fields and for tables
SELECT A2 as districtname, A3 as region_name from district as d LIMIT 30;  

select frequency/10 as dedidedfreq from account;  

select * from trans;

SELECT 
	t.trans_id as Transaction_id, 
	t.account_id as Account_id, 
	t.date as Dateoftrans, 
	t.type as Trans_Type 
FROM 
	trans as t; # use alias in tables just to know which field are we talking about
    
#Get all the types of the card as type_of_card and the issue date as issue_date 
#from card client and alias the table as bc.

SELECT DISTINCT 
    type as type_of_card, 
	date as issue_date
FROM 
	card as bc;

#create fields - using queries - SELECT operator FROM
select *, amount-payments as balance  
from loan;
select *,amount-payments as balance, round((amount-payments)/1000,2) as balance_k
from loan;

select *,amount-payments as balance, round((amount-payments)/1000,2) as balance_k
from loan
where status = 'B';

select *,amount-payments as balance, round((amount-payments)/1000,2) as balance_k
from loan
where status != 'B'; # != means exclude 'B'

select *,amount-payments as balance, round((amount-payments)/1000,2) as balance_k
from loan
where status NOT iN ('B','D');

# = != <> IN(), NOT IN() > <
# * / - +

select *,amount-payments as balance, round((amount-payments)/1000,2) as balance_k
from loan
where status NOT iN ('B','D') AND payments > 8000;

# Select districts and salaries (from the district table) where salary is 
# greater than 10000. Return columns as district_name and average_salary.

select * from district;

select A3 as district_name, A15 as average_salary
from district
where A15 > 10000;

# Select those loans whose contracts finished and were not paid. 
# Hint: You should be looking at the loan column and you will need 
# the extended case study information to tell you which value of status is required.

select * from loan;

select loan_id from loan
where status = 'B';

# Select cards of type junior. Return just the first 10 in your query.

select * from card;

SELECT *
FROM 
	card
WHERE
	type='junior'
    LIMIT 10;
    
# Select those loans whose contract is finished and not paid back. 
# Return the debt value from the status you identified in the last 
# activity, together with loan id and account id.

select loan_id, amount from loan
where status = 'B';

# Calculate the urban population for all districts. Hint: You are 
# looking for the number of inhabitants and the % of urban inhabitants 
# in each district. Return columns as district_name and urban_population.

select * from district;

select A2 as district_name, A4 as total_population, round(A4*(A10/100),0) as urban_population 
from district;

# On the previous query result - rerun it but filter out districts where 
#the rural population is greater than 50%.

select A2 as district_name, A4 as total_population, round(A4*(A10/100),0) as urban_population 
from district
where A10 > 50 ;

# big or bad loans OR NOT NOT IN() IN()

select * from loan where
amount > 25000 OR status IN('B', 'D');

# not and not - order table, return all records not SIPO AMOUNT not UNDER 10000
# max min     floor ceiling round      log sqrt power
#ceiling round up
#floor round down

select max(amount), min(amount), ceiling(avg(amount)), floor(avg(amount)) 
from bank.order; #use bank. because order is also a function, not just a table

# string functions concat strip left right upper lower rtrim ltrim lenght replace like

select length('sergi');

# order id + acc id concat

select *, concat(order_id, ' - ', account_id) as reference
	from bank.order;

select * from district;

select max(length(A2)) from district; # 19

select * from district where length(A2)= 19;

select left(A2,4) as left_characters, right(A2,4) as right_carachters
	from district where length(A2)= 19;

# Get all junior cards issued later than the last year. Hint: Use the numeric value (980000).

SELECT *
FROM 
	card
WHERE
	type='junior' and date(980000);
    
#Get the first 10 transactions for withdrawals that are in cash. 
#You will need the extended case study information to tell you which 
#values are required here, and you will need to refer to conditions on two columns.

SELECT * FROM trans;

SELECT *
FROM trans
where type = "VYDAJ" and operation = 'VYBER'
limit 10;

#Refine your query from the last activity on loans whose contract finished and not paid back 
#- filtered to loans where they were left with a debt bigger than 1000. Return the debt value 
#together with loan id and account id.

select loan_id, account_id, amount, payments, amount-payments as debt from loan
where status = 'B' and  amount-payments>1000;

#Get the biggest and the smallest transaction with non-zero values in the database (use the 
#trans table in the bank database).

SELECT max(amount), min(amount)
FROM trans
where amount != 0;

#Get account information with an extra column year showing the opening year as 'YYYY'. 
#Eg., 970707 will show as 1997. Hint: Look at the first two characters of the string 
#date in the account table. The output should display 
#the fields: account_id, district_id, frequency, and 'Year' (YYYY format).

select*, concat('19', left(date,2)) as yearopened from account;


select *, 
case when left(date,2) < 30 then concat('20', left(date,2))
else
concat('19', left(date,2))
end as yearopened
from account;


#CONVERT convert a type as a data type ... DATE_FORMAT()

select * from account;
#date is an int YYMMDD

select *, CONVERT(a.date,DATE) as FormatDate from account as a;

select *, DATE_FORMAT(CONVERT(a.date,DATE), '%D %M %Y') as FormatDate from account as a;

select *, DATE_FORMAT(CONVERT(a.date,DATE), '%d/%m/%Y') as FormatDate from account as a;


#SUBSTRING_INDEX()

select * from bank.card; #checking table inspector column we can see its a text type
#date is a string with empty time - card table

select CONVERT(SUBSTRING_INDEX(issued,' ',1), DATE) as issueDate from card;

# case statement to replace ABCD with business label

SELECT loan_id, account_id, 
CASE
when status = 'A' then 'good-finished'
when status = 'B' then 'bad-unpaid'
when status = 'C 'then 'good-running'
else 'default - running'
END as status_description
FROM loan
WHERE amount is not null ;

CREATE View loan_statuses as
SELECT loan_id, account_id, 
CASE
when status = 'A' then 'good-finished'
when status = 'B' then 'bad-unpaid'
when status = 'C 'then 'good-running'
else 'default - running'
END as status_description
FROM loan
WHERE amount is not null ;

select* from loan_statuses;

# MOD() function is used as a remainder