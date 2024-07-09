/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */


SELECT SUM(city.POPULATION) FROM CITY city
JOIN COUNTRY country ON city.COUNTRYCODE = country.code
WHERE CONTINENT = 'ASIA'

