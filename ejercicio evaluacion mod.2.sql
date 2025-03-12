-- EJERCICIO DE EVALUACION MODULO 2: SQL

USE Sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
    
SELECT DISTINCT title
	FROM film;	

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT *	
	FROM film; --  title, rating

/*SELECT title, rating
	FROM film
    WHERE rating = "PG-13";*/
    
-- solución: solo piden title:

SELECT title
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

/*SELECT title, length
	FROM film
    WHERE length > 120;*/

-- Solucion: solo piden título:

SELECT title
	FROM film
    WHERE length > 120;

-- 5.Recupera los nombres de todos los actores.

-- Asi sólo seria nombre:

SELECT first_name
	FROM actor;
    
-- Así seria nombre completo:

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

/*SELECT title, rating
	FROM film 
    WHERE rating NOT IN ("R", "PG-13");*/

-- Solucion solo con titulo:

SELECT title
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

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.inventory_id) AS total_pelis
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


SELECT *
	FROM film;  -- agrupar por rating,y media de lenght 

SELECT rating, AVG(length) AS duracion_promedio
	FROM film
    GROUP BY rating;


  -- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

    SELECT *
		FROM actor;  -- first_name, last_name, id_actor
	
    SELECT *
		FROM film_actor;  -- actor_id, film_id
        
    SELECT *	
		FROM film;  -- title, film_id
	
    SELECT first_name, last_name
		FROM actor;
	
    SELECT title
		FROM film
        WHERE title =  "Indian Love";
	
    SELECT a.first_name, a.last_name
		FROM actor AS a
        INNER JOIN film_actor AS fa
        USING (actor_id)
        INNER JOIN film AS f
        USING (film_id)
        WHERE f.title = "Indian Love";
	
      

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción
    
SELECT *
	FROM film; -- title, descripcion
    
/* SELECT title, description
	FROM film
    WHERE description LIKE "% DOG %" OR title LIKE "% CAT %"; */ -- Aqui pongo la columna descripcion solo para comprobar

                     -- Solucion sin "description":

SELECT title
	FROM film
    WHERE description LIKE "% DOG %" OR title LIKE "% CAT %";

-- 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.

Select *
	FROM actor;  -- actor_id

SELECT *
	FROM film_actor; -- actorID, filmID.

SELECT a.actor_id
	FROM actor AS a
    LEFT JOIN film_actor AS fa
    USING (actor_id)
    WHERE film_id IS NULL;

-- 16.Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT *
	FROM film;  -- title, release_year
    
SELECT title -- release_year inhabilito esto porque no lo pide en el output.
	FROM film
    WHERE release_year >= 2005 AND release_year <= 2010;

-- tambien se puede hacer con BETWEEN:

SELECT title -- release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT *
	FROM film; -- film-id, title

SELECT *
	FROM film_category;  -- film_id, category_id

SELECT *
	FROM category; -- category_id, name     Family = category_id 8

/*SELECT f.title, c.name AS categoria
	FROM film AS f
    LEFT JOIN film_category AS fc
    ON fc.film_id = f.film_id
    LEFT JOIN category AS c
    ON fc.category_id = c.category_id
    WHERE c.name = "FAMILY";*/

     -- solucion : solo piden que muestre los titulos.
     
SELECT f.title AS  peliculas_familiares
	FROM film AS f
    LEFT JOIN film_category AS fc
    ON fc.film_id = f.film_id
    LEFT JOIN category AS c
    ON fc.category_id = c.category_id
    WHERE c.name = "FAMILY";

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

SELECT *
	FROM actor;  -- actor_id, first_name, last_name.

SELECT *
	FROM film_actor;  -- ACTOR_ID, FILM_ID


/*SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_pelis
	FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) >10; */ -- para filtrar los que han actuado mas de 10 veces. Va siempre despues de group by.
    
    -- Solucion: solo piden nombre
    
    SELECT CONCAT(a.first_name," ", a.last_name) AS Nombre_completo
	FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) >10;
    
-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

SELECT *
	FROM film; -- title, rating (R), length

/*SELECT title, rating, length
	FROM film
    WHERE rating = "R" AND length > 120; */

		-- Solucion: sólo pide el titulo.

SELECT title
	FROM film
    WHERE rating = "R" AND length > 120; 

/*  20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración.*/

