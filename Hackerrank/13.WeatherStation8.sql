/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$'

/*
REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$':
REGEXP: This is used for pattern matching in SQL.
'^[aeiouAEIOU].*[aeiouAEIOU]$': This is the regular expression pattern.
^: Asserts the position at the start of the string, meaning the pattern must be matched at the beginning of the city name.
[aeiouAEIOU]: This defines a character class that matches any single character within the brackets. In this case, it matches any of the vowels (a, e, i, o, u) in both lowercase and uppercase.
.*: Matches any character (except for a newline) zero or more times. This allows for any characters to exist between the first and last character.
[aeiouAEIOU]: Another character class that matches any of the vowels.
$: Asserts the position at the end of the string, meaning the pattern must be matched at the end of the city name.
*/
