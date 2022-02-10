![Ironhack](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab2/Ironhack.jpg)  

# Unit 4 Lab 4 

## Lab Titanic approaches - feature engineering

by [Sergi Alvarez Guasch](https://github.com/SergiGuasch/sergiguasch)  


 1. **My own analysis** Jupyter Notebook - [Link to code folder](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/Lab%20Titanic%20approaches%20-%20feature%20engineering.ipynb)  
 
The database used for this activity it has been the train.csv. Applying an Exploration Data Analysis in the Titanic database, it has been observed that 'sex' is the independent variable with the highest impact on survival rate. However, this idea it doesn't look so much to match with the real life, but it is what the analysis shows. To get that conclusion, it has been used the metodology specified in the jupyter notebook from above. 

The metodology use some features as Feature selection, features extraction/generation and feature engineering. In this sense, it has been applied different methods, as drop_duplicates to eliminate any row duplicate (no duplicates has appeared in this database), as well as the describe and info methods to explore the features of the dataframe. From here we've been realised there are some null values in some columns, as Age, Embarked or Cabin. So, to be able to apply a matrix correlation, we need to deal with this null values filling the numerical values with the median and the categorical with 'unknown'. However, we need to think which columns are going to be usful to do the analysis, this means that the rest of columns we can drop them all. So, bear in mind this, it has been dropped PassengerId, Name, Ticket, Fare, Cabin and Embarked. The reason to do that in each case are the next: 

 - PassengerId: in general, the id columns of each dataframe are not useful to make analysis.
 - Name: it's so specific, so each row it will have a different name and it's not useful as a categorical column to analyze the impact on a survival rate.  
 - Ticket: as it happens in the name, it's so specific and not useful as a categorical column to analyze the impact on a survival rate.    
 - Fare: that column it has been considered as a variable with multicollinearity due to its is highly correlated with Pclass.  
 - Cabin: after check the high number of null values presents in that column it has been considered a useless column for the analysis.  
 - Embarked: it has been considered that to know the location where the passengers embarked is not relevant to analyze the impact on a survival rate.  

Another steps used in the metodology has been, for example, define as an integer the age, using the floor and astype methods. On the other hand, after check the sex variable, it has been decided to encode the column as numerical using an if/else. Finally, taking advantage of that all columns are numerical, it has been assigned to a new variable to permit display some histograms to display if there are any remarkable outlier. Also, checking again the describe method it seems there would be a possible outliers in the SibSp and Parch columns if we compare with the mean, but we don't need to drop them or deal with them cause are not typo, and although they may be unusual, they are perfectly real and possible values that deserve be analysed too. 

Finally, it has been applied the correlation matrix and the subsequent heatmap which it shows, as it describes at the begining of this summarize, that 'sex' is the independent variable observed with the highest impact on survival rate. Also, the PClass is the second highest value on survival rate which looks like to have more sense with the real life during the Titanic lifetime.

![Matrix_Correlation_Heatmap](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/Corr.jpg)

As note, it is noticed that, due to it hasn't been used for this EDA any kind of model supervised (logistic regression, smote, etc.), it has not been necessaru to do the train-test-split, so it hasn't been split the data between the independent and the dependent variable. In case to apply the model, it would be necessary to apply as a target variable the column 'Survived'.  

2. **Review a random samples of 5 notebooks:**  
  
- any feature engineering or feature wrangling methods which you have seen?  

[ramontanoeiro](https://www.kaggle.com/ramontanoeiro/titanic-competition)  

In this project it's converting categorical features into numerical for better analysis.

![Engineering](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/Engineering.jpg)    

- did they impute any missing values? 

[khageshorgiri](https://www.kaggle.com/khageshorgiri/eda-to-classification-titanic-dataset)  

The metodology used in this project, it shows that in case there are any missing entries, they impute them with appropriate values or drop them.  

![NullValues](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/NullValues.jpg)  

- what about scaling methods for numerical variables?  

[masumrumi](https://www.kaggle.com/masumrumi/a-statistical-analysis-ml-workflow-of-titanic)  

In this project it has been used the StandardScaler to feature the scale of his numerical dataset.  

![Scaling](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/Scaling.jpg)    

- what about encoding categorical variables?

[prashanththangavel](https://www.kaggle.com/prashanththangavel/advanced-feature-engineering-feature-encoding)  

In this project the categories in a categorical variable have been converted into binary flags. This type of feature encoding is one hot encoding.  

![Encoding](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/Encoding.jpg)  

- any evidence of overfit or sampling bias ?  

[sisharaneranjana](https://www.kaggle.com/sisharaneranjana/titanic-complete-guide-ml-dl-models)  

In this project it has been used the SMOTE to resample the dataset. This oversampling technique is used for the imbalanced classification.

![Smote](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab4/smote.jpg)  
