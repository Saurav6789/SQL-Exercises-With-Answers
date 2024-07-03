/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/
SELECT
    MAX(IF (OCCUPATION = 'Doctor' ,NAME,NULL)) AS Doctor,
    MAX(IF (OCCUPATION = 'Professor',NAME,NULL)) AS Professor,
    MAX(IF (OCCUPATION = 'Singer',NAME,NULL)) AS Singer,
    MAX(IF (OCCUPATION = 'Actor',NAME,NULL)) AS Actor
FROM
    (SELECT NAME, OCCUPATION, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS row_num 
     FROM OCCUPATIONS) as ord 
GROUP BY row_num;


/* ROW_NUMBER() Window Function:

ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS row_num:
This assigns a unique row number to each row within each partition (occupation) ordered by name.

Conditional Aggregation:

MAX(IF (OCCUPATION = 'Doctor' ,NAME,NULL)) AS Doctor:
This checks if the occupation is 'Doctor'. If true, it takes the NAME; otherwise, it returns NULL. MAX is used to aggregate the values.

Grouping:
GROUP BY row_num:
Groups the results by the row numbers assigned in the subquery

*/

