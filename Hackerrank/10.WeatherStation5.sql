/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/

SELECT CITY, LENGTH(CITY) AS LENGTH
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS LENGTH
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1;

/*Query for the Shortest City Name:

ORDER BY LENGTH(CITY) ASC, CITY ASC: This orders the cities first by the length of the CITY name in ascending order (shortest first) and then by CITY name alphabetically for ties.
LIMIT 1: This limits the result to the first entry, which will be the shortest city name that comes first alphabetically. 

Query for the Longest City Name:

ORDER BY LENGTH(CITY) DESC, CITY ASC: This orders the cities first by the length of the CITY name in descending order (longest first) and then by CITY name alphabetically for ties.
LIMIT 1: This limits the result to the first entry, which will be the longest city name that comes first alphabetically.
*/

