/* Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group. */ 


SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE group_name ILIKE '%ludacris%' AND year_rank<= 10


/* Write a query that surfaces the top-ranked records in 1990, 2000, and 2010. */

SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE year_rank = 1 AND year IN (1990, 2000,2010)


/* Write a query that lists all songs from the 1960s with "love" in the title.*/


SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE song_name ILIKE '%love%' AND year BETWEEN 1960 AND 1969
  
