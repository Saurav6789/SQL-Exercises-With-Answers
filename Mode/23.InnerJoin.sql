/* Write a query that displays player names, school names and conferences for schools 
in the "FBS (Division I-A Teams)" division. */

SELECT players.player_name,
       players.school_name,
       teams.conference
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 WHERE teams.division = 'FBS (Division I-A Teams)'