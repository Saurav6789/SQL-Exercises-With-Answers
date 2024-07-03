/*Write a query that calculates the sum of all four regions in a separate column.*/

SELECT year,
       month,
       west,
       south,
       midwest,
       northeast,
       west + south + midwest +northeast AS usa_total
  FROM tutorial.us_housing_units


/*Write a query that returns all rows for which more units were produced in the West region than in the Midwest 
and Northeast combined.*/

SELECT year,
       month,
       west,
       south,
       midwest,
       northeast
  FROM tutorial.us_housing_units
  WHERE west > (midwest + northeast)


/* Write a query that calculates the percentage of all houses completed in the United States represented by 
each region. Only return results from the year 2000 and later. */

SELECT year,
       month,
       west/(west + south + midwest + northeast)*100 AS west_pct,
       south/(west + south + midwest + northeast)*100 AS south_pct,
       midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
       northeast/(west + south + midwest + northeast)*100 AS northeast_pct
  FROM tutorial.us_housing_units
 WHERE year >= 2000

 
