/* Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi. */


SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE year_rank < 10 AND (group_name ILIKE '%Katy Perry%' OR 
  artist ILIKE '%Bon Jovi%')  


/* Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s. */


SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE song_name ILIKE '%California%' AND (year BETWEEN 1960 AND
   1969 or year BETWEEN 1970 AND 1979) 


/* Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.*/


 
SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE group_name ILIKE '%Dr. Dre%' AND(year < 2001 OR year > 2009) 


