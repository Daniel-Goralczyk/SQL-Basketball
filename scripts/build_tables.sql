/*
	Fantasy Basketball Statistics (2024)
	Author: Daniel Goralczyk
	Email: daniel@danielgoralczyk.com
	Website: https://www.danielgoralczyk.com
	LinkedIn: https://www.linkedin.com/in/daniel-goralczyk/
	
	File Name: build_tables.sql
	Description:  This script will import data from the CSV file and create the 
	schema, tables and table relationships for this project.  Once it is complete, 
	it will drop any unecessary schemas and tables.
*/

CREATE SCHEMA IF NOT EXISTS bball_schema;

DROP TABLE IF EXISTS bball_schema.bball;
CREATE TABLE bball_schema.bball (
	RANKING SERIAL PRIMARY KEY,
	PLAYER_NAME TEXT,
	TOTAL DECIMAL(5, 2),	
	POS TEXT,	
	TEAM TEXT,	
	GP INTEGER,	
	PTS DECIMAL(5, 2),	
	TREB DECIMAL(5, 2),	
	AST DECIMAL(5, 2),	
	STL DECIMAL(5, 2),	
	BLK DECIMAL(5, 2),	
	FGM DECIMAL(5, 2),	
	FTM DECIMAL(5, 2),
    TURNOVER DECIMAL(5, 2),
    DD DECIMAL(5, 2),
    TD DECIMAL(5, 2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fantasy_stats_2024.csv'
INTO TABLE bball_schema.bball
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
IGNORE 1 LINES; 

ALTER TABLE bball_schema.bball -- Creating a new column for primary position
ADD COLUMN PRIMARY_POS VARCHAR(255);

ALTER TABLE bball_schema.bball -- Creating a new column for position count
ADD COLUMN POS_COUNT INT;

UPDATE bball_schema.bball
SET 
    PRIMARY_POS = 
        CASE 
            WHEN LENGTH(POS) - LENGTH(REPLACE(POS, ',', '')) = 0 THEN POS
            WHEN LENGTH(POS) - LENGTH(REPLACE(POS, ',', '')) = 1 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(POS, ',', -1), ',', 1)
            WHEN LENGTH(POS) - LENGTH(REPLACE(POS, ',', '')) = 2 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(POS, ',', -2), ',', 1)
            ELSE SUBSTRING_INDEX(POS, ',', ROUND((LENGTH(POS) - LENGTH(REPLACE(POS, ',', ''))) / 2))
        END,
    POS_COUNT = LENGTH(POS) - LENGTH(REPLACE(POS, ',', '')) + 1
WHERE RANKING IS NOT NULL AND RANKING BETWEEN 1 AND 1000;

-- Add a new column named 'TOTAL_POINTS' to store the product of 'TOTAL' and 'GP'
ALTER TABLE bball_schema.bball
ADD COLUMN TOTAL_POINTS DECIMAL(10, 2); 

SET SQL_SAFE_UPDATES = 0;

-- Update the 'TOTAL_POINTS' column with the product of 'TOTAL' and 'GP'
UPDATE bball_schema.bball
SET TOTAL_POINTS = TOTAL * GP;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM bball_schema.bball;
