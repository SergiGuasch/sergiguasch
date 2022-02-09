![Ironhack](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab2/Ironhack.jpg)  

# Unit 4 Lab 2 

## Imbalanced data

by [Sergi Alvarez Guasch](https://github.com/SergiGuasch/sergiguasch)

## Classification in order to predict the customer churn from a given dataframe.


### Metodology
1. *Load the dataset and explore the variables*    
2. *Select the variables tenure, SeniorCitizen, MonthlyCharges to predict the target variable Churn using a logistic regression*    
3. *Extract the target variable*   
4. *Extract the independent variables and scale*    
5. *Build the logistic regression model*    
6. *Evaluate the model*    
7. *Why in this dataset a simple model will give us more than 70% accuracy?*    
8. *Synthetic Minority Oversampling TEchnique (SMOTE)*    
9. *Tomek links*    


### 1. Load the dataset and explore the variables 
The first step it was to import the different libraries we are going to use to apply a logistic regression model. Then we can load to jupyter notebook as a dataframe with the next sintax: df=pd.read_csv('customer_churn.csv')  
 
That's the result once imported:  

![1](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab2/Images/Load.jpg) 

Also, in this step it's the time to get more information about data with describe() and info() methods.

### 2. Select the variables tenure, SeniorCitizen, MonthlyCharges to predict the target variable Churn using a logistic regression
Here it has been used the .loc[] method to select the diferent variables required to analyse with the logistic regression model, so in that case it has been needed 'tenure','SeniorCitizen','MonthlyCharges' and the target variable 'Churn'.  
![2](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab2/Images/Select.jpg)

### 3. Extract the target variable
Next it has used to determine the dependent target variable (y), using the next sintaxis: y=df['Churn']

### 4. Extract the independent variables and scale  
Following the metodology, it has been extracted the different independent variables (x). For this purpose it has been used the next steps:  

- X=df.drop('Churn',axis=1) -- *here it's necessary to drop the dependent variable from the dataframe, in order to assign just the independent variables to x.*   
- X_num=X.select_dtypes(include=np.number) -- *here we use the columns from the df which are numerical and we asigned to the variable X_num.*  
- scaler= RobustScaler() -- *we asign the method to scale 'RobustScaler' to the variable scaler.*  
- scaler.fit(X_num) -- *the fit method permits using scaler to scale over the variable X_num.*  
- X_full= pd.DataFrame(scaler.transform(X_num),columns=X_num.columns) -- *finally we can asign to a new variable, the dataframe with the scaled variable X_num using the transform method.*  

### 5. Build the logistic regression model  
To build the logistic model it has been used the next equation:   

X_train,X_test,y_train,y_test=train_test_split(X_full,y,test_size=0.45,random_state=40)

X_full and y are the independent and dependent variables respectively, which are the variable obtained in the last steps. Also, in the equation it has been assigned a random_state of 40 and a test_size of =.45, which are the standard values used to do the logistic regression model.  

### 6. Evaluate the model  


**Tools**
 - *Code:* Jupyter Notebook - [Link to code folder](https://github.com/SergiGuasch/sergiguasch/blob/main/labs/week4/Lab2/Lab%20Imbalanced%20data.ipynb)
