USE sakila;

/*1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.*/

SELECT customer.first_name, customer.last_name, customer.email, address.address FROM customer
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
WHERE city.city_id = 312;

/*2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe 
devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales y el género (categoría).*/

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name FROM film
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = "Comedy";

/*3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
Su consulta debe devolver la identificación del actor, el nombre del actor, el título 
de la película, la descripción y el año de lanzamiento.*/

SELECT actor.actor_id, CONCAT(actor.first_name," ", actor.last_name) as actor_name, film.title, film.description, film.release_year 
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE actor.actor_id = 5;

/*4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de 
estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre, apellido, correo 
electrónico y dirección del cliente.*/

SELECT customer.store_id, CONCAT(customer.first_name," ", customer.last_name) as customer_name , customer.email, address.address FROM customer
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
WHERE city.city_id = 1 
OR city.city_id = 42
OR city.city_id = 312
OR city.city_id = 459
AND customer.store_id = 1
ORDER BY store_id

/*5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" 
y "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe 
devolver el título de la película, la descripción, el año de lanzamiento, la calificación y 
la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.*/

