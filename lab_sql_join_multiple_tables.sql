USE sakila;

# 1. Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country
FROM store
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id);

# 2. Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, SUM(amount) AS totol_amount
FROM staff
JOIN payment USING (staff_id)
GROUP BY store_id;

# 3. What is the average running time of films by category?
SELECT name, SUM(length) / COUNT(*) AS avg_length
FROM film f
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY name;

# 4. Which film categories are longest?
SELECT name, SUM(length) / COUNT(*) AS avg_length
FROM film 
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY name
ORDER BY avg_length DESC 
LIMIT 1;

# 5. Display the most frequently rented movies in descending order.
SELECT title, COUNT(rental_id) AS total_rental
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY title
ORDER BY total_rental DESC
LIMIT 10;

# 6. List the top five genres in gross revenue in descending order.
SELECT name, COUNT(amount) AS gross_revenue
FROM payment
JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY name
ORDER BY gross_revenue DESC
LIMIT 5;

# 7. Is "Academy Dinosaur" available for rent from Store 1?
SELECT DISTINCT i.inventory_id, f.title
FROM inventory i
JOIN film f USING (film_id)
JOIN rental r USING (inventory_id)
JOIN staff s USING (staff_id)
WHERE s.store_id = 1 AND r.return_date IS NOT NULL AND f.title = "Academy Dinosaur";


