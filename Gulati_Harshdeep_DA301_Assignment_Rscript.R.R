## LSE Data Analytics Online Career Accelerator 

# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment template

## Scenario
## You are a data analyst working for Turtle Games, a game manufacturer and 
## retailer. They manufacture and sell their own products, along with sourcing
## and selling products manufactured by other companies. Their product range 
## includes books, board games, video games and toys. They have a global 
## customer base and have a business objective of improving overall sales 
##performance by utilising customer trends. 

## In particular, Turtle Games wants to understand:
## - how customers accumulate loyalty points (Week 1)
## - how useful are remuneration and spending scores data (Week 2)
## - can social data (e.g. customer reviews) be used in marketing 
##     campaigns (Week 3)
## - what is the impact on sales per product (Week 4)
## - the reliability of the data (e.g. normal distribution, Skewness, Kurtosis)
##     (Week 5)
## - if there is any possible relationship(s) in sales between North America,
##     Europe, and global sales (Week 6).

################################################################################

# Week 4 assignment: EDA using R

## The sales department of Turtle games prefers R to Python. As you can perform
## data analysis in R, you will explore and prepare the data set for analysis by
## utilising basic statistics and plots. Note that you will use this data set 
## in future modules as well and it is, therefore, strongly encouraged to first
## clean the data as per provided guidelines and then save a copy of the clean 
## data for future use.

# Instructions
# 1. Load and explore the data.
##  - Remove redundant columns (Ranking, Year, Genre, Publisher) by creating 
##      a subset of the data frame.
##  - Create a summary of the new data frame.
# 2. Create plots to review and determine insights into data set.
##  - Create scatterplots, histograms and boxplots to gain insights into
##      the Sales data.
##  - Note your observations and diagrams that could be used to provide
##      insights to the business.
# 3. Include your insights and observations.

###############################################################################

# 1. Load and explore the data

# Install and import Tidyverse.
library('tidyverse')

# Import the data set.
turtle_sales <- read.csv(file.choose(), header=T)

# Print the data frame.
print(turtle_sales)

# Create a new data frame from a subset of the sales data frame.
# Remove unnecessary columns. 
turtle_sales2 <- dplyr::select(turtle_sales, -Ranking, -Year, -Genre, 
                               -Publisher)

# View the data frame.
view(turtle_sales2)

# View the descriptive statistics.
summary(turtle_sales2)

################################################################################

# 2. Review plots to determine insights into the data set.

## 2a) Scatterplots
# Create scatterplots.
# Scatterplot for NA_Sales.
qplot(y=NA_Sales, data=turtle_sales2)

# Scatterplot for EU_Sales.
qplot(y=EU_Sales, data=turtle_sales2)

# Scatterplot for Global_Sales.
qplot(y=Global_Sales, data=turtle_sales2)

## 2b) Histograms
# Create histograms.
# Histogram for NA_Sales.
qplot(NA_Sales, data=turtle_sales2)

# Histogram for EU_Sales.
qplot(EU_Sales, data=turtle_sales2)

# Histogram for Global_Sales.
qplot(Global_Sales, data=turtle_sales2)


## 2c) Boxplots
# Create boxplots.
# Boxplot for NA_Sales.
qplot(NA_Sales, Platform, data=turtle_sales2, geom='boxplot')

# Boxplot for EU_Sales.
qplot(EU_Sales, Platform, data=turtle_sales2, geom='boxplot')

# Boxplot for Global_Sales.
qplot(Global_Sales, Platform, data=turtle_sales2, geom='boxplot')

###############################################################################

# 3. Observations and insights

## Your observations and insights here ......
## The visualisations show that most games tend to bring between USD 0 and
## 5 million in sales. NA tends to be a stronger performer than EU in terms of
## sales. Global sales seems to be a little too smooth of a scatterplot however.
## The boxplots for NA sales seem to show a preference for older consoles like
## the NES and GB as compared to the EU sales. Both show strong sales for Wii
## games. Global sales reflect this with Wii, NES, GB, and DS showing especially
## good sales.



###############################################################################
###############################################################################


# Week 5 assignment: Cleaning and maniulating data using R

## Utilising R, you will explore, prepare and explain the normality of the data
## set based on plots, Skewness, Kurtosis, and a Shapiro-Wilk test. Note that
## you will use this data set in future modules as well and it is, therefore, 
## strongly encouraged to first clean the data as per provided guidelines and 
## then save a copy of the clean data for future use.

## Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 4 assignment. 
##  - View the data frame to sense-check the data set.
##  - Determine the `min`, `max` and `mean` values of all the sales data.
##  - Create a summary of the data frame.
# 2. Determine the impact on sales per product_id.
##  - Use the group_by and aggregate functions to sum the values grouped by
##      product.
##  - Create a summary of the new data frame.
# 3. Create plots to review and determine insights into the data set.
##  - Create scatterplots, histograms, and boxplots to gain insights into 
##     the Sales data.
##  - Note your observations and diagrams that could be used to provide 
##     insights to the business.
# 4. Determine the normality of the data set.
##  - Create and explore Q-Q plots for all sales data.
##  - Perform a Shapiro-Wilk test on all the sales data.
##  - Determine the Skewness and Kurtosis of all the sales data.
##  - Determine if there is any correlation between the sales data columns.
# 5. Create plots to gain insights into the sales data.
##  - Compare all the sales data (columns) for any correlation(s).
##  - Add a trend line to the plots for ease of interpretation.
# 6. Include your insights and observations.

################################################################################

# 1. Load and explore the data

# View data frame created in Week 4.
view(turtle_sales2)

# Check output: Determine the min, max, and mean values.
min(turtle_sales2$NA_Sales)
min(turtle_sales2$EU_Sales)
min(turtle_sales2$Global_Sales)

max(turtle_sales2$NA_Sales)
max(turtle_sales2$EU_Sales)
max(turtle_sales2$Global_Sales)

mean(turtle_sales2$NA_Sales)
mean(turtle_sales2$EU_Sales)
mean(turtle_sales2$Global_Sales)

# View the descriptive statistics.
summary(turtle_sales2)

###############################################################################

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
df_sales <- turtle_sales2 %>% group_by(Product) %>%
  summarise(sum_NA_Sales=round(sum(NA_Sales),2),
            sum_EU_Sales=round(sum(EU_Sales),2),
            sum_Global_Sales=round(sum(Global_Sales),2),
            .groups='drop')

#View the results.
df_sales

# View the data frame.
view(df_sales)

# Explore the data frame.
summary(df_sales)


## 2b) Determine which plot is the best to compare game sales.
# Create scatterplots.
# Scatterplot for NA_Sales.
qplot(Product, sum_NA_Sales, data=df_sales)

# Scatterplot for EU_Sales.
qplot(Product, sum_EU_Sales, data=df_sales)

# Scatterplot for Global_Sales.
qplot(Product, sum_Global_Sales, data=df_sales)



# Create histograms.
# Histogram for NA_Sales.
qplot(sum_NA_Sales, data=df_sales)

# Histogram for EU_Sales.
qplot(sum_EU_Sales, data=df_sales)

# Histogram for Global_Sales.
qplot(sum_Global_Sales, data=df_sales)


# Create boxplots.
# Boxplot for NA_Sales.
qplot(Product, sum_NA_Sales, data=df_sales, geom='boxplot')

# Boxplot for EU_Sales.
qplot(Product, sum_EU_Sales, data=df_sales, geom='boxplot')

# Boxplot for Global_Sales.
qplot(Product, sum_Global_Sales, data=df_sales, geom='boxplot')



###############################################################################


# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots
# Create Q-Q Plots.
# Q-Q Plot for NA_Sales.
qqnorm(df_sales$sum_NA_Sales)
qqline(df_sales$sum_NA_Sales)

# Q-Q Plot for EU_Sales.
qqnorm(df_sales$sum_EU_Sales)
qqline(df_sales$sum_EU_Sales)

# Q-Q Plot for Global_Sales.
qqnorm(df_sales$sum_Global_Sales)
qqline(df_sales$sum_Global_Sales)


## 3b) Perform Shapiro-Wilk test
# Install and import Moments.
library(moments)

# Perform Shapiro-Wilk test.
# Shapiro-Wilk test for NA_Sales.
shapiro.test((df_sales$sum_NA_Sales))
# p-value is <0.05,so the data is not normally distributed.

# Shapiro-Wilk test for EU_Sales
shapiro.test((df_sales$sum_EU_Sales))
# p-value is <0.05,so the data is not normally distributed.

# Shapiro-Wilk test for Global_Sales.
shapiro.test((df_sales$sum_Global_Sales))
# p-value is <0.05,so the data is not normally distributed.


