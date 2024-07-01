/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/

Select DISTINCT CITY From STATION where CITY REGEXP "^[aeiouAEIOU]"

/* ^ : Asserts the position at the start of the string, meaning the pattern must be matched at the beginning of the city name.
[aeiouAEIOU]: This defines a character class that matches any single character within the brackets. In this case, it matches any of the vowels (a, e, i, o, u) in both lowercase and uppercase.
*/