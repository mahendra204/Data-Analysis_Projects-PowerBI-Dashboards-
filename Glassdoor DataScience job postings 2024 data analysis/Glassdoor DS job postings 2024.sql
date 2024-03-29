use casestudy

select * from ['Glass door data science jobs'] 

---Q1. Find the top 5 companies listed with the highest average salary estimations among all job postings from company.

with cte as (
select company, avg(salary_avg_estimate) as avg_salary
FROM ['Glass door data science jobs'] where company is not null
group by company having  avg(salary_avg_estimate) is not null)

select company, avg_salary, rnk from (
select company, avg_salary, dense_rank() over(order by avg_salary desc) as rnk 
from cte )x
where rnk<=5



---Q2.list the no.of companies comes under different average pay scale ranges as(<1L as low, 1L-3L as medium, remaining as high) 
select  salary_range, count(*) as no_of_companies
from (
select company, case
 when salary_avg_estimate < 100000 then 'Low'
 when salary_avg_estimate between 100000 and 300000 then 'Medium'
 else 'High' end as salary_range
 from ['Glass door data science jobs']) a
group by salary_range
order by no_of_companies desc




--Q3. list down the companies with average culture_and_values_rating for companies with a company_rating above 4.5

select company, avg(culture_and_values_rating) as avg_culture_rating 
from ['Glass door data science jobs']
where company_rating>4.5
group by company
order by 2 desc



---Q4. Find the average senior_management_rating for each sector.

select sector, round(avg(senior_management_rating),2) as avg_senior_rating
from ['Glass door data science jobs'] where sector is not null
group BY sector
order by 2 desc

-----5. Analyze the average career_opportunities_rating for companies with different revenues.

select revenue, round(avg(career_opportunities_rating),2)  as avg_career_rating
from ['Glass door data science jobs'] 
where revenue is not null
group by revenue


---6. give the average comp_and_benefits_rating for companies in different locations.
select location, 
round(avg(comp_and_benefits_rating),2) as com_and_benefits_rating
from ['Glass door data science jobs'] 
where salary_avg_estimate is not null
group by location 
order by com_and_benefits_rating desc


---7. Identify the industry and sector with the highest average work_life_balance_rating.

select top 5 industry, sector, avg(work_life_balance_rating) as avg_work_life_balance
from ['Glass door data science jobs']
group by industry, sector
order by  avg_work_life_balance desc







--8. Give me details about the average company_rating with its company_size category .

select company_size, round(avg(company_rating),2) as avg_company_rating
from ['Glass door data science jobs'] where company_size is not null
group by company_size  
order by avg_company_rating desc


--9. Rank sectors based on the average company_rating, consider sectors with more than 10 companies only.
select sector, round(avg(company_rating),2) as avg_rating
from ['Glass door data science jobs'] where sector is not null
group by  sector 
having count(distinct company) > 10
order by avg_rating desc;

























































select count(distinct company) from ['Glass door data science jobs']

select  location,count(company) as no_of_companies from ['Glass door data science jobs'] group by location 
order by 2 desc


select location, job_title, count(*) no_of_openings from ['Glass door data science jobs'] group by location, job_title 
order by 3









