/* Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */


SELECT country.CONTINENT , FLOOR(AVG(city.POPULATION)) FROM CITY city 
INNER JOIN COUNTRY country ON city.CountryCode = country.Code
GROUP BY country.CONTINENT
