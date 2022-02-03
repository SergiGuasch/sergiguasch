-- 1. Write a query to display for each store its store ID, city and country.

select * from store;
select * from address;
select * from city;
select * from country;

select store_id, city, country
from store
join address a
USING(address_id)
join city
USING(city_id)
join country
USING(country_id);

-- 2. Write a query to display how much benefit amount, in dollars, each store brought in.

select * from store;
select * from customer;
select * from payment;

select s.store_id, sum(p.amount) as benefit
from store s
join customer c
using(store_id)
join payment p
using(customer_id)
group by s.store_id;

-- 3. What is the average running time of films by category?

select * from film;
select * from film_category;
select * from category;

select c.name, avg(length) as avg_running 
from film f
join film_category fc
using(film_id)
join category c
using(category_id)
group by c.category_id;


-- 4. Which film categories are longest on average?

select c.name, avg(length) as avg_running 
from film f
join film_category fc
using(film_id)
join category c
using(category_id)
group by c.category_id
order by avg_running desc;

-- 5. Display the most frequently rented movies in descending order.

select f.title, count(rental_id) as freq_rental
from rental
join inventory i
using(inventory_id)
join film f
using(film_id)
group by f.title
order by freq_rental desc;