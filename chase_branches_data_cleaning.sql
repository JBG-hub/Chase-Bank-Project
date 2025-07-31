-- First, import source data. Name the table chase_branches.
-- Then make a staging table to preserve the original table
Create Table chase_staging
Like chase_branches;

Insert chase_staging
Select *
From chase_branches;
-- 4659 rows

-- Rename columns for ease of use.
Alter Table chase_staging 
RENAME Column `Institution Name` To institution,
RENAME Column `Main Office` To main_office,
RENAME Column `Branch Name` To branch_name,
RENAME Column `Branch Number` To branch_number,
RENAME Column `Established Date` To established_date,
RENAME Column `Acquired Date` To acquired_date,
RENAME Column `Street Address` To street_address,
RENAME Column `2010 Deposits` To `2010_deposits`,
RENAME Column `2011 Deposits` To `2011_deposits`,
RENAME Column `2012 Deposits` To `2012_deposits`,
RENAME Column `2013 Deposits` To `2013_deposits`,
RENAME Column `2014 Deposits` To `2014_deposits`,
RENAME Column `2015 Deposits` To `2015_deposits`,
RENAME Column `2016 Deposits` To `2016_deposits`;


# Check to see if there are duplicate records in data
Select branch_number, COUNT(*) AS duplicate_count
From chase_staging
Group By branch_number
Having COUNT(*) > 1;
-- no duplicates found

-- Cleaning data
-- -- delete rows where branches had no deposit activity during timeframe (outliers)
Delete 
From chase_staging
Where 2010_deposits = 0 and 2011_deposits = 0 and 2012_deposits = 0 and 2013_deposits = 0 and 2014_deposits = 0 and 2015_deposits = 0 and 2016_deposits = 0;

-- add column for total_deposits that will be used to later explore data further (SQL) and visualize data (Tableau)
Alter Table chase_staging
Add Column total_deposits bigint;

Update chase_staging
Set total_deposits = 2010_deposits + 2011_deposits + 2012_deposits + 2013_deposits + 2014_deposits + 2015_deposits + 2016_deposits;

-- Search for more outliers. Dropping two rows with total deposits less than 1k over 7 year span.
Delete 
From chase_staging
Where total_deposits < 1000;

-- Fix data types. Change established_date & acquired_date from text to date. 
-- -- To do so, change "" rows to null for str_to_date to execute properly.
Update chase_staging
Set established_date = str_to_date(established_date, '%m/%d/%Y');

Update chase_staging
Set acquired_date = null
Where acquired_date = "";

Update chase_staging
Set acquired_date = str_to_date(acquired_date, '%m/%d/%Y');

Alter Table chase_staging
Modify Column established_date DATE,
Modify Column acquired_date DATE;

-- Final output to use for further analysis
Select *
From chase_staging
Where main_office = 0
Order by branch_number
Limit 10000;
