# SQL Project: 2024 Fantasy Basketball Analysis  

## About
This project is designed to practice using MySQL and demonstrate the ability to execute basic SQL queries. The primary goal is to analyze basketball data from the 2023-2024 NBA season to identify top-performing players, which will help in preparing for the next fantasy basketball season. Before creating visual representations of this data in [Tableau](https://www.danielgoralczyk.com/personal-projects/tableau-project/), the data is first manipulated and analyzed using SQL.

## Instructions
1. Data Preperation:
      * The data used for this project is found in csv format and located in the [source_data](/source_data) folder. Download this file and place it in a folder where you can access it in your database.
       
2. Scripts:
      * This repository contains two scripts located in the [scripts](/scripts) folder:
        
        * 'build_tables.sql':  This script creates the data schema, attaches the CSV file as a table, calculates new variables, and cleans up the data table as needed. This script must be run first.  
        * 'analysis_2024_basketball_season.sql: This script runs several queries to find key statistics of the players and league leaders. The outputs generated are copied into the SQL file for clarity.   

## Built with
* MySQL Workbench 8.0 CE  
* Server version: 8.0.37 MySQL Community Server - GPL

## Authors
* Daniel Goralczyk
