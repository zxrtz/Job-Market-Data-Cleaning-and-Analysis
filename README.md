# Job-Market-ETL-and-Analysis
Utilizing MySQL, extract, transfer, and load (ETL) job market data to cleanse and standardize data for analysis. Analysis of job market to measure layoff data against company performance.


First, I transformed cleaned job market layoff data to remove duplicates, remove blank and irrelevant data, and modified fields to prepare for analysis. 
This is in the file named data_cleaning.sql.

The Exploratory Data Analysis that I have done includes CTEs, Window Functions, Aggregate Functions, etc.
This is compiled in the file named EDA.sql

Below you can see the companies in the top 5 for the number layoffs per year.

![image](https://github.com/user-attachments/assets/a355e78e-d393-483d-bf40-1ecaed3e12dc)


Next, the screenshot below shows the top 5 companies in each industry based on number of layoffs. You can see that the more funding a company has, the more layoffs they usually have.

![image](https://github.com/user-attachments/assets/d4dd708d-c87c-4f1e-a482-967c22fc8844)
