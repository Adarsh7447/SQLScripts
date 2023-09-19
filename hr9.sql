--Basic Statistics:
--What is the average age of employees in the dataset?
--How many unique education levels are represented in the dataset?
--What is the maximum and minimum number of years of experience?
--What is the most common city where employees are located?
select round(avg(age)) as Average_Age from employee1;
select distinct education from employee1;
select max(Experienceincurrentdomain) as MaxExp,min(Experienceincurrentdomain) as MinExp from employee1;
select city from employee1 group by city order by count(city) desc fetch first 1 rows only;

--Employee Experience:
--How many employees have more than 5 years of experience?
--What is the average experience (in years) for employees in each education category?
--Calculate the average experience for employees in each city.
select * from employee1 where experienceincurrentdomain>5;
select education,round(avg(experienceincurrentdomain),2) as Average_Experience from employee1 group by education;
select city,round(avg(experienceincurrentdomain),2) as Average_Experience from employee1 group by city;

--Joining Year Analysis:
--How many employees joined each year?
--Calculate the average age of employees for each joining year.
select joiningyear,count(*) as CNT from employee1 group by joiningyear order by joiningyear;
select joiningyear,round(avg(age),2) as Average_Age from employee1 group by joiningyear order by joiningyear;

--What is the distribution of employees across different payment tiers?
select paymenttier,count(*) as Dist from employee1 group by paymenttier;

--How many employees have taken leaves (LeaveorNOT = 'Leave')?
select * from employee1;
select LEAVEORNOT,count(*) FROM EMPLOYEE1 GROUP BY LEAVEORNOT HAVING leaveornot = 1;

--Calculate the average age of employees who took leaves.
select LEAVEORNOT,ROUND(AVG(AGE),2) AS AVGERAGE_AGE FROM EMPLOYEE1 GROUP BY LEAVEORNOT HAVING leaveornot = 1;

--Find the average experience of employees who took leaves.
select LEAVEORNOT,ROUND(AVG(experienceincurrentdomain),2) AS AVGERAGE_EXP FROM EMPLOYEE1 GROUP BY LEAVEORNOT HAVING leaveornot = 1;

--How many employees have been benched (Everbenched = 'Yes')?
select everbenched,count(*) as Count FROM EMPLOYEE1 GROUP BY everbenched HAVING everbenched = 'Yes';

--Calculate the average age of benched employees.
select everbenched,round(avg(age),2) as Average_age FROM EMPLOYEE1 GROUP BY everbenched HAVING everbenched = 'Yes';

--Determine the average experience of benched employees.
select everbenched,round(avg(experienceincurrentdomain),2) as Average_Exp FROM EMPLOYEE1 GROUP BY everbenched HAVING everbenched = 'Yes';

--Are there any correlations between education level and payment tier?
select education,paymenttier from employee1 group by education,paymenttier;

--Is there a relationship between age and experience?
select age,round(avg(experienceincurrentdomain)) from employee1 group by age order by age;

--What is the average age of employees who have taken leaves and have more than 5 years of experience?
select avg(age) as average_age from employee1 where experienceincurrentdomain>5 group by leaveornot having leaveornot=1;

--Find the employee with the highest age.
select * from employee1 order by age desc fetch first 1 rows only;

--Determine the most common combination of education level and city.
select education,city from employee1 group by education,city;

--Calculate the percentage of employees who have taken leaves.
SELECT 
    Round((COUNT(CASE WHEN LeaveorNOT = 1 THEN 1 ELSE NULL END) / COUNT(*)) * 100,2) AS PercentageLeaves
FROM 
    employee1;




