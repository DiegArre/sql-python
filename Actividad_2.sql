/* 1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe 
devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el 
resultado por porcentaje de idioma en orden descendente. (1) */

SELECT * FROM cities;
SELECT * FROM languages;
SELECT * FROM countries; 

SELECT name,language,percentage FROM languages
JOIN countries ON countries.id = languages.country_id
WHERE languages.language = "Slovene"

/*2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? 
Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta 
debe organizar el resultado por el número de ciudades en orden descendente. (3)*/

