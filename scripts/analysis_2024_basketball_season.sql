/*
	Fantasy Basketball Statistics (2024)
	Author: Daniel Goralczyk
	Email: daniel@danielgoralczyk.com
	Website: https://www.danielgoralczyk.com
	LinkedIn: https://www.linkedin.com/in/daniel-goralczyk/
	
	File Name: analysis_2024_basketball_season.sql
	Description: Evaluates some of the findings for the 2024 Basketball season.
*/

-- Which Players Played the Whole Season
SELECT  PLAYER_NAME, TEAM, GP, RANKING FROM bball_schema.bball 
WHERE GP='82'; 

/*
+-------------------+------+------+---------+
| PLAYER_NAME       | TEAM | GP   | RANKING |
+-------------------+------+------+---------+
| Domantas Sabonis  | SAC  |   82 |       7 |
| Chet Holmgren     | OKC  |   82 |      56 |
| Jalen Green       | HOU  |   82 |      69 |
| Mikal Bridges     | BKN  |   82 |      72 |
| Austin Reaves     | LAL  |   82 |      87 |
| Jonas Valanciunas | NO   |   82 |      98 |
| Bobby Portis      | MIL  |   82 |     107 |
+-------------------+------+------+---------+
*/

-- Looking at how many for each position
SELECT PRIMARY_POS, COUNT(*) AS num_players 
FROM bball_schema.bball 
GROUP BY PRIMARY_POS;
-- Results
/*
+-------------+-------------+
| PRIMARY_POS | num_players |
+-------------+-------------+
| C           |          44 |
| PG          |          15 |
| SG          |          32 |
| PF          |          27 |
| SF          |          32 |
+-------------+-------------+
*/

-- Retrieve the top 5 players based on Total Points
SELECT RANKING, PLAYER_NAME, TOTAL_POINTS, TEAM, GP 
FROM bball_schema.bball 
WHERE GP > '65' 
ORDER BY TOTAL_POINTS DESC 
LIMIT 5;

-- Results
/*
+---------+-----------------------+--------------+------+------+
| RANKING | PLAYER_NAME           | TOTAL_POINTS | TEAM | GP   |
+---------+-----------------------+--------------+------+------+
|       4 | Nikola Jokic          |      5672.20 | DEN  |   79 |
|       2 | Luka Doncic           |      5425.00 | DAL  |   70 |
|       3 | Giannis Antetokounmpo |      5336.30 | MIL  |   73 |
|       5 | Anthony Davis         |      4909.60 | LAL  |   76 |
|       7 | Domantas Sabonis      |      4903.60 | SAC  |   82 |
+---------+-----------------------+--------------+------+------+
*/

-- Retrieve the top 5 players based on points
SELECT RANKING, PLAYER_NAME, PTS, TEAM, GP 
FROM bball_schema.bball 
WHERE GP > '65' 
ORDER BY PTS DESC 
LIMIT 5;

-- Results
/* 
+---------+-------------------------+-------+------+------+
| RANKING | PLAYER_NAME             | PTS   | TEAM | GP   |
+---------+-------------------------+-------+------+------+
|       2 | Luka Doncic             | 33.90 | DAL  |   70 |
|       3 | Giannis Antetokounmpo   | 30.40 | MIL  |   73 |
|       6 | Shai Gilgeous-Alexander | 30.10 | OKC  |   75 |
|      12 | Jalen Brunson           | 28.70 | NY   |   77 |
|      11 | Kevin Durant            | 27.10 | PHO  |   75 |
+---------+-------------------------+-------+------+------+
*/

-- Retrieve the top 5 players based on rebounds
SELECT RANKING, PLAYER_NAME, TREB, TEAM, GP 
FROM bball_schema.bball 
WHERE GP > '65' 
ORDER BY TREB DESC 
LIMIT 5;

-- Results
/*+---------+-----------------------+-------+------+------+
| RANKING | PLAYER_NAME           | TREB  | TEAM | GP   |
+---------+-----------------------+-------+------+------+
|       7 | Domantas Sabonis      | 13.70 | SAC  |   82 |
|      48 | Rudy Gobert           | 12.90 | MIN  |   76 |
|       5 | Anthony Davis         | 12.60 | LAL  |   76 |
|       4 | Nikola Jokic          | 12.40 | DEN  |   79 |
|       3 | Giannis Antetokounmpo | 11.50 | MIL  |   73 |
+---------+-----------------------+-------+------+------+
*/

-- Retrieve the top 5 players based on assists
SELECT RANKING, PLAYER_NAME, AST, TEAM, GP 
FROM bball_schema.bball 
WHERE GP > '65' 
ORDER BY AST DESC 
LIMIT 5;

-- Results
/*
+---------+-------------------+-------+------+------+
| RANKING | PLAYER_NAME       | AST   | TEAM | GP   |
+---------+-------------------+-------+------+------+
|      29 | Tyrese Haliburton | 10.90 | IND  |   69 |
|       2 | Luka Doncic       |  9.80 | DAL  |   70 |
|       4 | Nikola Jokic      |  9.00 | DEN  |   79 |
|      54 | James Harden      |  8.50 | LAC  |   72 |
|       8 | LeBron James      |  8.30 | LAL  |   71 |
+---------+-------------------+-------+------+------+
*/

-- Top 3 teams with the highest number of players for each position
SELECT TEAM, COUNT(*) AS num_players 
FROM bball_schema.bball 
WHERE GP > '65' 
GROUP BY TEAM 
ORDER BY num_players DESC 
LIMIT 3;
-- Results
/*
+------+-------------+
| TEAM | num_players |
+------+-------------+
| LAL  |           5 |
| SA   |           5 |
| LAC  |           5 |
*/

-- Bottom 4 teams with the lowest number of players for each position
SELECT TEAM, COUNT(*) AS num_players 
FROM bball_schema.bball 
WHERE GP > '65' 
GROUP BY TEAM 
ORDER BY num_players ASC 
LIMIT 4;
-- Results
/*
+------+-------------+
| TEAM | num_players |
+------+-------------+
| MIA  |           1 |
| MEM  |           1 |
| TOR  |           1 |
| DET  |           1 |
+------+-------------+
*/

SELECT 
    PLAYER_NAME,
    PTS,
    PERCENT_RANK() OVER (ORDER BY PTS) AS Percentile
FROM 
    bball_schema.bball
WHERE 
    GP >= 65; -- Filter for players who have played at least 65 games

