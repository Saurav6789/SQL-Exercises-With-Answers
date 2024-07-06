/* Write a query to calculate the average opening price */

SELECT SUM(open)/COUNT(open) FROM tutorial.aapl_historical_stock_price
