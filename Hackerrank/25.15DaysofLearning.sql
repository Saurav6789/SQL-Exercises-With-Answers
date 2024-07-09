/*
Julia conducted a  days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.
*/

SELECT SUBMISSION_DATE,
    (SELECT COUNT(DISTINCT HACKER_ID)  
     FROM SUBMISSIONS S2  
     WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE 
       AND (SELECT COUNT(DISTINCT S3.SUBMISSION_DATE) 
            FROM SUBMISSIONS S3 
            WHERE S3.HACKER_ID = S2.HACKER_ID 
              AND S3.SUBMISSION_DATE < S1.SUBMISSION_DATE) = DATEDIFF(S1.SUBMISSION_DATE , '2016-03-01')
    ),
    (SELECT HACKER_ID 
     FROM SUBMISSIONS S2 
     WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE 
     GROUP BY HACKER_ID 
     ORDER BY COUNT(SUBMISSION_ID) DESC, HACKER_ID 
     LIMIT 1) AS TMP,
    (SELECT NAME 
     FROM HACKERS 
     WHERE HACKER_ID = TMP)
FROM
    (SELECT DISTINCT SUBMISSION_DATE FROM SUBMISSIONS) S1
GROUP BY SUBMISSION_DATE;


/* Explanation

1. Main Query Structure:

The main query is a SELECT statement that operates on a derived table S1, which contains distinct submission dates from the SUBMISSIONS table.
It selects each unique SUBMISSION_DATE from the SUBMISSIONS table.

2. First Subquery (Number of Hackers):

For each SUBMISSION_DATE in S1, it counts the number of distinct HACKER_IDs from the SUBMISSIONS table (S2) where:
The SUBMISSION_DATE matches the current SUBMISSION_DATE from S1.
The hacker has submitted on exactly DATEDIFF(S1.SUBMISSION_DATE , '2016-03-01') previous distinct dates.
This subquery aims to find the number of unique hackers who have made submissions on specific dates leading up to the current submission date.

3. Second Subquery (Top Hacker by Submissions):

This subquery identifies the HACKER_ID with the most submissions on each SUBMISSION_DATE.
It groups the results by HACKER_ID and orders them by the count of submissions in descending order and by HACKER_ID in ascending order to break ties.
The LIMIT 1 ensures that only the top hacker is selected.
The alias TMP is used to store this HACKER_ID.

4. Third Subquery (Hacker Name):

Using the HACKER_ID stored in TMP, this subquery retrieves the NAME of the hacker from the HACKERS table.

5. Derived Table S1:

This derived table consists of distinct SUBMISSION_DATE values from the SUBMISSIONS table.
It ensures that the query operates over each unique date on which submissions were made.

6. Final Output
The main query results in a table with the following columns:
SUBMISSION_DATE: Each unique date from the SUBMISSIONS table.
A count of distinct hackers who have submitted on that date and meet the specific previous submission criteria.
The HACKER_ID of the hacker with the most submissions on that date.
The NAME of that hacker.
7. Notes
The subqueries are correlated with the outer query, meaning they depend on the current row being processed from the outer query (the current SUBMISSION_DATE).
The use of DATEDIFF helps determine how many distinct dates a hacker has submitted before the current submission date.
This query is useful for analyzing submission patterns and identifying top contributors on specific dates while ensuring the distinctiveness and specific history of their activity.

*/






