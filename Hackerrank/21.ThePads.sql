/*
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/

SELECT CONCAT(NAME, '(', SUBSTRING(OCCUPATION, 1, 1), ')') AS NAME_WITH_PROFESSION
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(OCCUPATION), 's.') AS OCCUPATION_COUNT
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(*), OCCUPATION;


/*
-- Query 1 --
CONCAT(NAME, '(', SUBSTRING(OCCUPATION, 1, 1), ')'):

CONCAT function concatenates the NAME, an open parenthesis, the first letter of the OCCUPATION (extracted using SUBSTRING(OCCUPATION, 1, 1)), and a closing parenthesis.
SUBSTRING(OCCUPATION, 1, 1) extracts the first letter of the OCCUPATION.
ORDER BY NAME:

Orders the result alphabetically by the NAME.

-Query2--
CONCAT('There are a total of ', COUNT(*), ' ', LOWER(OCCUPATION), 's.'):

CONCAT function constructs the required string format.
COUNT(*) counts the number of occurrences of each OCCUPATION.
LOWER(OCCUPATION) converts the occupation name to lowercase.
GROUP BY OCCUPATION:

Groups the results by OCCUPATION.
ORDER BY COUNT(*), OCCUPATION:

Orders the results first by the count of each occupation in ascending order.
If multiple occupations have the same count, they are ordered alphabetically by OCCUPATION.

*/