## 3c) Determine Skewness and Kurtosis
# Skewness and Kurtosis.
# Skewness for NA_Sales.
skewness(df_sales$sum_NA_Sales)
# Output suggests a positive skewness.
# Kurtosis for NA_Sales
kurtosis(df_sales$sum_NA_Sales)
# Kurtosis value is more than 3, suggesting our data is leptokurtic.

# Skewness for EU_Sales.
skewness(df_sales$sum_EU_Sales)
# Output suggests a positive skewness.
# Kurtosis for EU_Sales
kurtosis(df_sales$sum_EU_Sales)
# Kurtosis value is more than 3, suggesting our data is leptokurtic.

# Skewness for Global_Sales.
skewness(df_sales$sum_Global_Sales)
# Output suggests a positive skewness.
# Kurtosis for Global_Sales
kurtosis(df_sales$sum_Global_Sales)
# Kurtosis value is more than 3, suggesting our data is leptokurtic.

## 3d) Determine correlation
# Determine correlation.
round (cor(df_sales),
       digits=2)
##############################################################

# EXTRA: Remove Outliers
Q_NA <- quantile(df_sales$sum_NA_Sales, probs=c(.25, .75), na.rm = FALSE)
iqr_NA <- IQR(df_sales$sum_NA_Sales)

Q_NA[2]+1.5*iqr_NA # Upper Range.  
Q_NA[1]-1.5*iqr_NA # Lower Range.


Q_EU <- quantile(df_sales$sum_EU_Sales, probs=c(.25, .75), na.rm = FALSE)
iqr_EU <- IQR(df_sales$sum_EU_Sales)

Q_EU[2]+1.5*iqr_EU # Upper Range.  
Q_EU[1]-1.5*iqr_EU # Lower Range.


Q_Global <- quantile(df_sales$sum_Global_Sales, probs=c(.25, .75), 
                     na.rm = FALSE)
iqr_Global <- IQR(df_sales$sum_Global_Sales)

Q_Global[2]+1.5*iqr_Global # Upper Range.  
Q_Global[1]-1.5*iqr_Global # Lower Range.

filt_df_sales <- filter(df_sales, sum_NA_Sales<10.1825
                        | sum_EU_Sales<7.8725
                        | sum_Global_Sales<23.69)

# Create boxplots.
# Boxplot for NA_Sales.
qplot(Product, sum_NA_Sales, data=filt_df_sales, geom='boxplot')

# Boxplot for EU_Sales.
qplot(Product, sum_EU_Sales, data=filt_df_sales, geom='boxplot')

# Boxplot for Global_Sales.
qplot(Product, sum_Global_Sales, data=filt_df_sales, geom='boxplot')

# Create Q-Q Plots.
# Q-Q Plot for NA_Sales.
qqnorm(filt_df_sales$sum_NA_Sales)
qqline(filt_df_sales$sum_NA_Sales)

# Q-Q Plot for EU_Sales.
qqnorm(filt_df_sales$sum_EU_Sales)
qqline(filt_df_sales$sum_EU_Sales)

# Q-Q Plot for Global_Sales.
qqnorm(filt_df_sales$sum_Global_Sales)
qqline(filt_df_sales$sum_Global_Sales)


# Perform Shapiro-Wilk test.
# Shapiro-Wilk test for NA_Sales.
shapiro.test((filt_df_sales$sum_NA_Sales))
# p-value is <0.05,so the data is not normally distributed.

# Shapiro-Wilk test for EU_Sales
shapiro.test((filt_df_sales$sum_EU_Sales))
# p-value is <0.05,so the data is not normally distributed.

# Shapiro-Wilk test for Global_Sales.
shapiro.test((filt_df_sales$sum_Global_Sales))
# p-value is <0.05,so the data is not normally distributed.


# Skewness and Kurtosis.
# Skewness for NA_Sales.
skewness(filt_df_sales$sum_NA_Sales)
# Output suggests a positive skewness.
# Kurtosis for NA_Sales
kurtosis(filt_df_sales$sum_NA_Sales)
# Kurtosis value is more than 3, suggesting our data is leptokurtic.

# Skewness for EU_Sales.
skewness(filt_df_sales$sum_EU_Sales)
# Output suggests a positive skewness.
# Kurtosis for EU_Sales
kurtosis(filt_df_sales$sum_EU_Sales)
# Kurtosis value is more than 3, suggesting our data is leptokurtic.

# Skewness for Global_Sales.
skewness(filt_df_sales$sum_Global_Sales)
# Output suggests a positive skewness.
# Kurtosis for Global_Sales
kurtosis(filt_df_sales$sum_Global_Sales)
# Kurtosis value is more than 3, suggesting our data is leptokurtic.


