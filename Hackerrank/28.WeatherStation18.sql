/* 
Consider p1(a,b) and p2(a,b)  to be two points on a 2D plane.

- a  happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
- Query the Manhattan Distance between points p1 and p2 and  and round it to a scale of 4 decimal places.
*/

SELECT ROUND( 
    ABS (MIN(LAT_N)-MAX(LAT_N)) + ABS(MIN(LONG_W )-MAX(LONG_W ))
    ,4) 
as manhattan_distance FROM STATION