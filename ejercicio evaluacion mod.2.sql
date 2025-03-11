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
    