# Determine correlation.
round (cor(filt_df_sales),
       digits=2)

###############################################################################

# 4. Plot the data
# Create plots to gain insights into data.
# Choose the type of plot you think best suits the data set and what you want 
# to investigate. Explain your answer in your report.

# Scatterplot to indicate relation between sales in NA and globally
ggplot(data = df_sales,
       mapping = aes(x = sum_NA_Sales, y = sum_Global_Sales,)) +  
  
  # Remove the colour argument.
  geom_point(alpha = 0.5, size = 1.5) +  
  
  #Add lines of best fit, remove the confidence intervals,
  # and set the size.
  geom_smooth(method = 'lm',
              se = FALSE,
              size = 1.0) +
  
# Add labels for axis, title and caption.
labs(y = "Sum of Global Sales",
     x = "Sum of NA Sales",
     title = "Correlation Between Sales Globally and in NA",
     caption = "Source: Turtle Games") 


# Scatterplot to indicate relation between sales in NA and globally
ggplot(data = df_sales,
       mapping = aes(x = sum_EU_Sales, y = sum_Global_Sales,)) +  
  
  # Remove the colour argument.
  geom_point(alpha = 0.5, size = 1.5) +  
  
  #Add lines of best fit, remove the confidence intervals,
  # and set the size.
  geom_smooth(method = 'lm',
              se = FALSE,
              size = 1.0) +
  
  # Add labels for axis, title and caption.
  labs(y = "Sum of Global Sales",
       x = "Sum of EU Sales",
       title = "Correlation Between Sales Globally and in the EU",
       caption = "Source: Turtle Games") 



# Scatterplot to indicate relation between sales in NA and globally
ggplot(data = df_sales,
       mapping = aes(x = sum_NA_Sales, y = sum_EU_Sales,)) +  
  
  # Remove the colour argument.
  geom_point(alpha = 0.5, size = 1.5) +  
  
  #Add lines of best fit, remove the confidence intervals,
  # and set the size.
  geom_smooth(method = 'lm',
              se = FALSE,
              size = 1.0) +
  
  # Add labels for axis, title and caption.
  labs(y = "Sum of Global Sales",
       x = "Sum of NA Sales",
       title = "Correlation Between Sales in the EU and in NA",
       caption = "Source: Turtle Games") 

###############################################################################

# 5. Observations and insights
# Your observations and insights here...
##The Histograms and Boxplots both show a very positively skewed and leptokurtic
##distribution for all three sales variables. This is reflected within their
##values for skewness and kurtosis. The Shapiro-Wilk test is <0.05 for all three
##sales variables showing that they are not normally distributed. After testing
##The impact of removing outliers, it was found that they did not impact the end
##result of the analysis nor the outcomes of the aforementioned tests. So, the
##outliers were left in the dataset.

##The correlation shows a strong to very strong positive correlation between
##the sales variables especially between NA and Global sales. This suggests
##that NA sales potentially has a greater impact on the outcome of Global sales
##compared to EU sales. It is reasonable to assume that NA sales are more likely
## to have an impact on Global sales than the other way around since NA sales is
##a component of Global sales.EU and NA sales also had positive correlation.

##Correlations:

##NA - Global: 0.92 
##EU - Global: 0.85 
##EU - NA: 0.62

###############################################################################
###############################################################################

# Week 6 assignment: Making recommendations to the business using R

## The sales department wants to better understand if there is any relationship
## between North America, Europe, and global sales. Therefore, you need to
## investigate any possible relationship(s) in the sales data by creating a 
## simple and multiple linear regression model. Based on the models and your
## previous analysis (Weeks 1-5), you will then provide recommendations to 
## Turtle Games based on:
##   - Do you have confidence in the models based on goodness of fit and
##        accuracy of predictions?
##   - What would your suggestions and recommendations be to the business?
##   - If needed, how would you improve the model(s)?
##   - Explain your answers.

# Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 5 assignment. 
# 2. Create a simple linear regression model.
##  - Determine the correlation between the sales columns.
##  - View the output.
##  - Create plots to view the linear regression.
# 3. Create a multiple linear regression model
##  - Select only the numeric columns.
##  - Determine the correlation between the sales columns.
##  - View the output.
# 4. Predict global sales based on provided values. Compare your prediction to
#      the observed value(s).
##  - NA_Sales_sum of 34.02 and EU_Sales_sum of 23.80.
##  - NA_Sales_sum of 3.93 and EU_Sales_sum of 1.56.
##  - NA_Sales_sum of 2.73 and EU_Sales_sum of 0.65.
##  - NA_Sales_sum of 2.26 and EU_Sales_sum of 0.97.
##  - NA_Sales_sum of 22.08 and EU_Sales_sum of 0.52.
# 5. Include your insights and observations.

