#Data Manipulation Language -- Insert or Update
#Data Defination Language -- Create or Alter
#Data Query Language -- Select


DROP DATABASE IF EXISTS books;
CREATE DATABASE books;
USE books;
DROP TABLE IF EXISTS authors;
CREATE TABLE authors
(author_id INT AUTO_INCREMENT NOT NULL, # the field is not allowed to be null
name VARCHAR(30),
country VARCHAR(20), 
PRIMARY KEY (author_id)
);
DROP TABLE IF EXISTS books;
CREATE TABLE books
(book_id INT AUTO_INCREMENT NOT NULL, # the field is not allowed to be null
author_id INT,
book_name VARCHAR(50),
category VARCHAR(20),
PRIMARY KEY (book_id)
);

INSERT INTO authors(name, country)
VALUES('Miguel de Cervantes', 'Spain'), ('Charles Dickens', 'Uk'), ('JRR Tolkien', 'South Africa'), 
('Antoine de Saint-Exupéry', 'France'), ('JRR Tolkien', 'South Africa');

select*from authors;

# continuing to quey a single table

select * from bank.trans
order by amount desc;

select * from bank.trans
order by type asc;

select * from bank.trans
order by amount asc, date desc; #first field it's priority

# LIKE % REGEX
select * from bank.district;

select * from bank.district
where A3 LIKE 'west%';

select * from bank.district
where A3 LIKE '%Bohe%';

select * from district 
order by A4 DESC
LIMIT 3;

#Get transactions in the first 15 days of 1993.

select * from trans
where trans.date LIKE '93%'
order by trans.date ASC
LIMIT 15;

#Find the different values from the field A2 that start with the letter 'M'.

select * from trans
where A4 LIKE 'M%';

#Find the different values from the field A2 that end with the letter 'M'.

select * from district
where A2 LIKE '%M';



# always you have to put the column or columns (in any order) inside the group by 
# that they are not as an aggregation in the Select (count, avg etc..)

select status_description, 
count(loan_id) as number_of_loans, 
count(account_id) as number_of_accounts
from bank.loan_statuses
group by status_description;

select bank_to, account_id,
ceiling(avg(amount)) as avg_amount,
count(*) as number_orders,
ceiling(sum(amount)) as total_amount,
max(amount) as biggest
from bank.order
group by bank_to, account_id
order by biggest DESC
;

# OPTIONAL TO EXECUTE
# SET sql_mode = 'ONLY_FULL_GROUP_BY';
# SELECT @@GLOBAL.sql_mode;


# Get the total rental revenue using the column amount from table payment. Display it as Total_revenue.

select *, 
sum(amount) as total_rental_revenue
from payment;

# Get the total rental revenue by client_id sorted by total benefit in descending order.

select customer_id, 
sum(amount) as total_benefit
from payment
group by customer_id
order by total_benefit DESC;


# usually you can't use where if there is a group by 
select customer_id, 
sum(amount)
from payment
where sum(amount) > 100
group by customer_id
order by sum(amount) DESC;

# you must use having
select customer_id, 
sum(amount)
from payment
group by customer_id
having sum(amount) > 100
order by sum(amount) DESC;

# possible to use where without the aggregation, but you need having anyway
select customer_id, 
sum(amount)
from payment
where customer_id <> '144'
group by customer_id
having sum(amount) > 100
order by sum(amount) DESC
limit 100;


# window function in sql (in tableau is called table calculation)

-- OVER() -- to open a window
-- PARTITION BY -- this is a group by inside a window

select customer_id, 
sum(amount) as revenue,
rank() OVER(order by sum(amount) DESC) ranked_sales
from payment
where customer_id <> '144'
group by customer_id
having revenue > 100
#order by revenue DESC
limit 100;

select customer_id, 
sum(amount) as revenue,
dense_rank() OVER(order by sum(amount) DESC) ranked_sales
from payment
where customer_id <> '144'
group by customer_id
having revenue > 100
#order by revenue DESC
limit 100;


select loan_id, duration, amount, status,
avg(amount) over (partition by status) avg_amount
from loan;

#how different from the avg this particular loan is
select loan_id, duration, amount, status,
avg(amount) over (partition by duration) avg_amount
from loan;


select loan_id, duration, amount, status,
avg(amount) over (partition by duration order by status) avg_amount,
amount-(avg(amount) over (partition by duration)) as diff
from loan;

select loan_id, duration, amount, status,
avg(amount) over (partition by duration, status order by status) avg_amount,
amount-(avg(amount) over (partition by duration)) as diff
from loan
order by diff DESC;

select loan_id, duration, amount, status,
avg(amount) over (partition by duration, status order by status) avg_amount,
amount-(avg(amount) over (partition by duration, status)) as diff,
row_number() over(partition by status, duration order by status DESC) as row_num
from loan
order by diff DESC;

select * from bank.trans
where account_id < 10;

select account_id,
convert(t.date, date) as date_of_trans,
amount,
round(sum(amount) over(partition by account_id order by t.date),0) as cumbalance
from bank.trans as t
where account_id < 10;


#Get the mean movie-length by rating in descending order of Mean_length.

select  rating,
round(avg(length), 2) as Mean_length
from film
group by rating
order by Mean_length DESC;

#Get the rating, title, length, Mean_rating_length and the film ranking partitioned by rating ordered in descending order of length.

select rating, title, length,
avg(length) over(partition by rating) Mean_rating_length,
dense_rank() over(partition by rating order by length desc) film_ranking
from film
order by rating, length DESC;


# REGEX for fuzzy matching REGEXP_LIKE | REGEX

select distinct title from film
where REGEXP_LIKE(title, '^P'); #at begining

select distinct title from film
where REGEXP_LIKE(title, 'ers$'); #at end

select distinct title from film
where REGEXP_LIKE(title, 'phobia'); #somewhere in the middle

select distinct title from film
where title REGEXP 'er$'; #at end -- other way without LIKE

select distinct title from film
where title REGEXP 'hea|per'; # | or 

select distinct title from film
where title REGEXP '[x-z]'; #returns any letter between x and z


