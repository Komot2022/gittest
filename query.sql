SELECT rental_rate,
   	rental_duration,
   	rating
FROM film
 	CROSS JOIN film_category
	
with rental_duration_cte as (select rental_duration from film)

select distinct f.rental_rate, r.rental_duration
from film f
cross join rental_duration_cte r
order by f.rental_rate, r.rental_duration


(with rental_duration_cte as (select rental_duration from film)

select distinct f.rental_rate, r.rental_duratio
from film f
cross join rental_duration_cte r
order by f.rental_rate, r.rental_duration
	


SELECT customer_id, first_name, last_name,
 (SELECT COUNT(*) FROM rental 
  WHERE rental.customer_id = customer.customer_id) AS rental_count
FROM customer;



SELECT avg(rental_count)
FROM (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
) AS avg_rental_counts;

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
);

SELECT ct.city, EXTRACT(MONTH FROM p.payment_date) AS month, SUM(p.amount) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city, EXTRACT(MONTH FROM p.payment_date)
HAVING SUM(p.amount) > 31
ORDER BY total_payment DESC;

SELECT ct.city, EXTRACT(MONTH FROM p.payment_date) AS month, SUM(p.amount) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city, EXTRACT(MONTH FROM p.payment_date)
--HAVING SUM(p.amount) > 31
ORDER BY city desc, month asc;

select * from payment order by payment_date desc

SELECT ct.city, p.payment_date, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
ORDER BY city desc, payment_date asc;

SELECT
  title,
  rental_duration,
  AVG(rental_duration) OVER () AS overall_average
FROM film;

SELECT amount, customer_id, 
avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, 
EXTRACT(month FROM payment_date) as month
FROM payment
ORDER BY month desc;

SELECT amount, customer_id, 
avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date), customer_id) as month_average, 
EXTRACT(month FROM payment_date) as month
FROM payment
ORDER BY month desc;


WITH revenue_vs_month AS (

SELECT DISTINCT avg(amount) 
	OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, 
	EXTRACT(month FROM payment_date) as month
FROM payment	
)

SELECT corr(month_average, month)
FROM revenue_vs_month;

 
WITH revenue_vs_month AS (

SELECT DISTINCT avg(amount) 
	OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, 
	EXTRACT(month FROM payment_date) as month
FROM payment	
)

SELECT avg(amount), extract(month from payment_date)
FROM payment
group by extract(month from payment_date);

 
 WITH film_rentals AS (
  SELECT inventory.film_id, COUNT(*) AS rental_count
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  GROUP BY inventory.film_id
)
SELECT f.title, fr.rental_count
FROM film f
JOIN film_rentals fr ON f.film_id = fr.film_id
WHERE fr.rental_count > 1;

WITH film_rentals AS (
  SELECT inventory.film_id, COUNT(film_id) AS rental_count
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  GROUP BY inventory.film_id
)
SELECT f.title, fr.rental_count
FROM film f
FULL JOIN film_rentals fr ON f.film_id = fr.film_id
order by rental_count desc;
 

WITH film_rentals AS (
  SELECT film.film_id, COUNT(inventory.film_id) AS rental_count
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  full join film on film.film_id = inventory.film_id
  GROUP BY film.film_id
)
SELECT f.title, fr.rental_count
FROM film f
FULL JOIN film_rentals fr ON f.film_id = fr.film_id
order by rental_count asc;
 
 select f.film_id, f.title, i.inventory_id, r.rental_id
 from film f
 full join inventory i on i.film_id = f.film_id
 full join rental r on r.inventory_id = i.inventory_id
 group by f.film_id
 order by count(r.rental_id)
 

 


