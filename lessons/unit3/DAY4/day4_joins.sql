#start with a simple join 2 tables

select * from district;

select * from district d
JOIN client c ON
d.A1 = c.district_id;

# How many clients per district

select count(c.client_id) as noofclients, d.A2 as districtname 
from district d
JOIN client c 
ON
d.A1 = c.district_id
group by A2
order by noofclients desc;

# How many clients per district compared to population

select 
	count(client_id) as noofclients, d.A2 as districtname,
	d.A4 as population, round(count(c.client_id)/d.A4)*100 as proportion 
FROM district d # the left table is in from for the left join. Inner Join its always to find the matches between 2 tables. Outer join exclude the matches of left and right.
JOIN client c 
ON
d.A1 = c.district_id
group by A2, A4
order by proportion desc;

# loans and accounts

select account_id, loan_id, duration, amount, frequency from loan
JOIN account
USING(account_id); # shorthand field when fk field name matches.. means the same thing and have the same name

# how many loans per district and total amount of loans per district

SELECT d.A2 as districtname, 
count(a.account_id) as number_accounts, 
count(l.loan_id) as number_loans, 
SUM(l.amount) as total_amount
FROM loan l
JOIN account a
USING(account_id)
JOIN district d
ON
d.A1 = a.district_id
GROUP by d.A2; 

select * from loan
right join account # prioritises account table
using(account_id)
where loan_id is null;


-- 3.04 Activity 3
-- Keep using the bank database.

-- Get a list of districts ordered by the number of customers (descending order). 
-- Name the columns as: District_name and Number_of_customers respectively.

select * from client;

SELECT d.A2 as District_name, count(c.client_id) as Number_of_customers
FROM district d
JOIN client c
ON
d.A1 = c.district_id
GROUP by d.A2
ORDER by Number_of_customers DESC; 

-- Get a list of regions ordered by the number of customers (descending order). 
-- Name the columns as: Region_name and Number_of_customers respectively.

SELECT d.A3 as Region_name, count(c.client_id) as Number_of_customers
FROM district d
JOIN client c
ON
d.A1 = c.district_id
GROUP by d.A3
ORDER by Number_of_customers DESC; 

-- Get the number of accounts opened by district and year. Name the columns as: 
-- District_name, Year and Accounts_opened. Order the results by District_name and Year.

select d.A2 as District_name, 
count(a.account_id) as Accounts_opened, 
concat('19', left(a.date,2)) as Year 
from account a
join district d
on a.district_id = d.A1
group by d.A2, Year
order by d.A2, Year;


# working with a bridge table - applying filter on Owner
# number of people who owns loans, per loan account
# we are gonna go from CLient to Disposition to Account to Loan

select count(c.client_id), l.status from client c
join disp d
USING(client_id)
#join account a
#USING(account_id)
join loan l
USING(account_id)
where d.type='OWNER'
group by l.status;


#subqueries

# compare the loan amount against the average loan amount
# inner query:
select * from loan where amount > 
(select avg(amount) from loan);


# which loan status has a mean loan amount bigger than the overall mean loan amount?

select status, avg(amount) as avg_loans
from loan
group by status
having avg_loans >
(select avg(amount) from loan);

-- 3.05 Activity 1
-- Keep working on the bank database.

-- Find out the average of the number of transactions by account.

-- Hint: Compute first the number of transactions by account.

# whats the avg of (number of trans per account):
# 1st I need to find out how many trans per account - group by - account level
# 2nd find the average of those

#example of nested - 3 + levels
select account_id, frequency from account 
join (select account_id, count(trans_id) as nooftrans from trans
group by account_id) as sub2
using(account_id)
where sub2.nooftrans >
(select round(avg(sub.nooftrans)) as avgof from
(select account_id, count(trans_id) as nooftrans from trans
group by account_id) as sub);

# all accounts with status that has higher than average amount
# the loans with statuses higher than average average amount
# 1 get avg loan amount by status
# 2 filter to statuses with higher avg
select status, avg(amount) as avg_loans
from loan
group by status
having avg_loans >
(select avg(amount) from loan);

# 3 get the status from that result

# 4 get loans in those status
select * from loan
where status in
(select status from
(select status, avg(amount) as avgloans
from loan
group by status
having avgloans >
(select avg(amount) from loan))
as s);


select account_id from account
join loan using (account_id)
where status in (
select status, avg(amount) as avg_loans
from loan
group by status
having avg_loans >
(select avg(amount) from loan));

select account_id from account
join loan using (account_id)
where status in (
'C','D');

