/* IS NULL is a logical operator in SQL that allows us to exclude rows with missing data from your results. */

/* Write a query that shows all of the rows for which song_name is null. */

SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE song_name ISNULL
