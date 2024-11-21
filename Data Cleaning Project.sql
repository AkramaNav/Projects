-- Data Cleaning Project --

Select * 
from layoffs;

-- 1. Remove Duplicates
-- 2. Standardized Data
-- 3. Null Values or Blanks
-- 4. Remove any Collums or Unecesassary Rows


CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
Select * 
From layoffs;

Select * , 
Row_Number() OVER(
Partition By company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
From layoffs_staging;

With duplicate_cte as
(
Select * , 
Row_Number() OVER(
Partition By company, location, country, stage, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date`) as row_num
From layoffs_staging
)
Select *
From duplicate_cte
where row_num > 1;

Select * 
From layoffs
WHERE company = 'Casper';


Select * , 
Row_Number() OVER(
Partition By company, industry, location, country, stage, funds_raised_millions, total_laid_off, percentage_laid_off, `date`) as row_num
From layoffs_staging;

With duplicate_cte as
(
Select * , 
Row_Number() OVER(
Partition By company, location, country, stage, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date`) as row_num
From layoffs_staging
)
Select *
From duplicate_cte
where row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
from layoffs_staging2
Where row_num > 1;

INSERT layoffs_staging2
Select *,
Row_Number() OVER(
Partition By company, location, country, stage, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date`) as row_num
From layoffs_staging;

Delete
from layoffs_staging2
Where row_num > 1;

Select company
from layoffs_staging2;

-- Standardizing Data --

Select company, Trim(company)
from layoffs_staging2;

Update layoffs_staging2
Set company = Trim(company);

Select Distinct(industry)
from layoffs_staging2
Order by 1;

Select *
from layoffs_staging2
Where industry LIKE 'Crypto%';

Update layoffs_staging2
Set industry = 'Crypto'
Where industry LIKE 'Crypto%';

Select Distinct country, TRIM(Trailing '.' From country)
from layoffs_staging2
Order by 1;

Update layoffs_staging2
set country = TRIM(Trailing '.' From country)
Where country like 'United States%';

Select `date`
From layoffs_staging2;

Update layoffs_staging2
Set date = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
Modify Column `date` DATE;

-- Null Values or Blanks --

Select *
From layoffs_staging2
Where total_laid_off is NULL
And percentage_laid_off is NULL;

Select *
From layoffs_staging2
where industry is NULL
or industry = '';

Select *
From layoffs_staging2
where company = 'Airbnb';

Select *
from layoffs_staging2 t1
Join layoffs_staging2 t2
	On t1.company = t2.company 
Where (t1.industry is NULL OR t1.industry = '')
and t2.industry is NOT NULL;

Update layoffs_staging2 t1
join layoffs_staging2 t2
	On t1.company = t2.company 
Set t1.industry = t2.industry 
Where (t1.industry is NULL)
and t2.industry is NOT NULL;


Update layoffs_staging2
Set Industry = NULL
where industry = '';

-- Remove Columns or Rows --

Select *
From layoffs_staging2
Where total_laid_off is NULL
And percentage_laid_off is NULL;

Delete
From layoffs_staging2
Where total_laid_off is NULL
And percentage_laid_off is NULL;

Select *
From layoffs_staging2;

Alter Table layoffs_staging2
Drop column row_num;



