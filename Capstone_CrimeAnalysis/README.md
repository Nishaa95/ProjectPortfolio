# 1222_Group2
Project Group 1 (2022-2023 Winter) - Azim I., Isaac J., Navneet K., Nishaa M.
## Predicting Crime
<ul>Crime prediction is an important aspect of law enforcement that helps to prevent and mitigate the occurrence of criminal activities.

### Data collection 
1. Criminal Occurrences by Neighborhoods dataset is obtained from Edmonton Police Services 
website. 
2. Demographics data and Economic indicators datasets are collected from the City of Edmonton 
open portal. 
3. Weather data is gathered from acis.alberta.ca. 
### Datasets merging 
1. Criminal occurrences dataset is merged with Edmonton neighborhoods for latitude and 
longitude based on Neighborhood names. 
2. Demographics datasets and economic indicators datasets are merged with above merged crime 
datasets based on neighborhood names. 
3. Weather dataset is merged with crime dataset by using month and year as key. 

# [ Data Modelling](regression%20modelling.ipynb)
<ul>Regression models are one of the most commonly used tools for predicting crime.We made 6 models XGBoost, Gradient Boosting ,Random Forest, Extra Tree, SGD Regressor,Linear Regression and  Elastic Net. We evaluated the accuracy of these models by using the R-squared (R2) metric on both training and testing datasets.
<li>R2 measures the proportion of the variance in the dependent variable that is explained by the independent variables in a regression model. It ranges between 0 and 1, with a higher value indicating a better fit of the model to the data.
<li>Our target variable was skewed ,so we chose Transformed Target regressor and compared accuraacies of all 6 models with transformed Target Regressor using same metric R2.
<li> based on accuraccies we chose XGBoost with Transformed Target Regressor, a gradient boosting algorithm that combines multiple weak predictive models to form a stronger one. 
 
# [Data Visualization](CrimeAnalysis_Dashboard.pdf)
 
Power BI is a powerful business intelligence tool that allows you to visualize and analyze data in a user-friendly way. In this project, Power BI was used to visualize crime data, understanding patterns, results of clustering, predictive analysis and gain insights into criminal activities.In this project, several visualizations were created to analyze the crime data.The visualizations created are easy to understand and  can provide actionable insights for law enforcement agencies. 

# Methodology for Statistical Analysis.

* Step1: Start by looking at the Overall Crime Index of Canada
* Step2: Drilldown to view the same index for Alberta, Edmonton and Calgary.
* Step3: Investigate the Violent Crime Severity Index of Alberta, Edmonton and Calgary.
* Step4: Look at the overall violent crime data by neighborhood for Edmonton.
* Step5: Pinpoint the neighborhoods contributing to the high violent crimes in Edmonton.
* Step6: Get demographic information and investigate using KMeans cluster analysis.
* Step7: Report findings.
* Step8: Compare results to Calgary's violent crimes by neighborhood.
* Step9: As per timeframe: Summerize and Conclude.

# Statistical Analysis.

## [Part 1: 2009-2019.](2009-2019.ipynb)

* Analyzing Crime Index for Alberta and its two major cities, Edmonton and Calgary.
* Analyzing Violent Crime Severity Index for Alberta, Edmonton and Calgary.
* Analysis of the above two led us to our Problem Statement.
* As per Stats Canada, Violent Crime consists of Assault, Sexual Assaults, Robbery and Homicide.
* Analyzing Edmonton Crime data between 2009 and 2019.

## [Part 2: 2016.](2016.ipynb)

Although our initial dataset spans a decade from 2009 to 2019 and includes neighborhood crime data, we have chosen to concentrate on 2016 due to the availability of Income data by neighborhood for that year. By examining the demographics of each neighborhood through income data, we aim to gain better understanding of the relationship between socioeconomic status and crime rates. We also recognize that the year 2020 and beyond were impacted by the COVID-19 pandemic and may not be representative of typical crime rates, so we have chosen to limit our analysis to 2019. While we acknowledge that looking at a single year may limit our analysis, we believe that focusing on 2016 will provide valuable insights into the factors that contribute to crime within each neighborhood.

