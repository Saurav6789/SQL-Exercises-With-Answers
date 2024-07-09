/* Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT city.NAME FROM CITY city
JOIN COUNTRY country 
ON city.COUNTRYCODE = country.CODE
WHERE CONTINENT = 'AFRICA'