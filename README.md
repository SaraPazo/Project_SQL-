# Project_SQL-







# BONUS QUERIES


### 1 ¿Qué actores han participado en la película con el film_id = 34?

SELECT actor.Actor_id, actor.Name_complete, film.film_id
FROM old_HDD
LEFT JOIN actor ON old_HDD.Actor_id = actor.Actor_id
LEFT JOIN film ON old_HDD.film_id = film.film_id
WHERE film.film_id = 34;

![Query1](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query1.png)




### 2 ¿Qué actores han hecho / participado en más películas? 

SELECT actor.Actor_id, actor.Name_complete, COUNT(*) AS num_peliculas
FROM old_HDD
LEFT JOIN actor ON old_HDD.Actor_id = actor.Actor_id
GROUP BY actor.Actor_id, actor.Name_complete
ORDER BY num_peliculas DESC;

![Query2](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query2.png)
 
 
 
### 3  ¿Cuál es la película más corta?
 
SELECT film.title, film.length
FROM film
WHERE film.length = (SELECT MIN(film.length) FROM film);

![Query3](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query3.png)




### 4 Título de las películas disponibles en el inventario de la tienda 2.

SELECT film.title
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
WHERE inventory.store_id = 2;

![Query4_SQL](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query4_SQL.csv)




### 5 Dime el título de la película, de categoría 'Documental' en la que aparece PENELOPE GUINESS.


SELECT actor.Name_complete, film.title, category.Category
FROM old_HDD 
INNER JOIN actor ON old_HDD.Actor_id = actor.Actor_id
INNER JOIN film ON old_HDD.film_id = film.film_id
INNER JOIN category ON old_HDD.category_id = category.category_id
WHERE actor.Name_complete = 'PENELOPE GUINESS' and category.Category = 'Documentary'

![Query5](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query5.png)

