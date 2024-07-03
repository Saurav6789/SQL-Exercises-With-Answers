/*Did the West Region ever produce more than 50,000 housing units in one month? */

SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 50

/* Did the South Region ever produce 20,000 or fewer housing units in one month? */

SELECT *
  FROM tutorial.us_housing_units
 WHERE south <= 20

/* Write a query that only shows rows for which the month name is February */

SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'

/* Write a query that only shows rows for which the month_name starts with the letter "N" or 
an earlier letter in the alphabet. */

SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name <= 'N'

