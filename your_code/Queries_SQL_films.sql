-- 1 ¿Qué actores han participado en la películas con el film_id = 6?

SELECT actor.Actor_id, actor.Name_complete, film.film_id
FROM old_HDD
LEFT JOIN actor ON old_HDD.Actor_id = actor.Actor_id
LEFT JOIN film ON old_HDD.film_id = film.film_id
WHERE film.film_id = 34;

-- 2 ¿Qué actores han hecho / participado en más películas?
SELECT actor.Actor_id, actor.Name_complete, COUNT(*) AS num_peliculas
FROM old_HDD
LEFT JOIN actor ON old_HDD.Actor_id = actor.Actor_id
GROUP BY actor.Actor_id, actor.Name_complete
ORDER BY num_peliculas DESC;


-- 3 ¿Cuál es la película más corta?
SELECT film.title, film.length
FROM film
WHERE film.length = (SELECT MIN(film.length) FROM film);


-- 4 Titulo de las peliculas disponibles en el inventario de la tienda 2
select film.title, inventory.inventory_id, inventory.store_id
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
WHERE inventory.store_id = 2;


-- 5 Dime el título de la película, de categoría 'Documental' en la que aparece PENELOPE GUINESS.
SELECT actor.Name_complete, film.title, category.Category
FROM old_HDD 
INNER JOIN actor ON old_HDD.Actor_id = actor.Actor_id
INNER JOIN film ON old_HDD.film_id = film.film_id
INNER JOIN category ON old_HDD.category_id = category.category_id
WHERE actor.Name_complete = 'PENELOPE GUINESS' and category.Category = 'Documentary'