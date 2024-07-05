/* Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a". */


SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE year = 2013 AND song_name NOT ILIKE '%a%'
