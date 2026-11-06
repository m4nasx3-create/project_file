/*
Question: what are the most optimal skills to learn ( high in demand and high paying).
- identify the skills in high demand and with high average salary for Business analyst roles.
- concentrate on remote positions with specified salaries.(optional)
- target the skills that offer job security(high demand) and financial benefits(high salary).
offering strategic insights in career development in Business analytics roles. 
*/
-- shortened code.
SELECT
    sd.skill_id,
    sd.skills,
    count(sjd.job_id) as demand_count,
    round(avg(jpf.salary_year_avg)) as avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd on sjd.job_id = jpf.job_id
INNER JOIN skills_dim sd on sd.skill_id = sjd.skill_id
WHERE  
    jpf.job_title_short = 'Business Analyst'
    and salary_year_avg is not NULL
   -- and job_work_from_home = TRUE
group BY
    sd.skill_id
having 
    COUNT(sjd.job_id)>10
ORDER BY
    demand_count desc,
    avg_salary desc
limit 25

 /*
1. Core BI Foundation: SQL is the most demanded skill (312 postings, $95k), serving as the baseline requirement. 
   Excel and Tableau follow closely in demand, with Tableau ($98k) commanding a distinct salary premium over Excel ($87k).
2. The Programming Premium: Advanced analytics languages out-earn standard BI software. 
   Python ($104k) and R ($105k) secure significantly higher salaries than widely used tools like Power BI ($92k).
3. Big Data & Cloud Top the Scale: Specialized data infrastructure and cloud skills offer the absolute highest compensation despite lower posting volumes, 
   led by Hadoop ($139k), Phoenix ($135k), Snowflake ($112k), and AWS ($106k).
 
 
 ""skill_id","skills","demand_count","avg_salary"
0,"sql","312","95292"
181,"excel","226","87212"
182,"tableau","212","98794"
1,"python","143","104277"
183,"power bi","139","92059"
196,"powerpoint","74","88182"
5,"r","73","105969"
215,"flow","51","92445"
188,"word","51","87075"
186,"sas","37","100308"
7,"sas","37","100308"
79,"oracle","37","93139"
80,"snowflake","34","112543"
189,"sap","34","86547"
8,"go","33","105701"
61,"sql server","30","89868"
185,"looker","25","110581"
76,"aws","25","105996"
197,"ssrs","23","91102"
74,"azure","22","103836"
198,"outlook","20","80974"
204,"visio","18","89551"
194,"ssis","17","92889"
9,"javascript","17","76212"
137,"phoenix","16","135248"
*/   

/*
with skill_demand as 
(
    select 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
    from 
    job_postings_fact
    INNER JOIN skills_job_dim on
    skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim on
    skills_dim.skill_id = skills_job_dim.skill_id
    where
    job_title_short = 'Business Analyst' AND
    salary_year_avg is not null
   -- and job_work_from_home = true
    group by
    skills_dim.skill_id
), average_salary as 
(
    SELECT 
    skills_job_dim.skill_id,
    round(AVG(salary_year_avg),2) as avg_salary
    from 
        job_postings_fact
    inner JOIN skills_job_dim on 
        skills_job_dim.job_id = job_postings_fact.job_id
    inner JOIN skills_dim on 
        skills_dim.skill_id = skills_job_dim.skill_id
    where 
        salary_year_avg is not null AND
        job_title_short = 'Business Analyst'
    -- AND job_work_from_home = true
    GROUP BY
        skills_job_dim.skill_id
)
select
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    avg_salary
from
    skill_demand
INNER JOIN average_salary on
    average_salary.skill_id = skill_demand.skill_id
WHERE
    demand_count > 10
order by
   demand_count desc,
   avg_salary DESC
limit 50
*/

