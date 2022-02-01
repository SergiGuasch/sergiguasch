# 1. Select all the actors with the first name "Scarlett".

select * from actor where first_name = 'Scarlett';

# 2. How many films (movies) are available for rent and how many films have been rented?

select count(distinct(inventory.inventory_id)) as available_films, 
count(distinct(rental.rental_id)) as films_rented from inventory, rental;

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select max(length) as max_duration, min(length) as min_duration from film;

# 4. What's the average movie duration expressed in format (hours, minutes)?

select CONCAT(FLOOR(avg(length)/60),'h ',FLOOR(avg(length)%60),'m')  as Avg_Duration from film;

# 5. How many distinct (different) actors' last names are there?

select count(distinct last_name) from actor;

# 6. Since how many days has the company been operating (check DATEDIFF() function)?

select DATEDIFF(current_date(), min(rental_date)) as days_operating from rental;

# 7. Show rental info with additional columns month and weekday. Get 20 results.

select *, DATE_FORMAT(CONVERT(rental_date,DATE), '%M') as Month, DATE_FORMAT(CONVERT(rental_date,DATE), ' %W') 
as Weekday from rental limit 20;

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, DATE_FORMAT(CONVERT(rental_date,DATE), ' %W') 
as Weekday, 
CASE
when DATE_FORMAT(CONVERT(rental_date,DATE), '%W') = 'Saturday' then 'Weekend'
when DATE_FORMAT(CONVERT(rental_date,DATE), '%W') = 'Sunday' then 'Weekend'
else 'Workday'
END as day_type
from rental;

# 9. How many rentals were in the last month of activity?
select max(rental_date) from rental;
select COUNT(rental_id) as rentals_last_month from rental where rental_date > '2006-02-14 15:16:03' - interval 1 MONTH;