SELECT *
	FROM category; -- CATEGORY_ID, NAME

SELECT *
	FROM film_category;  -- FILM_ID, CATEGORY_ID

SELECT *
	FROM film;  -- FILM_ID, LENGHT

SELECT AVG(length)
	FROM film;   -- AVG = 115.272

SELECT c.name, AVG(f.length) AS duracion
	FROM category AS c
    INNER JOIN film_category AS fa
    USING (category_id)
    INNER JOIN film AS f
    USING (film_id)
    GROUP BY c.name
    HAVING AVG(f.length) > 120;

/* 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la 
cantidad de películas en las que han actuado*/


SELECT *
	FROM actor;  -- actor_id, first_name, last_name.

SELECT *
	FROM film_actor;  -- ACTOR_ID, FILM_ID


SELECT a.first_name, COUNT(fa.film_id) AS total_pelis
	FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) >= 5; 

/*  22.Encuentra el título de todas las películas que fueron alquilas por más de 5 dias. Utiliza una 
subconsulta para encontrar los rental_ids con una duracion superior a 5 dias y luego selecciona las peliculas
 correspondientes.*/

SELECT *
	FROM rental; -- rental_id, inventory_id, rental_date, return_date

SELECT *
	FROM inventory; -- inventory_id, film_id
    
SELECT *
	FROM film;  -- film_id, title, rental_duration

/*SELECT film_id, title,  rental_duration
	FROM film
	WHERE rental_duration > 5;

SELECT r.rental_id, f.title
	FROM rental AS r
    INNER JOIN inventory AS i
    USING (inventory_id)
    INNER JOIN film AS f
    USING (film_id)
    WHERE film_id IN (SELECT  film_id  -- filtro solo las pelis que esten en la subconsulta, es decir, firmid de film pero solo las de alquiler sup. a 5.
									FROM film
									WHERE rental_duration > 5);*/
                                    
-- Solucion: modificado con rental_date y return_date,

SELECT rental_id, DATEDIFF(return_date,rental_date) 
	FROM rental;

SELECT r.rental_id, f.title
	FROM rental AS r
    INNER JOIN inventory AS i
    USING (inventory_id)
    INNER JOIN film AS f
    USING (film_id)
    WHERE r.rental_id IN (  SELECT rental_id
							FROM rental
                            WHERE DATEDIFF(return_date,rental_date) > 5);
									

								
/* 23. Encuentra el nombre y apellido de los actores que NOOOOOOOO han actuado en ninguna pelicula de la categoria 
"Horror". Utiliza una subconsulta para encontrar los actores que han actuado en peliculas de la categoria "Horror" y 
 luego excluyelos de la lista de actores.*/

SELECT *
	FROM actor; -- actor_id, first_name, last_name

SELECT *
	FROM film_actor;  -- actor_id, film_id

SELECT *
	FROM film_category;  -- film_id, category_id

SELECT *
	FROM category;  -- category_id, name
    

SELECT first_name, last_name  -- selecciono nombre y apellido de la tabla actor pero que ese actor no este en:
	FROM actor AS a
    WHERE actor_id NOT IN(       
							SELECT actor_id        -- busco actor_ids de los que si aparecen en categoria Horror, junto con inner join hasta llegar a categoria 
								FROM film_actor AS f
                                INNER JOIN film_category AS fc
                                USING (film_id)
                                INNER JOIN category AS c
                                USING (category_id)
                                WHERE name = "Horror");

-- con esta query ya excluyo a los que no aparecen en esa categoria al poner not in.

/* 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.*/

SELECT *
	FROM film;   -- film_id, title, lenght
    
SELECT *
	FROM film_category;  -- film_id, category_id

SELECT *
	FROM category;  -- category_id, name

SELECT title, length
	FROM film
    WHERE length > 180; 


SELECT category_id
	FROM category
	WHERE name = "Comedy";  -- COMEDY ES CATEGORY=5

SELECT film_id
	FROM film_category
    WHERE category_id = 5;

							
-- en la subconsulta asocio solo los film_id que son comedia 

SELECT title,length
	FROM film AS f
    WHERE length > 180 AND film_id IN (SELECT film_id
											FROM film_category AS fc
											INNER JOIN category AS c
											USING (category_id)
											WHERE name = "Comedy");









    





































    



















    
    
    










