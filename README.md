# Chase Bank Deposits
# Background and Overview
Chase is the U.S. consumer and commercial banking business of JPMorgan Chase & Co. (NYSE: JPM), a leading global financial services firm with operations worldwide. Chase serves millions of people with a broad range of financial services, including personal banking. Chase is headquartered in New York City.

Utilizing Chase deposit data covering U.S. branches from 2010-2016, this project provides insights and recommendations for Chase's banking business.

Insights and recommendations are for the following key areas:
- Deposit Growth: An analysis of deposit activity trends over the data's timeframe.
- Regional Opportunities: An assessment of Chase's current operational presence and areas for potential expansion.
- Urban Density: An evaluation of the impact major cities have on deposit performance.

The Tableau dashboard can be found [here](https://public.tableau.com/app/profile/jb.gauch/viz/chase_branches_visualization/ChaseDashboard).

The SQL queries that clean, prepare, and validate data for the dashboard can be found [here](https://github.com/JBG-hub/Chase-Bank-Project/blob/main/chase_branches_data_cleaning.sql).

The SQL queries that explore various metrics and rankings can be found [here](https://github.com/JBG-hub/Chase-Bank-Project/blob/main/chase_branches_exploration.sql).


# Source Data & Data Structure Overview
The source data was compiled from Federal Deposit Insurance Corporation's annual Summary of Deposits reports and from scraping Chase Bank's website[^1]. 
[^1]: Original source data and acknowledgements: https://www.kaggle.com/datasets/chasebank/bank-deposits.

Data cleaning procedures were used to prepare the source data for further analysis. The cleaned data consisted of one table with 4,520 rows and the following columns:

<img width="227" height="355" alt="table columns" src="https://github.com/user-attachments/assets/a887d277-ebd8-41b7-8d41-de71e9a135c4" />

The data cleaning SQL queries can be found [here](https://github.com/JBG-hub/Chase-Bank-Project/blob/main/chase_branches_data_cleaning.sql). 

# Executive Summary
### Overview of Findings
Chase had deposit growth each year from 2010-2016, culminitating in total deposits of $1.1B for 2016 alone. The compound annual growth rate (CAGR) of deposits was 10.6% during this time. 

<img width="366" height="256" alt="image" src="https://github.com/user-attachments/assets/1fc14921-ea5c-4ee9-95bd-9f0c85799de4" />

This growth is not attributable to branch openings, as the total operating branches in 2010 is nearly identical to the operating branches in 2016. This suggests the positive growth is likely driven by customer growth and increased customer activity at existing branches. The U.S. economy saw positive macroeconomic indicators during this timeframe which could be attributing to deposit growth as well. Coming out of the 2008 financial crisis the U.S. has seen positive GDP growth rates from 2010-2016[^2]:
Year | U.S. GDP Growth Rate
--- | :---:
2010 | 2.7%
2011 | 1.56%
2012 | 2.29%
2013 | 2.12%
2014 | 2.52%
2015 | 2.95%
2016 | 1.82%

[^2]: U.S. GDP Growth rates found at macrotrends.net: https://www.macrotrends.net/global-metrics/countries/usa/united-states/gdp-growth-rate.

To see the Chase business overview dashboard, click [here](https://public.tableau.com/app/profile/jb.gauch/viz/chase_branches_visualization/ChaseDashboard).

### Deposit Growth Analysis
- The company's total deposits had year-over-year (YoY) increases of 18%, 11%, 10%, 12%, 3%, and 9% from 2011-2016 respectively. The biggest YoY occured in 2011 and YoY percentages remained in double digits for four consecutive years. However, the latest years 2015-2016 show the growth rate cooled off to single-digit percentages, dipping as low as 3% in 2015. This raises concern that the CAGR rate of 10.6% may not be a sustainable forecast if growth continues to trend downward.
- Comparing branches' 2010 deposits to 2016 deposits, 4,411 out of 4,520 branches (98%) experienced an increase in deposits. Of the 109 branches with declining deposits, 2010 and 2016 deposits totaled $22M and $15M respectively. 17 States had at least one declining branch.
- The company exceeded $1B in annual deposits in 2015 and 2016. The average annual deposits for the timespan 2010-2016 was $0.9B. In 2016, the $1.1B annual deposit ranked Chase as the second largest bank by total deposits, ranking only behind Bank of America ($1.2B) according to FDIC.

<img width="560" height="48" alt="image" src="https://github.com/user-attachments/assets/a44514a2-9f5e-4faa-a4b0-7cbf526759db" />

### Regional Opportunities
- New York is the number one contributing state by deposits, and by a significant margin. New York accounted for $2.9B deposits from 2010-2016, which represents 47% of the $6.1B total deposits recorded across all states. The next largest state by deposits is Texas with $0.9B. 
- As of 2016, the company is operating in 23 different states. The three most populated states that Chase does not operate in are Pennsylvania, North Carolina, and Virginia, which rank 6th, 9th and 12th respectively according to census.gov estimates for 2016[^3].
- The company has over 500 branches in each of California, New York and Texas. While Florida rivals these states in terms of population according to census.gov, in terms of branch count Florida was lagging with only 214 branches. This low branch count led to Florida accounting for the 9th most total deposits, despite a population ranking 3rd.

<img width="432" height="195" alt="image" src="https://github.com/user-attachments/assets/e7a05a19-88be-4e64-9e12-2424f360a134" />

[^3]: State populations were taken from census.gov: https://www2.census.gov/programs-surveys/popest/tables/2010-2019/state/totals/nst-est2019-01.xlsx
  
### Urban Density Evaluation
- Major U.S. cities have a tremendous impact on state performance. The top performing city in 18 out of 23 states had over 25% of its respective state's total deposits, with New York City topping the list with an 85% contribution to its state deposits. 
- Using Texas as a case study, Houston and Dallas combined for 52% and 22% of Texas' total deposits respectively. The other 127 cities with Chase branches made up the rest of the share, with no other city claiming more than a 3% share. Houston has 120 branches that average $3.7M deposits, while Dallas has 54 branches that average $3.5M, which are the highest averages in the state. Texas is an example of how branches take in more deposits in major cities, both on average and in total, which is attributable to those cities' denser populations and concentration of businesses.

<img width="442" height="298" alt="image" src="https://github.com/user-attachments/assets/9a0b9028-9b1d-4839-9681-1e5180f5351c" />

# Recommendations
Based on the findings above, the following recommendations are provided:
- As of 2016, Chase is the second largest U.S. bank and has been growing steadily since 2010, although the deposit growth did slow in 2015 and 2016 compared to previous years. In light of slowing growth, Chase should invest heavily into marketing its value and service offerings that come from banking with a large national bank to increase its brand recognition with local residents. Chase could also offer attractive promotions to win over more customers who already do business with competing banks, such as Chase's national competitors Bank of America and Wells Fargo, as well as regional and local banks.
- Operating in 23 states, Chase can look to expand into large states with the biggest populations and major cities. Pennsylvania, North Carolina, and Virginia fit this criteria, with cities such as Philadelphia, Pittsburgh, Charlotte, and the D.C. area as the cities to target. Major cities will often contribute over a quarter of the state's total deposits and branches in major cities are likely to average more deposits than elsewhere in the state. Major cities can simply sustain more branches than rural towns, and once the bank has fully developed it's presence in the city, the bank can consider expansion into other areas of the state.
- Continue to develop more branches in Florida. By population, Florida is a market that could sustain 500 or more branches just as its peers in California, New York and Texas do. Florida has several urban areas and cities to target, such as the Miami-Fort Lauderdale area, Tampa-St. Petersburg area, Orlando and Jacksonville. With expansion and an attractive promotional campaign, Florida is a state ripe for increased deposit activity given its large populace.
#