###############################################################################

# 1. Load and explore the data
# View data frame created in Week 5.
view(df_sales)

# Determine a summary of the data frame.
summary(df_sales)

###############################################################################

# 2. Create a simple linear regression model
# Create a simple linear regression model for sum_NA_Sales
## 2a) Determine the correlation between columns
cor(df_sales)

# Import the psych package.
library(psych)

# Visualise the correlations
corPlot(df_sales, cex=2)

# Create a linear regression model on the original data.
df_sales_lm_NAG <- lm(sum_Global_Sales~sum_NA_Sales,data=df_sales)

# View more outputs for the model - the full regression table.
summary(df_sales_lm_NAG)

# R-Squared value of 0.8395, very good fit.

# Check Residuals.
plot(df_sales_lm_NAG$residuals)

# No visible pattern of residuals, good sign.

## 2b) Create a plot (simple linear regression)
# Basic visualisation.
plot(df_sales$sum_Global_Sales, df_sales$sum_NA_Sales)
coefficients(df_sales_lm_NAG)

# Add line-of-best-fit.
abline(coefficients(df_sales_lm_NAG))


# Create a simple linear regression model for sum_EU_Sales
# Create a linear regression model on the original data.
df_sales_lm_EUG <- lm(sum_Global_Sales~sum_EU_Sales,data=df_sales)

# View more outputs for the model - the full regression table.
summary(df_sales_lm_EUG)

# R-Squared value of 0.7201, good fit.

# Check Residuals.
plot(df_sales_lm_EUG$residuals)

# Slight downwards trend on residuals but does not seem significant.

## 2b) Create a plot (simple linear regression)
# Basic visualisation.
plot(df_sales$sum_Global_Sales, df_sales$sum_NA_Sales)
coefficients(df_sales_lm_EUG)

# Add line-of-best-fit.
abline(coefficients(df_sales_lm_EUG))

# Neither of the simple linear regression models seem to be adequate
# as shown by the line-of-best-fits which are not in line with datapoints
# at all.
###############################################################################

# 3. Create a multiple linear regression model
# Visualise the correlations
corPlot(df_sales, cex=2)

# Select only numeric columns from the original data frame.
df_sales_mlrm = lm(sum_Global_Sales~sum_NA_Sales+sum_EU_Sales, data=df_sales)

# Print the summary statistics.
summary(df_sales_mlrm)

# Adjusted R-squared value of 0.9664, extremely good fit.

###############################################################################

# 4. Predictions based on given values
# Compare with observed values for a number of records.
# Create and load new csv with test values.
turtle_test <- read.csv(file.choose(), header=TRUE)

# View the data to see observed values.
str(turtle_test)

# Create a new object and specify the predict function.
turtle_pred_test = predict(df_sales_mlrm, newdata=turtle_test,
                      interval='confidence')

# Print the object.
turtle_pred_test

# Predicted values vs Observed values:
# 68.06 : 67.85
# 7.36 : 6.04
# 4.91 : 4.32
# 4.76 : 3.53
# 26.63 : 23.21
###############################################################################

# 5. Observations and insights
# Your observations and insights here...

## Simple Linear Regression Models had the following R-Squared values:
## sum_NA_Sales as predictor: 0.8395
## sum_EU_Sales as predictor: 0.7201
## Slight pattern on residuals for sum_EU_Sales simple linear regression model,
## but no clear pattern on residuals for sum_NA_Sales model.

## Neither of the simple linear regression models seem to be adequate
## as shown by the line-of-best-fits which are not in line with data points
## at all.

## Multiple Linear Regression Model using both sum of NA and EU sales had
## adjusted R-Squared value of 0.9664 which is an extremely good fit.

## Predictions were then made using the Multiple Linear Regression Model to test
## accuracy.
## Predicted values vs Observed values shown below:
## 68.06 : 67.85
## 7.36 : 6.04
## 4.91 : 4.32
## 4.76 : 3.53
## 26.63 : 23.21

## The predicted values are relatively close to the observed values.

###############################################################################
###############################################################################




