
**EVALUACION: MODULO 2**

## **📊 Análisis y Consultas SQL en la Base de Datos Sakila 🎬:**

# Descripción del Proyecto

Este ejercicio se centra en la exploración y análisis de datos de la base de datos Sakila, se trata de una tienda de alquiler de películas. A través de consultas SQL avanzadas, he extraído información relevante sobre clientes, películas, actores y categorías, aplicando diferentes técnicas de consulta, como filtros, agrupaciones, subconsultas y uniones de tablas.


# Objetivo

El objetivo principal ha sido practicar y consolidar el uso de SQL aprendido en este modulo. A lo largo del ejercicio, he abordado preguntas relacionadas con la gestión de películas, actores, clientes y transacciones de alquiler.


# Estructura de la Base de Datos

La base de datos Sakila contiene numerosas tablas conectadas entre si. A continuación, añado en un pequeño esquema con las relaciones mas relevantes.

- Tablas Principales:

    - film 🎬: Contiene información sobre las películas (título, duración, clasificación, etc.).

    - actor 🎭: Lista de actores que participan en las películas.

    - category 🍿: Diferentes géneros de películas.

    - customer 👥: Información sobre los clientes que alquilan películas.

    - rental 🗓️:: Registra los alquileres de películas.

    - inventory 📦: Detalla qué películas están disponibles en cada tienda.

    - film_actor 🎞️: Relaciona actores con las películas en las que han participado.

    - film_category 🍿️🎥: Relaciona películas con sus categorías.

## Consultas Realizadas

Durante el ejercicio, he desarrollado una serie de consultas SQL para responder preguntas específicas sobre la base de datos:

- Exploración de Películas
- Análisis de Actores
- Análisis de Clientes y Alquileres
- Uniones y Subconsultas 

## Ejemplo de Consulta SQL

Incluyo un ejemplo de una consulta que he realizado para obtener las películas alquiladas por más de 5 días:

```sql
SELECT f.title
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IN (
    SELECT rental_id
    FROM rental
    WHERE DATEDIFF(return_date, rental_date) > 5);
```

**Explicación**: En esta consulta obtengo todas las películas que han sido alquiladas por más de 5 días, utilizando una subconsulta para filtrar los registros de alquiler que cumplen con la condición.

## Conclusión
Este ejercicio me ha permitido realizar un análisis detallado de la base de datos **Sakila** aplicando el temario estudiado a lo largo de este módulo.
He trabajado con **filtros**, **uniones de tablas** y **subconsultas** consolidando así mi conocimiento en bases de datos.
