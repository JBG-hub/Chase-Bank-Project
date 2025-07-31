-- Analysis
-- The data has been cleaned and prepared for further analysis in the previous sql file.
-- See the below queries that answer specific business questions and explores the data for key insights.

-- - top 10 branches by deposits, ranked
With rankings as (Select branch_name, branch_number, city, state, zipcode, total_deposits, 
rank() over(Order by total_deposits desc) as ranking
From chase_staging
Where main_office = 0)

Select *
From rankings
Where ranking <= 10;

-- - # of branches, total_deposits, & avg by state
Select state, count(branch_number) as branches, sum(total_deposits) as total_$, 
round(avg(total_deposits),0) as avg_by_branch
From chase_staging
Where main_office = 0
Group by state
Order by total_$ desc;

-- Q: How many branches opened and closed during this time frame? 
-- A: Based on deposit activity, it appears only 1 opened (branch 7078 in NY). Only 1 closed (branch 3152 in IL).
Select *
From chase_staging
Where 2010_deposits = 0 or 2011_deposits = 0 or 2012_deposits = 0 or 2013_deposits = 0 
or 2014_deposits = 0 or 2015_deposits = 0 or 2016_deposits = 0;


-- which states had the most growth in deposits?  GA, CA, IL, CO, UT, NJ , NV,TX, FL, AZ. The South and the West
With growth as (Select branch_name, branch_number, city, state, 2010_deposits, 2016_deposits, 2016_deposits - 2010_deposits as $_change, 
round((2016_deposits - 2010_deposits)/2010_deposits*100,2) as `%_change`
From chase_staging
Where main_office = 0
Order by $_change desc, `%_change` desc)

Select state, sum($_change) as $_change, round(avg(`%_change`),2) as `avg_branch_%_change`, count(*) branch_count, 
sum(2010_deposits), sum(2016_deposits)
From growth
Group by state
Order by `avg_branch_%_change` desc;

-- How many branches had a decline in deposits from 2010 to 2016? 109
With decline as (Select branch_name, branch_number, city, state, 2010_deposits, 2016_deposits, 2016_deposits - 2010_deposits as $_change, 
round((2016_deposits - 2010_deposits)/2010_deposits*100,2) as `%_change`
From chase_staging
Where main_office = 0
Order by $_change asc, `%_change` asc)

#Select count(*) as declining_branches
#Select state, count(*) as count
#Select sum(2010_deposits), sum(2016_deposits)
Select *
From decline
Where `%_change` < 0
order by `$_change` asc;

-- Branches declining by state
With decline as (Select branch_name, branch_number, city, state, 2010_deposits, 2016_deposits, 2016_deposits - 2010_deposits as $_change, 
round((2016_deposits - 2010_deposits)/2010_deposits*100,2) as `%_change`
From chase_staging
Where main_office = 0
Order by $_change asc, `%_change` asc)

Select state, sum($_change) as $_change, round(avg(`%_change`),2) as `avg_%`, count(*) as branch_count
From decline
Where `%_change` < 0
Group by state
Order by branch_count desc;

-- What city has the most bank branches
Select city, state, count(*) as branch_count, sum(total_deposits) as $_deposits
from chase_staging
Where main_office = 0
group by city, state
order by branch_count desc, $_deposits;

-- Compare the deposits by year
Select sum(2010_deposits), sum(2011_deposits), sum(2012_deposits), sum(2013_deposits), sum(2014_deposits), sum(2015_deposits), sum(2016_deposits)
From chase_staging
Where main_office = 0;

-- Compare Year-over-Year (YoY) growth over time
Select (sum(2011_deposits)-sum(2010_deposits))/sum(2010_deposits)*100 as "2011 YoY Growth %", 
(sum(2012_deposits)-sum(2011_deposits))/sum(2011_deposits)*100 as "2012 YoY Growth %",
(sum(2013_deposits)-sum(2012_deposits))/sum(2012_deposits)*100 as "2013 YoY Growth %",
(sum(2014_deposits)-sum(2013_deposits))/sum(2013_deposits)*100 as "2014 YoY Growth %",
(sum(2015_deposits)-sum(2014_deposits))/sum(2014_deposits)*100 as "2015 YoY Growth %",
(sum(2016_deposits)-sum(2015_deposits))/sum(2015_deposits)*100 as "2016 YoY Growth %"
From chase_staging
Where main_office = 0;

-- Find CAGR of total deposits
Select (power(sum(2016_deposits)/sum(2010_deposits),1/6)-1)*100 as "CAGR (%)"
From chase_staging
Where main_office = 0;


-- Average deposits per branch by state
Select state, round(avg(total_deposits),0) as average_deposits, sum(total_deposits), count(total_deposits)
From chase_staging
Where main_office = 0
Group by state
Order by average_deposits desc;

-- Average deposits by year
Select sum(total_deposits)/7 as annual_avg
From chase_staging
Where main_office = 0;




Select (Select sum(total_deposits)
From chase_staging
Where state = "NY")/sum(total_deposits)*100 as "new_york_%_of_total"
From chase_staging
where main_office = 0;

Select count(distinct state) 
from chase_staging;

-- Texas Case Study
Select distinct state, city, sum(total_deposits) as total, 
sum(total_deposits)/(select sum(total_deposits) from chase_staging where state = "TX")*100 as "%_state_total"
From chase_staging
Where state = "TX"
Group by state, city
Order by `%_state_total` desc;

With city_average as (Select distinct state, city, sum(total_deposits) as total, 
sum(total_deposits)/(select sum(total_deposits) from chase_staging where state = "TX")*100 as "%_state_total",
avg(total_deposits) as avg_branch_deposits
From chase_staging
Where state = "TX"
Group by state, city
Order by `%_state_total` desc)

Select *, rank() over(Order by avg_branch_deposits desc) as ranking
From city_average
Order by ranking asc

;

-- 
With city_table as (Select distinct state, city,
sum(total_deposits)/(select sum(total_deposits) from chase_staging inside where state = outside.state and main_office = 0)*100 as "%_state_total"
From chase_staging outside
where main_office = 0
Group by state, city
Order by `%_state_total` desc),
city_ranked as (
Select state, city, `%_state_total`, rank() over(partition by state Order by `%_state_total` desc) as ranking
From city_table)

Select *
From city_ranked
Where ranking <= 1
Order by `%_state_total` desc;

-- Lastly, export data and visualize with Tableau dashboard
Select *
From chase_staging
Where main_office = 0
Order by branch_number
Limit 10000;
