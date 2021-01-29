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