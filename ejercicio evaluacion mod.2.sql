-- EJERCICIO DE EVALUACION MODULO 2: SQL

USE Sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
    
SELECT DISTINCT title
	FROM film;	

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT *	
	FROM film; --  title, rating

SELECT title, rating
	FROM film
    WHERE rating = "PG-13";

-- 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripcion.

SELECT *	
	FROM film; -- title, description (palabra "amazing")

SELECT title, description
	FROM film
    WHERE description LIKE "%amazing%";

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT *	
	FROM film;  -- title, lenght

SELECT title, length
	FROM film
    WHERE length > 120;

-- 5.Recupera los nombres de todos los actores.

SELECT first_name
	FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo
	FROM actor;


-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name, last_name
	FROM actor
    WHERE last_name LIKE "%Gibson%";

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT first_name
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20;
    
    
/* 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su 
clasificación.*/

SELECT *
	FROM film; -- title, rating

SELECT title, rating
	FROM film 
    WHERE rating NOT IN ("R", "PG-13");
    

/*  9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y 
muestra la clasificación junto con el recuento.*/

SELECT *
	FROM film;  -- rating

SELECT rating, COUNT(film_id) AS pelis_por_categoria
	FROM film
    GROUP BY rating;

/* 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
su nombre y apellido junto con la cantidad de películas alquila*/

SELECT *
	FROM customer;  -- customerID, firsname, lasname
    
SELECT *
	FROM rental;  -- customerID, inventory_id



SELECT c.first_name, c.last_name, COUNT(r.inventory_id) AS total_pelis
	FROM customer AS c
    INNER JOIN rental AS r
		ON c.customer_id = r.customer_id
	GROUP BY c.customer_id;


/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres.*/

SELECT *
	FROM rental; -- rental_id, inventory_id

SELECT *
	FROM inventory;  -- inventory_id, film_id

/*SELECT *
	FROM film; -- film_id, title*/

SELECT *
	FROM film_category;  -- film_id, category_id

SELECT *
	FROM category; -- category_id, name


SELECT c.name AS categoria, COUNT(r.rental_id) AS total_alquileres
	FROM rental AS r
    INNER JOIN inventory AS i    -- > con este inner conecto rental con film_category a traves de inventory_id, y asi voy conectando tablas.
    ON i.inventory_id = r.inventory_id
    INNER JOIN film_category AS f    
    ON f.film_id = i.film_id
    INNER JOIN category AS c
    ON c.category_id = f.category_id
	GROUP BY c.category_id;  


/* 12.Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra 
la clasificación junto con el promedio de duración.*/




    
      


    






















