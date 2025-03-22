# Job Market Cleaning and EDA
Utilizing MySQL, cleanse and standardize job market data for analysis. 

**GOAL**: Analysis of raw job market data to measure layoff data against company performance. Much of the data was messy and had errors when querying, especially when dealing with dates.

**SOLUTION**: I perfomed an exploratory data analysis using the following SQL concepts: 
- CTEs
- Window Functions
- Aggregate Functions
- **cleaned and standardized the data to prepare for analysis**
  - removed duplicates
  - removed blank and irrelevant data
  - updated fields (date fields) to be properly queried


Below you can see the companies in the top 5 for the number layoffs per year.

![image](https://github.com/user-attachments/assets/a355e78e-d393-483d-bf40-1ecaed3e12dc)



Next, the screenshot below shows the top 5 companies in each industry based on number of layoffs (individual by year). You can see that the more funding a company has, the more layoffs they usually have.
Pretty cool, right?

![image](https://github.com/user-attachments/assets/8d0ce63e-edb5-4ec7-8c7c-855f35594ca0)




**This final screenshots shows the complex query for the top 5 company layoffs per industry, which uses several CTEs.**

![image](https://github.com/user-attachments/assets/f167f656-f338-4576-846e-12b00e3ff469)

