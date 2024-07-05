/*LIKE is a logical operator in SQL that allows us to match on similar values rather than exact ones.
 To ignore case when we're matching values, we can use the ILIKE command */


/* Write a query that returns all rows for which Ludacris was a member of the group.*/

SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE group_name ilike '%ludacris%'


/* Write a query that returns all rows for which the first artist listed in the group has a name 
that begins with "DJ". */

SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE group_name like 'DJ%'
