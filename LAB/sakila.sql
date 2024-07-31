-- Escribe una consulta para mostrar para cada tienda su ID de tienda, ciudad y país.


SELECT 
    s.store_id AS "Store ID",
    c.city AS "City",
    co.country AS "Country"
FROM 
    store s
JOIN 
    address a ON s.address_id = a.address_id
JOIN 
    city c ON a.city_id = c.city_id
JOIN 
    country co ON c.country_id = co.country_id;

--  Escribe una consulta para mostrar cuánto negocio, en dólares, trajo cada tienda.
SELECT 
    s.store_id AS "Store ID",
    SUM(p.amount) AS "Total Business"
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    store s ON i.store_id = s.store_id
GROUP BY 
    s.store_id;

-- ¿Cuál es el tiempo de ejecución promedio de las películas por categoría?
SELECT 
    c.name AS "Category",
    AVG(f.length) AS "Average Length"
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
GROUP BY 
    c.name;

-- ¿Qué categorías de películas son las más largas?
SELECT 
    c.name AS "Category",
    AVG(f.length) AS "Average Length"
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
GROUP BY 
    c.name
ORDER BY 
    AVG(f.length) DESC;

-- Muestra las películas más alquiladas en orden descendente
SELECT 
    f.title AS "Title",
    COUNT(r.rental_id) AS "Rental Count"
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.title
ORDER BY 
    COUNT(r.rental_id) DESC;

-- Enumera los cinco principales géneros en ingresos brutos en orden descendente.
SELECT 
    c.name AS "Category",
    SUM(p.amount) AS "Total Revenue"
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
GROUP BY 
    c.name
ORDER BY 
    SUM(p.amount) DESC;

-- ¿Está "Academy Dinosaur" disponible para alquilar en la Tienda 1?

SELECT 
    CASE 
        WHEN COUNT(i.inventory_id) > 0 THEN 'Available'
        ELSE 'Not Available'
    END AS "Availability"
FROM 
    inventory i
JOIN 
    film f ON i.film_id = f.film_id
LEFT JOIN 
    rental r ON i.inventory_id = r.inventory_id AND r.return_date IS NULL
WHERE 
    f.title = 'Academy Dinosaur' 
    AND i.store_id = 1
GROUP BY 
    f.title;