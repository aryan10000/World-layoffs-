-- SQL Project - Data Cleaning and Exploartory Data Analysis

-- https://www.kaggle.com/datasets/swaptr/layoffs-2022




select * from layoffs;

-- 1. remove duplicates if any
-- 2. standardize the data
-- 3. handling blank/null values
-- 4.removing unnecessary cols and rows

-- creating working table since we should never alter our raw data
CREATE TABLE layoffs_staging LIKE layoffs;

-- inserting data into the working table
INSERT layoffs_staging
SELECT * FROM layoffs; 




-- 1.
WITH duplicate_cte as
(
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY company,location, industry, total_laid_off, 
    percentage_laid_off, `date`,stage,country, funds_raised_millions ) row_num
	FROM layoffs_staging
)
SELECT * FROM duplicate_cte
WHERE row_num > 1;

SELECT * from layoffs_staging
where company = 'Casper';

-- we create a new table to delete duplicates
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- inserting values in layoffs_staging2
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company,location, industry, total_laid_off, 
percentage_laid_off, `date`,stage,country, funds_raised_millions ) row_num
FROM layoffs_staging;



SELECT * from layoffs_staging2 where row_num >1;

delete
from layoffs_staging2
where row_num > 1; 



-- 2.
select distinct company, trim(company) from layoffs_staging2;

update layoffs_staging2
set company = trim(company); 



select distinct industry from layoffs_staging2 order by 1;

select * from layoffs_staging2 where industry like 'Crypto%';

update layoffs_staging2 set industry = 'Crypto' where industry like 'Crypto%';





select distinct country  from layoffs_staging2 order by 1;

select * from layoffs_staging2 where country like 'United States%'  order by 1;

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;
 
update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';




select * from layoffs_staging2;
-- right now date col is in text format. we need to change it to dateformat

select `date`, str_to_date(`date`, '%m/%d/%Y') from layoffs_staging2;

update layoffs_staging2  set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date` from layoffs_staging2;

alter table layoffs_staging2 modify column `date` DATE;




select * from layoffs_staging2; 


-- 3.

select * from layoffs_staging2 where total_laid_off IS NULL and percentage_laid_off IS NULL;


-- trying to populate industry from similar companis
select * from layoffs_staging2 where company = 'Airbnb';


update layoffs_staging2 set industry = null where industry = '';


select t1.industry, t2.industry  from layoffs_staging2 t1 
join layoffs_staging2 t2 
on t1.company = t2.company 
where (t1.industry is null or t1.industry = '') and t2.industry is not null;

update layoffs_staging2 t1 
join layoffs_staging2 t2  
on t1.company = t2.company 
set t1.industry =  t2.industry
where t1.industry is null   and t2.industry is not null;



select * from layoffs_staging2;


-- 4.

delete 
from layoffs_staging2
where total_laid_off IS NULL and percentage_laid_off IS NULL;

select * from layoffs_staging2 where total_laid_off IS NULL and percentage_laid_off IS NULL; 

alter table layoffs_staging2 drop column row_num;

select * from layoffs_staging2;

-- NOW ITS COMPLETED. WE HAVE CLEAN DATA NOW.


-- --------------------------------------------------
-- --------------------------------------------------


-- exploratory data analysis on the cleaned data




select * from layoffs_staging2;
-- convert different cols which are text to int/suitable data format . 
ALTER TABLE layoffs_staging2
MODIFY COLUMN total_laid_off INT ;

ALTER TABLE layoffs_staging2
MODIFY COLUMN percentage_laid_off DECIMAL(3,2);

ALTER TABLE layoffs_staging2
MODIFY COLUMN funds_raised_millions DECIMAL(5,4);

ALTER TABLE layoffs_staging2
MODIFY COLUMN funds_raised_millions DECIMAL(10,4);


select max(total_laid_off), max(percentage_laid_off) from layoffs_staging2;

-- just checking companies who completely lost all employees
select * from layoffs_staging2 where percentage_laid_off = 1 order by total_laid_off desc;

select * from layoffs_staging2 where percentage_laid_off = 1 order by funds_raised_millions desc;

select company, sum(total_laid_off) from layoffs_staging2 
group by company order by 2 desc;

select min(`date`), max(`date`) from layoffs_staging2;


select industry, sum(total_laid_off) from layoffs_staging2 
group by industry order by 2 desc;


select country, sum(total_laid_off) from layoffs_staging2 
group by country order by 2 desc;


select YEAR(`date`), sum(total_laid_off) from layoffs_staging2 
group by YEAR(`date`) order by 1 desc;


select stage, sum(total_laid_off) from layoffs_staging2 
group by stage order by 2 desc;


-- looking at rolling sum

select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;


-- for rolling total we use a cte
with Rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`, total_off, sum(total_off) over(order by `month`) as rolling_total
From Rolling_total;


-- now we will se how many people were the companies laying off per year


select company, YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
order by company;

select company, YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
order by 3 desc;

with Company_Year(company,years,total_laid_off) as
(
select company, YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
), Company_year_rank as 
(select *, dense_rank() over(partition by years order by total_laid_off desc) ranking 
from Company_Year
where years is not null )

select * from Company_year_rank  where ranking <=5 ;





















