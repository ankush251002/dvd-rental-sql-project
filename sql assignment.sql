USE sakila;
SHOW TABLES; # Show Tables 
SELECT * FROM actor; # Display all actors 
SELECT title FROM film; # Display film titles 
SELECT COUNT(*) FROM customer; # Total number of customers 
SELECT SUM(amount) FROM payment; # Total revenue

SELECT title, length # Movies longer than 120 minutes
FROM film
WHERE length > 120;

SELECT rating, COUNT(*) # Number of films by rating
FROM film
GROUP BY rating;

SELECT f.title, COUNT(r.rental_id) AS total_rentals # Most rented movies
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent # Top paying customers
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT f.rating, SUM(p.amount) AS revenue # Revenue by film rating
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.rating;

SELECT c.name AS category, COUNT(fc.film_id) AS total_films # Number of films per category
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY total_films DESC;

SELECT customer_id, AVG(amount) AS average_payment # Average payment per customer
FROM payment
GROUP BY customer_id;