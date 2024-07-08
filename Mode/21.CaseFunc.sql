/* Write a query that includes a column that is flagged "yes" when a player is from California, 
and sort the results with those players first. */

SELECT player_name,
       state,
       CASE WHEN state = 'CA' THEN 'yes'
            ELSE NULL END AS from_california
  FROM benn.college_football_players
 ORDER BY 3


/* Write a query that includes players' names and a column that classifies them into four categories based on height. Keep in mind that the answer we provide is only one of many possible answers, 
since you could divide players' heights in many ways. */


SELECT player_name,
       height,
       CASE WHEN height > 85  THEN 'Over 85'
            WHEN height >60 AND height <=83 THEN 'Between 60 to 83'
            WHEN height >40 AND height <= 60 THEN 'Between 40 to 60'
            ELSE '40 or under' END AS height_group
FROM benn.college_football_players 


/* Write a query that selects all columns from benn.college_football_players and
 adds an additional column that displays the player's name if that player is a junior or senior. */



SELECT *,
       CASE WHEN year IN ('JR', 'SR') THEN player_name ELSE NULL END AS upperclass_player_name
  FROM benn.college_football_players


/* Write a query that counts the number of 300lb+ players for each of the following regions: 
West Coast (CA, OR, WA), Texas, and Other (everywhere else). */


SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN state = 'TX' THEN 'Texas'
            ELSE 'Other' END AS arbitrary_regional_designation,
            COUNT(1) AS players
  FROM benn.college_football_players
 WHERE weight >= 300
 GROUP BY 1


/* Write a query that calculates the combined weight of all underclass players (FR/SO) in California 
as well as the combined weight of all upperclass players (JR/SR) in California. */ 

SELECT CASE WHEN year IN ('FR', 'SO') THEN 'underclass'
            WHEN year IN ('JR', 'SR') THEN 'upperclass'
            ELSE NULL END AS class_group,
       SUM(weight) AS combined_player_weight
  FROM benn.college_football_players
 WHERE state = 'CA'
 GROUP BY 1


/* Write a query that displays the number of players in each state, with FR, SO, JR, and SR players 
in separate columns and another column for the total number of players. Order results such that states with the 
most players come first. */


SELECT state,
       COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
       COUNT(1) AS total_players
  FROM benn.college_football_players
 GROUP BY state
 ORDER BY total_players DESC


 /* Write a query that shows the number of players at schools with names that start with A through M, 
 and the number at schools with names starting with N - Z. */

 SELECT CASE WHEN school_name < 'n' THEN 'A-M'
            WHEN school_name >= 'n' THEN 'N-Z'
            ELSE NULL END AS school_name_group,
       COUNT(1) AS players
  FROM benn.college_football_players
 GROUP BY 1

