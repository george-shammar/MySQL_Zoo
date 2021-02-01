-- select basic

SELECT population 
FROM world
WHERE name = 'Germany'

SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000;

-- select from world

SELECT name, continent, population 
FROM world;

SELECT name
FROM world
WHERE population >= 200000000;

SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

SELECT name, population
FROM world
WHERE name = 'France' OR name = 'Germany' OR name = 'Italy';

SELECT name
FROM world
WHERE name LIKE 'United%';

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

SELECT name, population, area
FROM world
WHERE area > 3000000 AND population < 250000000 OR area < 3000000 AND population > 250000000;

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM world
WHERE continent = 'South America';

SELECT name, ROUND(GDP/population, 0)
FROM world
WHERE GDP >= 1000000000000;

SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital);

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital, 1) AND name<>capital;