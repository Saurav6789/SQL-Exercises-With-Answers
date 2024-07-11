/* Write a query that separates the `location` field into separate fields for latitude and longitude. 
You can compare your results against the actual `lat` and `lon` fields in the table. */

SELECT location,
       TRIM(leading '(' FROM LEFT(location, POSITION(',' IN location) - 1)) AS lattitude,
       TRIM(trailing ')' FROM RIGHT(location, LENGTH(location) - POSITION(',' IN location) ) ) AS longitude
  FROM tutorial.sf_crime_incidents_2014_01


/* Concatenate the lat and lon fields to form a field that is equivalent to the location field. 
(Note that the answer will have a different decimal precision.) */

SELECT CONCAT('(', lat, ', ', lon, ')') AS concat_location,
       location
  FROM tutorial.sf_crime_incidents_2014_01


/* Create the same concatenated location field, but using the || syntax instead of CONCAT. */

SELECT '(' || lat || ', ' || lon || ')' AS concat_location,
       location
  FROM tutorial.sf_crime_incidents_2014_01


/* Write a query that creates a date column formatted YYYY-MM-DD. */

SELECT incidnt_num,
           date,
           SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2) AS cleaned_date
      FROM tutorial.sf_crime_incidents_2014_01


/* Write a query that returns the `category` field, but with the first letter capitalized and the 
rest of the letters in lower-case. */

SELECT incidnt_num,
       category,
       UPPER(LEFT(category, 1)) || LOWER(RIGHT(category, LENGTH(category) - 1)) AS category_cleaned
  FROM tutorial.sf_crime_incidents_2014_01


/* Write a query that creates an accurate timestamp using the date and time columns in 
tutorial.sf_crime_incidents_2014_01. Include a field that is exactly 1 week later as well.
*/

SELECT incidnt_num,
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) ||
        '-' || SUBSTR(date, 4, 2) || ' ' || time || ':00')::timestamp AS timestamp,
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) ||
        '-' || SUBSTR(date, 4, 2) || ' ' || time || ':00')::timestamp
        + INTERVAL '1 week' AS timestamp_plus_interval
  FROM tutorial.sf_crime_incidents_2014_01


