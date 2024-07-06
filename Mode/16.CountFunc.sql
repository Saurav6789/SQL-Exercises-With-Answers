/* Write a query to count the number of non-null rows in the low column. */

SELECT COUNT(low) FROM tutorial.aapl_historical_stock_price 

/* Write a query that determines counts of every single column. With these counts, 
can you tell which column has the most null values? */ 

SELECT COUNT(*) FROM tutorial.aapl_historical_stock_price -- total count of the rows 


SELECT COUNT(year) AS year,
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price