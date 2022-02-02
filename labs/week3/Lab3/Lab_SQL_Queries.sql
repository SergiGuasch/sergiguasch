# 1. Using the rental table, find out how many rentals were processed by each employee.

select staff_id, count(rental_id) as rentals_employee
from rental
group by staff_id;

# 2. Using the film table, find out how many films were released.

select *, count(release_year)  as number_film_released
from film
group by release_year;

# 3. Using the film table, find out how many films there are of each rating. Sort the results in descending order of the number of films.

select *, count(rating) as number_films 
from film
group by rating
order by number_films desc;

# 4. Which kind of movies (rating) have a mean duration of more than two hours?

select *, avg(length) as avg_films 
from film
group by rating
having avg(length) > 120;


-- 3.04 - Activity 1
-- https://github.com/SergiGuasch/sergiguasch/blob/main/lessons/unit3/DAY3/EDR_Sakila.mwb

-- 3.04 - Activity 2
-- From the following columns, determine if they can be Primary key PK or not.

-- Product_id - Yes, just in case it is a unique id and not a foreign key.
-- Phone number - Yes
-- First name - No