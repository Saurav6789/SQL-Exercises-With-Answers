/* Write a query that shows all of the entries for Elvis and M.C. Hammer. */

/* Query to find out MC hammer appears in the database */


SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE artist  ILIKE '%Hammer%';


/* Final solution */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE group_name IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')