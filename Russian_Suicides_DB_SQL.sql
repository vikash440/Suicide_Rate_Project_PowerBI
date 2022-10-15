/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [country]
      ,[year]
      ,[sex]
      ,[age]
      ,[suicides_no]
      ,[population]
      ,[suicides_100k_pop]
      ,[country_year]
      ,[HDI_for_year]
      ,[gdp_for_year]
      ,[gdp_per_capita]
  FROM [Russia_Suicide_Data].[dbo].[Russian_Federation_Suicides]
  select * from Russian_Federation_Suicides;

  alter table Russian_Federation_Suicides alter column year varchar(50);

  /* Age category with highest number of suicides in female each year? */

   select * from (select sex,age,year, max(suicides_no) as max_suicides, 
  rank() over(partition by year order by max(suicides_no) desc) as rn 
  from Russian_Federation_Suicides group by year, age, sex having sex = 'Female') A where rn=1;

 

  /* Second highest number of suicides in males? */

    
  SELECT  MAX(suicides_no) AS second_max
  FROM Russian_Federation_Suicides
 WHERE sex = 'male' and suicides_no < (SELECT MAX(suicides_no) 
                 FROM Russian_Federation_Suicides);
                 
  
  /* Generation with highest number of deaths from 1989-2015?  */

  select top(1) generation ,sum(suicides_no) as total_suicides from 
  Russian_Federation_Suicides group by generation order by total_suicides desc;





  











