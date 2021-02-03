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
 WHERE yr = 1950;

 SELECT winner
 FROM nobel
 WHERE yr = 1962
 AND subject = 'Literature';

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
 WHERE winner IN 
 ('Theodore Roosevelt',
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

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'; 

SELECT *
FROM nobel
WHERE winner LIKE 'Eugene O%';

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY 
CASE
WHEN subject IN ('Physics', 'Chemistry') THEN 1
ELSE 0
END,
subject, winner;

-- nested queries

SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

SELECT name
FROM world
WHERE continent = 'Europe' AND GDP/population > 
(SELECT GDP/population 
FROM world
WHERE name = 'United Kingdom');

SELECT name, continent
FROM world
WHERE continent = 'South America' OR continent = 'Oceania'
ORDER BY name;

SELECT name, population
FROM world
WHERE population > 
(SELECT population
FROM world
WHERE name = 'Canada') AND population < 
(SELECT population
FROM world
WHERE name = 'Poland');

SELECT name, 
CONCAT(ROUND(population/(SELECT population
                                FROM world
                                WHERE name = 'Germany')*100, 0), '%')AS percentage
           
FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp >
ALL(SELECT gdp
FROM world
WHERE continent = 'Europe' AND GDP > 0);


-- sum and count
SELECT SUM(population)
FROM world;

SELECT DISTINCT(continent)
FROM world;

SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa';

SELECT COUNT(name)
FROM world
WHERE area >=1000000;

SELECT SUM(population)
FROM world
WHERE name = 'Estonia' OR name = 'Latvia' OR name = 'Lithuania';

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

-- join
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

SELECT player,teamid, stadium, mdate
FROM goal JOIN game ON (goal.matchid = game.id)
WHERE teamid = 'GER';

SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime<=10;

SELECT mdate, teamname
FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos';

SELECT player
FROM goal JOIN game ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT(player)
FROM goal JOIN game ON (goal.matchid = game.id) 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';

SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname;

SELECT stadium, COUNT(*)
FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium
ORDER BY stadium;

SELECT matchid, mdate, COUNT(Player)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- more join
SELECT id, title
 FROM movie
 WHERE yr=1962;

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

SELECT id 
FROM actor
WHERE name = 'Glenn Close';

SELECT id 
FROM movie
WHERE title = 'Casablanca';

SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE movieid=27;

SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE movieid=
(SELECT id 
FROM movie 
WHERE title = 'Alien');

SELECT title
FROM movie JOIN casting ON (movie.id = casting.movieid)
WHERE actorid = 
(SELECT id
FROM actor
WHERE name = 'Harrison Ford');

SELECT title 
FROM movie JOIN casting ON (movie.id = casting.movieid)
WHERE ord != 1 AND actorid =
(SELECT id
FROM actor
WHERE name = 'Harrison Ford');

SELECT title, name
FROM movie JOIN casting ON (movie.id = casting.movieid)
JOIN actor ON (casting.actorid = actor.id)
WHERE yr = 1962 AND ord = 1;

SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1;

SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE ord = 1 
GROUP BY name
HAVING COUNT(ord) >= 15
ORDER BY name;

-- NULL
SELECT name 
FROM teacher
WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id);

SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher;

SELECT dept.name, COUNT(teacher.name) 
FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id)
GROUP BY dept.name;

SELECT teacher.name,
CASE
WHEN teacher.dept = 1 THEN 'Sci'
WHEN teacher.dept = 2 THEN 'Sci'
ELSE 'Art'
END
FROM teacher;

SELECT teacher.name,
CASE
WHEN teacher.dept = 1 THEN 'Sci'
WHEN teacher.dept =2 THEN 'Sci'
WHEN teacher.dept = 3 THEN 'Art'
ELSE 'None'
END
FROM teacher;

-- self join
SELECT COUNT(name)
FROM stops;

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop = 53
AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'London Road';

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop = 115
AND b.stop = 137;