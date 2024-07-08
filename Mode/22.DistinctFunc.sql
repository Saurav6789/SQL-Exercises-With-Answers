/* Write a query that returns the unique values in the year column, in chronological order. */

SELECT DISTINCT year
  FROM tutorial.aapl_historical_stock_price
 ORDER BY year


 /* Write a query that counts the number of unique values in the month column for each year. */

 SELECT year,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year
 ORDER BY year


/* Write a query that separately counts the number of unique values in the month column and the number of 
unique values in the `year` column. */

SELECT COUNT(DISTINCT year) AS years_count,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price

