-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging_2;

SELECT company, MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging_2
GROUP BY company;

SELECT *
FROM layoffs_staging_2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company
ORDER BY 2 desc;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging_2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY industry
ORDER BY 2 desc;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY country
ORDER BY 2 desc;

SELECT *
FROM layoffs_staging_2;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY stage
ORDER BY 2 DESC;


/*
 * EXPLORE BY MONTH
 */
 SELECT SUBSTRING(`date`,1,7) AS MONTH, SUM(total_laid_off)
 FROM layoffs_staging_2
 WHERE SUBSTRING(`date`,1,7) IS NOT NULL
 GROUP BY SUBSTRING(`date`,1,7)
 ORDER BY 1 ASC;
 
WITH rolling_total AS 
(
 SELECT SUBSTRING(`date`,1,7) AS `MONTH`, 
		SUM(total_laid_off) AS total_off
 FROM layoffs_staging_2
 WHERE SUBSTRING(`date`,1,7) IS NOT NULL
 GROUP BY SUBSTRING(`date`,1,7)
 ORDER BY 1 ASC
)
SELECT `MONTH`, total_off,
SUM(total_off) OVER(ORDER BY `MONTH`) as rolling_total
FROM rolling_total;
 
 
 
 
 
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company, 2
ORDER BY 3 ASC;

-- multiple CTE
WITH Company_Year (company, years, total_laid_off) AS -- take company, year, and sum of laid off
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company, 2
), Company_Year_Rank AS -- partition dense_rank by year and reset per year, then rank by laid off
( 
SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking 
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;

/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
-- Project Expansion: top 5 companies in each industry based on number of layoffs

SELECT * FROM layoffs_staging_2;
-- base idea to grab funding
SELECT company, SUM(funds_raised_millions) AS sum_raised
FROM layoffs_staging_2
WHERE (industry IS NOT NULL)
GROUP BY company;

-- top 5 companies in each industry based on number of layoffs, individually by year
WITH industry_grouped_funding_cte AS (
SELECT company, SUM(funds_raised_millions) AS sum_raised
FROM layoffs_staging_2
GROUP BY company
), company_rank_industry_cte AS
(
SELECT industry, company, total_laid_off, YEAR(`date`) AS `year`,
DENSE_RANK() OVER(PARTITION BY industry ORDER BY total_laid_off DESC) AS rank_industry_layoffs
FROM layoffs_staging_2
WHERE industry IS NOT NULL AND total_laid_off IS NOT NULL
)
SELECT *
FROM company_rank_industry_cte
WHERE rank_industry_layoffs < 6;

-- -- alternatively, create a table with grouped layoffs TOTAL (which probably has to include all sums of other totals as well)