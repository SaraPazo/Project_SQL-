# Project_SQL-

### INDICE
1. Descripción
2. Contenido
3. Organización de los datos
4. Limpieza de datos
5. Creación de las bases de datos
6. BONUS QUERIES


### 1. DESCRIPCIÓN
Tenemos los datos de un videoclub cuyo dueño, observando que lo vintage vuelve a estar de moda, recientemente ha decidido reabrir sus puertas. 

Le gistaría tener actualizadas sus películas, el inventario, y tener claro y bien registrados todos aquellos datos que cualquier cliente quisquilloso pueda llegar a pedir: desde la categoría hasta los actores principales de cada una de las películas... 

Como conocedores de las nuevas herramientas en organización de datos nos ha llamado para pedirnos ayuda con esto. 


### 2. CONTENIDO
- Imagen: carpeta con las imágenes utilizadas en el archivo Léame.
- data: todo el .csv que se nos ha proporcionado, previo a su limpieza.
- data_clean: Los archivos .csv limpios. 
- your_code: 
    - **Cleaning_SQL.ipynb**: jupyter notebook con la limpieza de datos y preparación de la data para el posterior análisis.
    -  **EDD_SQL_Script.sql** y **EDD_SQL_Diagrama.png**: scripts.sql y el diagrama creado con las relaciones entre las tablas.


### 3. ORGANIZACIÓN DE LOS DATOS
1. Carga de los archivos .csv y breve explotaración y estudio de los datos proporcionados.
2. Limpieza de los archivos y buscar relaciones entre estos. 
3. Creación y construcción de la base de datos en MySQL: Relaciones y diagrama de datos. 
4. **BONUS** - creación de al menos 5 queries que puedan aportar información relevante a partir de los datos (posibles consultas de los clientes).


### 4. LIMPIEZA DE DATOS
Primero se realiza una limpieza lo más detallada posible para que después la creación posterior de la base de datos sea más sencilla y útil.

Para la limpieza, se eliminaron algunas de las columnas de los dataframes proporcionados. Un ejemoplo de ello es la columna de 'Last Update'. Esta nos la proporcionaban en 6 de los 7 archivos que se nos dieron de inicio. Proporcionaba la misma información en todos, por lo que fue eliminada en todos ellos, menos en el archivo de 'actor', que la cambiamos por el valor de la 'fecha', por si en algún momento posterior nos fuera de utilidad. 

Algunos de loscambios más valiosos y útiles fueron definir en la tabla `old_HDD` el `category_id`, `actor_id` y el `film_id`. 
Esto nos serviría posteriormente para la unión de los valores de las tablas. 


### 5. CREACIÓN DE LA BASE DE DATOS
Posteriormente se crea la base de datos:

![Image](https://github.com/SaraPazo/Project_SQL-/blob/main/your_code/EDD_SQL_Diagrama.png)





# BONUS QUERIES


- 1 ¿Qué actores han participado en la película con el film_id = 34?

    
```
SELECT actor.Actor_id, actor.Name_complete, film.film_id
FROM old_HDD
LEFT JOIN actor ON old_HDD.Actor_id = actor.Actor_id
LEFT JOIN film ON old_HDD.film_id = film.film_id
WHERE film.film_id = 34;

```
![Query1](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query1.png)


- 2 ¿Qué actores han hecho / participado en más películas? 

 
```
SELECT actor.Actor_id, actor.Name_complete, COUNT(*) AS num_peliculas
FROM old_HDD
LEFT JOIN actor ON old_HDD.Actor_id = actor.Actor_id
GROUP BY actor.Actor_id, actor.Name_complete
ORDER BY num_peliculas DESC;

````
![Query2](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query2.png)
 
 
- 3  ¿Cuál es la película más corta?
 
 ```
SELECT film.title, film.length
FROM film
WHERE film.length = (SELECT MIN(film.length) FROM film);

```
![Query3](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query3.png)



- 4 Título de las películas disponibles en el inventario de la tienda 2.

```
SELECT film.title
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
WHERE inventory.store_id = 2;

```
![Query4_SQL](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query4_SQL.csv)



- 5 Dime el título de la película, de categoría 'Documental' en la que aparece PENELOPE GUINESS.

```
SELECT actor.Name_complete, film.title, category.Category
FROM old_HDD 
INNER JOIN actor ON old_HDD.Actor_id = actor.Actor_id
INNER JOIN film ON old_HDD.film_id = film.film_id
INNER JOIN category ON old_HDD.category_id = category.category_id
WHERE actor.Name_complete = 'PENELOPE GUINESS' and category.Category = 'Documentary'

````
![Query5](https://github.com/SaraPazo/Project_SQL-/blob/main/Imagen/Query5.png)

