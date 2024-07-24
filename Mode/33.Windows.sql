/* How can we calculate the cumulative total duration of bike share trips over time? */

SELECT duration_seconds,
       SUM(duration_seconds) OVER (ORDER BY start_time) AS running_total
  FROM tutorial.dc_bikeshare_q1_2012


/* "How can we calculate the cumulative total duration of bike share trips for each terminal, considering only trips before January 8, 2012?" */

SELECT start_terminal,
       duration_seconds,
       SUM(duration_seconds) OVER
         (PARTITION BY start_terminal ORDER BY start_time)
         AS running_total
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'


/* How can we calculate the total trip duration and the percentage of total trip duration for each bike share trip by start terminal for 
trips before January 8, 2012?" */

SELECT start_terminal,
       duration_seconds,
       SUM(duration_seconds) OVER (PARTITION BY start_terminal) AS start_terminal_sum,
       (duration_seconds/SUM(duration_seconds) OVER (PARTITION BY start_terminal))*100 AS pct_of_total_time
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY 1, 4 DESC


/* Write a query that shows a running total of the duration of bike rides (similar to the last example), but grouped by end_terminal, 
and with ride duration sorted in descending order. */

SELECT end_terminal,
       duration_seconds,
       SUM(duration_seconds) OVER
         (PARTITION BY end_terminal ORDER BY duration_seconds DESC)
         AS running_total
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'


/* How can we assign a unique row number to each bike share trip ordered by the start time, for trips that started before January 8, 2012? */

SELECT start_terminal,
       start_time,
       duration_seconds,
       ROW_NUMBER() OVER (ORDER BY start_time)
                    AS row_number
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 


/* How can we assign a unique row number to each bike share trip ordered by start time within each start terminal, for trips that started before January 8, 2012? */


SELECT start_terminal,
       start_time,
       duration_seconds,
       ROW_NUMBER() OVER (PARTITION BY start_terminal
                          ORDER BY start_time)
                    AS row_number
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'


 /* "How can we rank bike share trips by their start time within each start terminal for trips that started before January 8, 2012? */

 SELECT start_terminal,
       duration_seconds,
       RANK() OVER (PARTITION BY start_terminal
                    ORDER BY start_time) AS rank
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'


/* Write a query that shows the 5 longest rides from each starting terminal, ordered by terminal, and longest to shortest rides within each terminal. 
Limit to rides that occurred before Jan. 8, 2012 */

SELECT *
  FROM (
        SELECT start_terminal,
               start_time,
               duration_seconds AS trip_time,
               RANK() OVER (PARTITION BY start_terminal ORDER BY duration_seconds DESC) AS rank
          FROM tutorial.dc_bikeshare_q1_2012
         WHERE start_time < '2012-01-08'
               ) sub
 WHERE sub.rank <= 5


/* How can we categorize bike share trip durations into quartiles, quintiles, and percentiles within each start terminal for trips that started 
before January 8, 2012? */

SELECT start_terminal,
       duration_seconds,
       NTILE(4) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
          AS quartile,
       NTILE(5) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS quintile,
       NTILE(100) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS percentile
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY start_terminal, duration_seconds


 /* Write a query that shows only the duration of the trip and the percentile into which that duration falls 
 (across the entire dataset—not partitioned by terminal). */


 SELECT duration_seconds,
       NTILE(100) OVER (ORDER BY duration_seconds)
         AS percentile
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY 1 DESC


 /* How can we find the previous and next trip durations for each bike share trip within the same start terminal, 
 ordered by trip duration, for trips that started before January 8, 2012 */

 SELECT start_terminal,
       duration_seconds,
       duration_seconds - LAG(duration_seconds, 1) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds) AS difference
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY start_terminal, duration_seconds


/* How can we calculate the difference in duration between consecutive bike share trips within the same start terminal, 
ordered by trip duration, for trips that started before January 8, 2012? */

SELECT *
  FROM (
    SELECT start_terminal,
           duration_seconds,
           duration_seconds - LAG(duration_seconds, 1) OVER
             (PARTITION BY start_terminal ORDER BY duration_seconds) AS difference
      FROM tutorial.dc_bikeshare_q1_2012
     WHERE start_time < '2012-01-08'
     ORDER BY start_terminal, duration_seconds
       ) sub
 WHERE sub.difference IS NOT NULL



/* How can we filter bike share trips to show only those with a calculated difference in duration from the previous trip within the same start terminal, 
for trips that started before January 8, 2012? */

SELECT *
  FROM (
    SELECT start_terminal,
           duration_seconds,
           duration_seconds - LAG(duration_seconds, 1) OVER
             (PARTITION BY start_terminal ORDER BY duration_seconds) AS difference
      FROM tutorial.dc_bikeshare_q1_2012
     WHERE start_time < '2012-01-08'
     ORDER BY start_terminal, duration_seconds
       ) sub
 WHERE sub.difference IS NOT NULL
