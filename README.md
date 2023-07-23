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


## Assignment 3 insights and summaries:

The results of this analysis show what the most frequent words are within the reviews and summaries, as their sentiments. The histograms show a generally positive sentiment for both reviews and summaries with reviews especially having a higher frequency of results scoring positively for polarity. Summaries were also positive however a much larger number were neutral in sentiment. The frequency of the most common words combined with the results of sentiment analysis seem to suggest that the games made by Turtle Games are especially appealing to children and make great gifts. However, the negative sentiments suggest that the game has a tendency to be "dissapointing" or "boring" for some players.

However, accuracy for results can vary for word clouds, sentiment analysis and subjectivity. This potential lack of accuracy should be taken into consideration, meaning the results of this analysis are potentially more suited as supplimentary results to support other results from more numerical methods.


## Assignment 4 insights and summaries:
The visualisations show that most games tend to bring between USD 0 and 5 million in sales. NA tends to be a stronger performer than EU in terms of sales. Global sales seems to be a little too smooth of a scatterplot however. 

The boxplots for NA sales seem to show a preference for older consoles like the NES and GB as compared to the EU sales. Both show strong sales for Wii games. Global sales reflect this with Wii, NES, GB, and DS showing especially good sales.

## Assignment 5 insights and summaries:
The Histograms and Boxplots both show a very positively skewed and leptokurtic distribution for all three sales variables. This is reflected within their values for skewness and kurtosis. The Shapiro-Wilk test is <0.05 for all three sales variables showing that they are not normally distributed. After testing the impact of removing outliers, it was found that they did not impact the end result of the analysis nor the outcomes of the aforementioned tests. So, the outliers were left in the dataset.

The correlation shows a strong to very strong positive correlation between the sales variables especially between NA and Global sales. This suggests that NA sales potentially has a greater impact on the outcome of Global sales compared to EU sales. It is reasonable to assume that NA sales are more likely to have an impact on Global sales than the other way around since NA sales is a component of Global sales. EU and NA sales also had positive correlation.

Correlations:

NA - Global: 0.92 \
EU - Global: 0.85 \
EU - NA: 0.62

## Assignment 6 insights and summaries:

Simple Linear Regression Models had the following R-Squared values:\
sum_NA_Sales as predictor: 0.8395\
sum_EU_Sales as predictor: 0.7201\

Slight pattern on residuals for sum_EU_Sales simple linear regression model, but no clear pattern on residuals for sum_NA_Sales model.

Neither of the simple linear regression models seem to be adequate as shown by the line-of-best-fits which are not in line with data points at all.

Multiple Linear Regression Model using both sum of NA and EU sales had adjusted R-Squared value of 0.9664 which is an extremely good fit.

Predictions were then made using the Multiple Linear Regression Model to test accuracy.\
Predicted values vs Observed values shown below:\
68.06 : 67.85\
7.36 : 6.04\
4.91 : 4.32\
4.76 : 3.53\
26.63 : 23.21

The predicted values are relatively close to the observed values.
