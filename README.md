# Ironhack Project - GETAFIX 
## US Data Science hires in 2018

by [Sergi Guasch](https://github.com/SergiGuasch/sergiguasch), [Agustin Carecelen](https://github.com/AgustinCarcelen) and [Lluis Badia](https://github.com/lluis90badia) - February 2021
<br/><br/>

## Analyzing the different job positions related to Data Science most in demand in the United States in 2018.

![GetafixIronhack](https://github.com/SergiGuasch/sergiguasch/blob/main/projects/getafix/GetafixIronhack.jpeg)

### Index
-*Introduction*  
-*Steps and methods applied*  
-*Results and analysis*  
-*Conclusions*  

### Introduction

The next project has been developed from the database provided in the exercise. There were different options to get the information, by one hand it was possible to get the csv showing a combination   which it shows a huge list with five columns showing a diferent positions jobs, the company which is demanding the job position, a decription of the main skills and tools required to get the position, diferent reviews for the company, the location where is offered the job position. In the next image, appears a short abstract about the different columns that provide this dataset:

![2](https://github.com/SergiGuasch/sergiguasch/blob/main/projects/getafix/2.png)

### Steps and methods applied

Next, we list the different steps we've been using from the database til this representation as plots, maps or pie charts:

1. Importing data *pd.read_csv()*
2. Review data *.info() .describe() .shape*
3. Remove Duplicates *.drop_duplicates()*
4. All categorical database changed to lowercase to facilitate the queries *.str.lower()*
5. Deal with nulls *.median() .fillna()*
6. Preparing data / Exporting data *.to_csv()*    
                  - Working in location column  *.str.contains()*  
                  - Working in position column  *.drop()*  
                  - Working in description column  *regex library*    
7. Tableau working with pie/charts, plots and a map (using the column *country* to get longitud/latitude)



### Results and analysis

After join in the dashboard the map and each plot/pie chart we've been going through during all the different analysis , we have obtained the next image:

![Getafix_Dashboard](https://github.com/SergiGuasch/sergiguasch/blob/main/projects/getafix/Getafix_Dashboard.jpg)

As we can see from the dashboard above, we have a map in the center where appears the most representative states showing the number of job positions and the name/code frome the state. Also we have set a color scale from the most number of jobs as darker blue, till the states with less jobs positions related to data science which are painted in a lighter blue.

On the other hand we can see a couple of pie charts that represents, by one hand the percentatge of top job positions and in the other hand the percentatge of the different kinds of degrees are required to get a job related in data science. 

So the left pie, shows mainly that Data Science position is eminently the most required positions to develop the job related, but also, we can see, that Machine learning (considered not just a tool) it is the second main job required. On the third position we can find the Data Analyst, and in the last positions appears the Business Intelligence, and other kinds.

In the right pie it shows how a Master degree is the most demanded degree to get a job related in Data Science, being more than a half of the total degrees. Following by close the Bachelor, it is the second most demanded degree, while PhD and others togetherrepresents less than the 10% of the total degrees.

Following the plots, on the left down side of the dashboard appears the most demanded talents. Here we can see that mainly are experience and analytical talent as the most 
demanded, with around 70% of total. On the other hand, we can see how solutions, knowledge, management and responsabilities, are the remaining 30% and they are more or less equally distributed with the same percentage.

Down in the center it shows the number of jobs positions by city, where it highlight are New York followed by San Francisco. This plot shows how the citys with the highest number of jobs positions are located in the states that appears in the map above as the states with the most number of job positions.

Finally, we can see down on the right a plot with the most demanded skills and tools, being the machine and deep learning the most demanded skill/tool. But we must bear in mind that machine learning is also considered as a job position as itself, so maybe its overestimated. On the other hand, Computing it very relevant as the second most demanded skill followed but skills as BI or Teamwork. With a significant less percentatge we can fin another skills or tools as Programming, Statistical skills, Python, Modelling or language.

### Conclusions

According to our research in the database, we determine that:  
- To got hired, the job positions related to a specific field linked to data science, and the most demanded was Data Scientist with almost 64% followed by Machine Learning and Data Analyst (with almost 7% of the total).
- On the one hand, the positions demanded, by far, are experience and analytical thinking.
- However, on the other hand, machine and deep learning was the top skill demanded even if it is wasn't the top position while, for example, Python wasn't in the top 5.
- On the other hand, the location with the most opportunities, by far it was the state of California followed by New York, where the big tech companies are located. Therefore, New York City and San Francisco are the cities with a greater number of jobs offered.
- And finally, employers demanded candidates with master and Bachelor degrees as the most important requirements for its application.

**Tools**

 - *Visualitzations:* Tableau
 - *Code:* Jupyter Notebook - [Link to code folder](https://github.com/SergiGuasch/sergiguasch/blob/main/projects/getafix/Getafix_Presentation.ipynb)
