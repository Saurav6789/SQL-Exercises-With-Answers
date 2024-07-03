 /*Write a query to select all of the columns in tutorial.us_housing_units and rename them so that their first letters are capitalized. */

SELECT year AS "Year",
       month AS "Month",
       month_name AS "Month Name",
       west AS "West",
       midwest AS "Midwest",
       south AS "South",
       northeast AS "Northeast"
  FROM tutorial.us_housing_units