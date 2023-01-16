2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select name from world
where gdp/population > (select gdp/population from world where name like 'United Kingdom') and continent like 'Europe'


percapita GDP = gdp/population

3.

List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

select name,continent
from world
where continent IN (select continent from world where name IN('Australia','Argentina'))

order by name;


4.
Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.

select name,population
from world
where population > (select population from world where name ='United Kingdom') and population < (select population from world where name = 'Germany')






5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:



SELECT name, CONCAT(floor(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100, 0)), '%')
FROM world
WHERE continent = 'Europe'


6.
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

select name
from world
where gdp > all(select gdp from world where continent ='Europe' AND GDP>0)






8.First country of each continent (alphabetically)

SELECT continent,name
FROM world as x
where name = (select top 1 name from world as y 
where y.continent = x.continent
) 



Using GROUP BY and HAVING

Counting the countries of each continent


6.
select continent,count(name)
from world
group by continent




7.Counting big countries in each continent

For each continent show the continent and number of countries with populations of at least 10 million.

select continent,count(name)
from world
where population >=10000000
group by continent



8. Counting big continents

List the continents that have a total population of at least 100 million.

select continent
from world
group by continent
having sum(population) >=100000000




Literature in the 1980s
5
Show all details yr subject, winner of the literature prize winners for 1980 to 1989 inclusive


select yr,subject,winner
from nobel
where yr between 1980 and 1989 and subject ="literature"


Early Medicine, Late Literature
10.
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

select yr,subject,winner
from nobel
where (yr < 1910 and subject ="Medicine") or (yr >=2004 and subject = "Literature")
