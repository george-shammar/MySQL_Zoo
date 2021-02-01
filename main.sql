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

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
  AND name NOT LIKE '% %';

--   nobel table

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

SELECT winner 
FROM nobel
WHERE subject = 'peace' AND yr >= 2000;

SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989; 

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                    'Barack Obama');

SELECT winner
FROM nobel
WHERE winner LIKE ('John%');

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine';

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >=2004;