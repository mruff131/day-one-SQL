-- 1. How many actors are there with the last name ‘Wahlberg’? 
-- TWO --
select LAST_NAME, first_name 
from ACTOR 
where LAST_NAME like 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99? 
-- ZERO --
select customer_id, AMOUNT
from payment
where AMOUNT > 3.98 and AMOUNT < 5.99;


-- 3. What film does the store have the most of? (search in inventory) 
--The highest # of movies a film in this store is 8. There are several movies tied for 8 such as Crossroads Casualties, Shock Cabin, Ridgemont Submarine, etc

select film_id,count(*) as count
from INVENTORY
group by film_id
order by count desc;

-- 4. How many customers have the last name ‘William’?  
-- ZERO, the closest is Linda williams but theres no william
select last_NAME, COUNT(*) as COUNT
from CUSTOMER
where LAST_NAME like 'William'
group by CUSTOMER.LAST_NAME;
 
-- 5. What store employee (get the id) sold the most rentals? 
--ID # 1
select STAFF_ID, SUM(RENTAL_ID)
from rental
group by staff_id 
order by staff_id;

-- 6. How many different district names are there? 
-- 378
select COUNT(distinct DISTRICT) AS num_districts
from address ;

-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
--FILM_ID 188
select film_id, sum(actor_id)
from film_actor fa 
group by film_id
order by sum desc;



--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
-- 13 LAST_NAMES

select COUNT(*) 
from customer 
where store_id = 1 
and last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250)
-- 3 PAYMENT AMOUNTS

 
select amount, COUNT(*) AS rental_count
from PAYMENT 
where customer_id BETWEEN 380 AND 430
group by amount
having COUNT(*) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most  movies total?
-- THERE ARE 5 DIFFERENT RATINGS, AND PG-13 HAS THE MOST MOVIES TOTAL 
 select RATING, COUNT(RATING)
 from film
 group by RATING 
 
 
 
 