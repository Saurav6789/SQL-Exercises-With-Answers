/* A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/


SELECT 
    ROUND(AVG(LAT_N),4) AS median_value
FROM (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM 
        STATION
) AS subquery
WHERE
    row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2));


/* 

Purpose: The query calculates the median of the LAT_N column from the STATION table, rounded to 4 decimal places.

Subquery:

Select Columns: It selects LAT_N (the latitude), the row number of each row when ordered by LAT_N (row_num), and the total number of rows in the table (total_rows).

ROW_NUMBER(): This function assigns a unique row number to each row based on the order of LAT_N.

COUNT(*) OVER (): This function calculates the total number of rows in the table.

Main Query:

It uses the subquery to find the rows that are in the middle of the ordered list.

WHERE Clause: It selects rows where the row_num is either the floor or ceiling of half the total rows plus one. This logic helps in selecting the middle value(s) for calculating the median.

AVG(LAT_N): It calculates the average of these middle values (which is the median in case of an odd number of rows, or the average of the two middle values in case of an even number of rows).

ROUND(): Finally, it rounds this median value to 4 decimal places

*/ 