* Analyzing Edmonton Neighborhood Crime data filtered to 2016 to incorporate 2016 Demographic Census data which includes, Education Level, Income Level and Employement Status.
* Cleaned data to remove Industrial Area/neighborhoods that are not included in 2016 Residential Census.
* For this Analysis, we included Property Crimes (Break and Enter, Theft from Vehicle, Theft Of Vehicle, Theft over $5000) with Severe Violent Crimes (Assault, Homicide, Sexual Assaults and Robbery).
* Merged data with Neighborhood Property Assessment Values filtered to 2016.
* Performed Correlation Analysis.
* Performed Kmeans Clustering.
* Analyzed the results by cluster.
* [Statistical Tests](https://github.com/DATA3960/1222_Group2/blob/main/Statistical%20Analysis.ipynb) on Clusters (non parametric test for discrete variables, since all the columns are counts.)
  * Since the variables in the dataframe are counts and the dataframe has a limited number of rows, it may not be appropriate to perform statistical tests between the clusters. This is because the assumptions of normality and independence required for many statistical tests may not hold true for count data. In addition, with a limited number of rows, statistical tests may not have enough power to detect significant differences between the clusters.
* Quick analysis of Calgary Crime and Disorder Statistics without Census Data: filtered to 2016.
* KMeans Clustering of Calgary 2016 data.
* Comparison of Edmonton HOT Crime Cluster with Calgary HOT Crime Cluster.

## [Part 3: Testing Redistribution of columns.](https://github.com/DATA3960/1222_Group2/blob/main/Redistribution%20of%20No%20Response%20Columns-Final.ipynb)

The purpose of this experiment was to test the effect of redistributing the values of the 'Income_No Response' and 'Employment_No Response' columns within their respective categories. The hypothesis was that redistributing these values would not significantly affect the other columns within their groups.

To test this hypothesis, we first identified the columns that belong to the 'Income' and 'Employment' categories. We then calculated the mean of each column in these categories, both before and after redistributing the values of the 'No Response' columns to their corresponding columns within the same category.

The results of the experiment showed that redistributing the values of the 'No Response' columns did not significantly affect the mean values of the other columns within their categories. Therefore, we can conclude that redistributing the values of these columns is was not a viable option to improve the quality of the data. Hence we did not include the No_Response columns in the analysis.

## Summary & Conclusion

In 2016, crimes were reported in all neighborhoods in the City of Edmonton. However, certain neighborhoods such as Downtown, Central McDougall, Boyle Street, Oliver, and Alberta Avenue consistently had the highest number of Violent and Property Crimes. Although we do not have precise information on the exact locations within these neighborhoods where the crimes occurred, a comparison with the City of Calgary showed a similar pattern, with the concentration of crimes occurring within the city center, specifically in Downtown Calgary Commercial Core and the Calgary Beltline. Our KMeans cluster analysis confirmed this for both cities.

However, we must note that 2016 was not the most representative year for our analysis, as there was a sharp decrease in violent crimes for both cities between 2015 and 2016. Additionally, in May 2016, a wildfire began southwest of Fort McMurray, Alberta, which forced upwards of 88,000 people from their homes, making it the largest wildfire evacuation in Alberta's history. On a more positive note, the Rogers Place, a multi-use indoor arena in Edmonton and the new home of the Edmonton Oilers hockey team, was officially opened on September 8, 2016.

Despite the decrease in crime rates, Edmonton still had the highest Crime Severity Index. However, due to time constraints, we were unable to perform a more in-depth analysis of the data. Given additional time, some of the areas we would have liked to explore include the ratio of crimes committed by neighborhood to the total population of that neighborhood, the precise locations and times of crimes, and the role of the municipal government in combating crime. We are particularly interested in examining the impact of different types of municipal government, given that Edmonton has had a more liberal municipal government for decades, while Calgary has historically had a more conservative municipal government up until Mayor Nanshi, who was a centrist. This would allow us to answer the question of whether conservative municipal governments are more effective than liberal ones in fighting crime.

Hence, in addition, given the patterns observed in Edmonton and Calgary, we would have liked to extend our analysis to other Canadian cities to determine if similar trends exist. Specifically, we would have explored the concentration of crimes in the downtown cores of other major Canadian cities, such as Toronto, Vancouver and Montreal, and compared their crime rates to those of Edmonton and Calgary. However, due to time constraints, we were unable to pursue this line of inquiry.
