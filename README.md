# Chase-Bank-Project
Data Analyst Project analyzing deposit activity across U.S. Chase Bank branches.

# Background and Overview
Chase is the U.S. consumer and commercial banking business of JPMorgan Chase & Co. (NYSE: JPM), a leading global financial services firm with operations worldwide. Chase serves millions of people with a broad range of financial services, including personal banking. Chase is headquartered in New York City.

Utilizing Chase deposit data covering U.S. branches from 2010-2016, this project provides insights and recommendations for Chase's banking business.

Insights and recommendations are for the following key areas:
- Deposit Growth: An analysis of deposit activity trends over the data's timeframe.
- Regional Opportunities: An assessment of Chase's current operations and areas for potential growth.
- Urban Density: An evaluation of major cities and the weight of their impact on state performance.

The Tableau dashboard can be found here.

The SQL queries that clean, prepare, and validate data for the dashboard can be found here.

The SQL queries that explore various metrics and rankings can be found here.


# Data Structure Overview

# Executive Summary
### Overview of Findings
Chase had deposit growth each year from 2010-2016, culminitating in total deposits of $1.1B for 2016 alone. The compound annual growth rate (CAGR) of deposits was 10.6% during this time. This growth is not attributable to branch openings, as the total operating branches in 2010 is nearly identical to the operating branches in 2016. This suggests the positive growth is likely driven by customer growth and increased customer activity at existing branches. The U.S. economy is attributing to deposit growth as well, as since the 2008 financial crisis the U.S. has seen positive GDP growth rates from 2010-2016.

Below is the Chase business overview dashboard, which can be viewed here.

### Deposit Growth Analysis
- The company's total deposits had year-over-year (YoY) increases of 18%, 11%, 10%, 12%, 3%, and 9% from 2011-2016 respectively. The biggest YoY occured in 2011 and YoY percentages remained in double digits for four consecutive years. However, the latest years 2015-2016 show the growth rate cooled off to single-digit percentages, dipping as low as 3% in 2015. This raises concern that the CAGR rate of 10.6% may not be a sustainable forecast if growth continues to trend downward. 
- Comparing branches' 2016 deposits to 2010 deposits, 4,411 out of 4,520 branches (98%) experienced an increase in deposits. Of the 109 branches with declining deposits, 2010 and 2016 deposits totaled $22M and $15M respectively. 17 States had at least one declining branch.
- The company exceeded $1B in annual deposits in 2015 and 2016. The average annual deposits for the timespan 2010-2016 was $0.9B. In 2016, the $1.1B annual deposit ranked Chase as the second largest bank by total deposits, ranking only behind Bank of America ($1.2B) according to FDIC.

### Regional Opportunities
- New York is the number one contributing state by deposits, and by a significant margin. New York accounted for $2.9B deposits from 2010-2016, which represents 47% of the $6.1B total deposits recorded across all states. The next largest state by deposits is Texas with $0.9B. 
- As of 2016, the company is operating in 23 different states. The three most populated states that Chase does not operate in are Pennsylvania, North Carolina, and Virginia, which rank 6th, 9th and 12th respectively according to census.gov estimates for 2016.
- The company has over 500 branches in each of California, New York and Texas. While Florida rivals these states in terms of population according to census.gov, in terms of branch count Florida was lagging with only 214 branches. This low branch count led to Florida accounting for the 9th most total deposits, despite a population ranking 3rd.
  
### Urban Density Evaluation
- Major U.S. cities have a tremendous impact on state performance. The top performing city in 18 out of 23 states had over 25% of its respective state's total deposits, with New York City topping the list with an 85% contribution to its state deposits. When expanding into new states or expanding in states with operations already, the greatest impact will be felt by focusing on the largest city within that state.
- Using Texas as a case study, Houston and Dallas combined for 52% and 22% of Texas' total deposits respectively. The other 127 cities with Chase branches made up the rest of the share, with no other city claiming more than a 3% share. Houston has 120 branches that average $3.7M deposits, while Dallas has 54 branches that average $3.5M. Houston and Dallas have the highest average deposits per branch in the state, nearly tripling the next best average. Texas is an example of how branches take in more deposits in major cities, which is attributable to those cities' denser populations and greater economic output.
# Recommendations
Based on the findings above, the following recommendations are provided:
- As of 2016, Chase is the second largest U.S. bank and has been growing steadily since 2010, although the deposit growth did slow in 2015 and 2016 compared to previous years. In light of slowing growth, Chase should invest heavily into marketing its value and service offerings that come from banking with a large national bank to increase its brand recognition with local residents. Chase could also offer attractive promotions to win over more customers who already do business with competing banks, such as Chase's national competitors Bank of America and Wells Fargo, as well as regional and local banks.
- Operating in 23 states, Chase can look to expand into large states with the biggest populations and major cities. Pennsylvania, North Carolina, and Virginia fit this criteria, with cities such as Philadelphia, Pittsburgh, Charlotte, and the D.C. area as the cities to target. Major cities will often contribute over a quarter of the state's total deposits and branches in major cities are likely to average more deposits than elsewhere in the state. Once a presence is established in a major city, the bank can expand it's presence to the surrounding metro areas.
- Continue to develop more branches in Florida. By population, Florida is a market that could sustain 500 or more branches just as its peers in California, New York and Texas do. Florida has several urban areas and cities to target, such as the Miami-Fort Lauderdale area, Tampa-St. Petersburg area, Orlando and Jacksonville. With expansion and an attractive promotional campaign, Florida is a state ripe for increased deposit activity given its large populace.
#
