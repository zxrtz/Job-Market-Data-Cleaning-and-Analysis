# Job Market Cleaning and EDA
Utilizing MySQL, cleanse and standardize job market data for analysis. Analysis of job market to measure layoff data against company performance.


First, I transformed cleaned job market layoff data to remove duplicates, remove blank and irrelevant data, and modified fields to prepare for analysis. 
This is in the file named data_cleaning.sql.

The Exploratory Data Analysis that I have done includes CTEs, Window Functions, Aggregate Functions, etc.
This is compiled in the file named EDA.sql

Below you can see the companies in the top 5 for the number layoffs per year.

![image](https://github.com/user-attachments/assets/a355e78e-d393-483d-bf40-1ecaed3e12dc)



Next, the screenshot below shows the top 5 companies in each industry based on number of layoffs (individual by year). You can see that the more funding a company has, the more layoffs they usually have.
Pretty cool, right?

![image](https://github.com/user-attachments/assets/8d0ce63e-edb5-4ec7-8c7c-855f35594ca0)




This final screenshots shows the complex query for the top 5 company layoffs per industry, which uses several CTEs.

![image](https://github.com/user-attachments/assets/f167f656-f338-4576-846e-12b00e3ff469)

