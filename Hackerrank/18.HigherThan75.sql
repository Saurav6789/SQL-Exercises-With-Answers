/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/



/* 
ORDER BY SUBSTRING(NAME, LENGTH(NAME) - 2, 3), ID ASC:

ORDER BY: This clause specifies the sort order of the results.
SUBSTRING(NAME, LENGTH(NAME) - 2, 3): This function extracts the last three characters of the NAME column.
LENGTH(NAME) - 2: This calculates the starting position of the last three characters.
3: This specifies the length of the substring to extract, which is three characters in this case.
ID ASC: This secondary sort orders the results by the ID column in ascending order when two or more names end with the same last three characters.
*/

SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC;

/* ORDER BY RIGHT(NAME, 3), ID ASC:

ORDER BY: This clause specifies the sort order of the results.
RIGHT(NAME, 3): This function extracts the last three characters of the NAME column.
ID ASC: This secondary sort orders the results by the ID column in ascending order when two or more names end with the
 same last three characters.*/

