/*
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '[aeiouAEIOU]$'

/* 
[aeiouAEIOU]: This defines a character class that matches any single character within the brackets. In this case, it matches any of the vowels (a, e, i, o, u) in both lowercase and uppercase.
$: Asserts the position at the end of the string, meaning the pattern must be matched at the end of the city name.
*/