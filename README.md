# Gulati_Harshdeep_DA301_Assignment

LSE DA201: fictional project Turtle Games improve overall sales performance by utilising customer trends.

## Assignment 1 insights and summaries:

Significant evidence to suggest relationship between spending and loyalty (p<0.05), CI did not have 0.\
R-Squared tells us relationship between spending and loyalty explains 45.2% of the variance.\
The coefficient value of 33.0617 tells us that as spending_score increases by 1, the predicted value of loyalty_points increases by 33.0617.

Significant evidence to suggest relationship between remuneration and loyalty (p<0.05), CI did not have 0.\
R-Squared tells us relationship between spending and loyalty explains 38.0% of the variance.\
The coefficient value of 33.0617 tells us that as remuneration increases by 1, the predicted value of loyalty_points increases by 34.1878.

Insignificant evidence to suggest relationship between age and loyalty (p>0.05), CI had 0.

*Created Multiple Regression model with spending_score and remuneration using MLR:*\
Significant evidence to suggest relationship between remuneration and loyalty (p<0.05), CI did not have 0.\
R-Squared tells us that the MLR model of multiple regression explains 82.3% of the variance.\
There is insignificant evidence to suggest multicollinearity


## Assignment 2 insights and summaries:

The results of the elbow and silhouette methods suggested a value of *k* between 4 and 6. After testing all three, *k* = 5 yeilded the most distinct and clusters. This suggests that customers can largely be placed in 5 groups depending on their remuneration and and spending score.

Cluster 0 appears to be the largest as it can be seen as the typical (average) customer group that has an average level of spending and remuneration. All other clusters are peripheral groups and have fairly similar though it can be noted that those with a higher remuneration score appear to have a slightly larger number of observations.

Hence, it may be best to focuse mostly on customers that fit within cluster 0 and also those who tend to have a higher remuneration score if the goal is to target the highest numbers of customers.

Exploring further, I would look at if there was a 3rd factor moderating this clustering that could explain it.
