# Create Python function named rentals_may to connect to the Sakila database and return 
# dataframe storing the data from rental table with information for May 2005.

select * from rental where year(rental_date)=2005 and month(rental_date)=05;

# Create a Python function to get the number of rentals for each customer in May given the 
# dataframe provided by the function rentals_may. Hint: Consider making use of pandas groupby() and pandas agg()

select concat(first_name, ' ', last_name) as full_name, count(rental_id) as number_rentals from rental
join customer
using(customer_id)
where year(rental_date)=2005 and month(rental_date)=05
group by customer_id;

# Create a Python function to get the number of rentals for each 
# customer in June given the dataframe provided by the function rentals_june.

select concat(first_name, ' ', last_name) as full_name, count(rental_id) as number_rentals from rental
join customer
using(customer_id)
where year(rental_date)=2005 and month(rental_date)=06
group by customer_id;
