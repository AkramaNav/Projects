-- Exploratory Data Analysis --

Select *
From layoffs_staging2;

Select MAX(total_laid_off), MAX(percentage_laid_off)
From layoffs_staging2;

Select *
From layoffs_staging2 
Where percentage_laid_off = 1
Order by funds_raised_millions desc;

Select company, SUM(total_laid_off)
From layoffs_staging2 
Group by company
order by 2 desc;

Select MIN(`date`), Max(`date`)
From layoffs_staging2; 

Select industry, SUM(total_laid_off)
From layoffs_staging2 
Group by industry
order by 2 desc;

Select country, SUM(total_laid_off)
From layoffs_staging2 
Group by country
order by 2 desc;

Select YEAR (`date`), SUM(total_laid_off)
From layoffs_staging2 
Group by YEAR (`date`)
order by 1 desc;

Select stage, SUM(total_laid_off)
From layoffs_staging2 
Group by stage
order by 2 desc;

Select company, SUM(percentage_laid_off)
From layoffs_staging2 
Group by company
order by 2 desc;

Select substring(`date`,1,7) as `month`, SUM(total_laid_off)
from layoffs_staging2
Where substring(`date`,1,7) IS NOT NULL
group by `month` 
order by 1 asc
;

With Rolling_Total as 
(
Select substring(`date`,1,7) as `month`, SUM(total_laid_off) as total_off
from layoffs_staging2
Where substring(`date`,1,7) IS NOT NULL
group by `month` 
order by 1 asc

)
Select `month`, total_off,
Sum(total_off) OVER(Order by `month`) as rolling_total
From Rolling_total
;

Select company, SUM(total_laid_off)
From layoffs_staging2 
Group by company
order by 2 desc;


Select company, YEAR (`date`), SUM(total_laid_off)
From layoffs_staging2 
Group by company, Year(`date`)
Order by 3 desc;

With Company_Year (company, years, total_laid_off) AS
(
Select company, YEAR (`date`), SUM(total_laid_off)
From layoffs_staging2 
Group by company, Year(`date`)
)
Select *, DENSE_RANK() OVER (Partition BY years ORDER BY total_laid_off DESC) as Ranking
from Company_year
Where Years is NOT NULL
ORDER BY Ranking ASC;




Select company, YEAR (`date`), SUM(total_laid_off)
From layoffs_staging2 
Group by company, Year(`date`)
Order by 3 desc;

With Company_Year (company, years, total_laid_off) AS
(
Select company, YEAR (`date`), SUM(total_laid_off)
From layoffs_staging2 
Group by company, Year(`date`)
), Company_Year_Rank as 
(Select *,
DENSE_RANK() OVER (Partition BY years ORDER BY total_laid_off DESC) as Ranking
from Company_year
Where Years is NOT NULL
)
Select *
From Company_Year_Rank
Where Ranking <= 5;










