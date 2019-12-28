---------------------------------------------------------------------------
----------------------------- Part 1 Scraping -----------------------------
---------------------------------------------------------------------------

File name: Part_1_Scraping_Team_6.ipynb
Approx run time: 3 hours each spliting across 3 systems

1. The input file restaurants_2.xlsx consists of restaurant names and URLs with random 50 Pure-Live and 50 Non-Live Restaurants

Data dictionary:

Restaurant_Name - Name of the restaurant
Restaurant_URL - URL of the restaurant
Dummy_Live - Dummy variable:
1 - Pure-Live music restaurant
0 - Other music restaurant
Hcost - Dummy variable
1 - High cost
0 - Low cost

2. The reviews and ratings of customers are scraped for each restaurant in Yelp and stored in individual CSVs

Final CSV data dictionary:

Name	- Restaurant Name
Rating	- Rating provided by the customer
Review  - Customer review

Note: In case the code needs to be executed, please split the data and run across systems

---------------------------------------------------------------------------
------------------------ Part 2a Sentiment Analysis -----------------------
---------------------------------------------------------------------------

File name: Part_2_Sentiment_Analysis_Data_Preparation_Team_6.ipynb
Approx run time: 5 minutes

1. The provided zip file restaurant_data.zip consists of name, reviews and ratings of 100 restaurants as individual CSVs
2. The file is unzipped and each CSV is merged as a single data frame 
3. Using textblob package, the sentiment is calculated for each review
4. The average sentiment score is calculated and aggregated at restaurant level and stored as a CSV file

---------------------------------------------------------------------------
------------------------- Part 2b Data Preparation ------------------------
---------------------------------------------------------------------------

1. The CSV file containing the average sentiment score is loaded as a data frame
2. The restaurant data and the average sentiment score is merged
3. Average rating and number of reviews are calculated and aggregated at restaurant level
4. The final data is stored as CSV file for performing Linear Regression in R


---------------------------------------------------------------------------
---------------------------- Part 3 Regression ----------------------------
---------------------------------------------------------------------------

File name: Part_3_Regression_Team_6.R
Approx run time: 1 minute

1. The final data is loaded as a data frame in R

Data dictionary:

Restaurant_Name	- Restaurant name
Dummy_Live		- Live or non live restaurant
High_Cost		- High cost or low cost
Avg_Sent_Score	- Average sentiment score at restaurant level
Avg_Rating		- Average rating at restaurant level
Review_count	- Number of reviews for a restaurant


2. The Dummy_Live variable indicates whether the restaurant has only live music or other types of music
3. A simple linear regression is performed considering three models

a. Avg. Rating vs Dummy_Live
b. Avg_Sent_Score vs Dummy_Live
c. Review_count vs Dummy_Live

4. Across all models, the Dummy_Live show a positive impact on average rating, average sentiment score and number of reviews

Final equations:

Avg. Rating = 3.61361 + 0.20552 * (Dummy_Live)
Avg_Sent_Score = 0.224711 + 0.048535 * (Dummy_Live)
Review_count = 217.50 + 271.34 * (Dummy_Live)

A T-test is done on impact of revenue on Live Music bars.
We find that revenue is significant.