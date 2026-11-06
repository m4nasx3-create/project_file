/*
What are the top skills based on salary.
- look at the avg salary for each skill for business analyst position
- focus on roles with salary specified, regardless of location
- it will reveal how different skills impact salary levels for business analytics.
and helps finding the most financially rewarding skills to improve and acquire.
*/

SELECT 
skills,
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
    skills
order by 
    avg_salary desc
limit 10

/*
Here is the breakdown of the highest-paying Business Analyst skills in 3 key trends based on your query results:

1. DevOps & Automation Command the Highest Premium: The massive outlier is Chef at $220,000. 
   This indicates that Business Analysts who can bridge the gap into infrastructure automation and DevOps are exceptionally rare and highly valued.
2. Advanced Cloud & Big Data Expertise is Required: Employers are paying top salaries for 
   BAs who can directly navigate modern data pipelines, cloud platforms, and non-relational databases, with tools like Phoenix ($135k), MongoDB ($120k), BigQuery ($115k), GCP ($115k), and Snowflake ($114k) dominating the top tiers.
3. Programming & Data Science Outpace Standard BI: While high-end BI tools like Looker ($130k) remain lucrative,
   advanced analytical programming languages like Python ($116k) and R ($114k) are highly compensated, reflecting a shift toward BAs performing complex statistical modeling and predictive analytics.
*/

/*
[
  {
    "skills": "chef",
    "avg_salary": "220000.00"
  },
  {
    "skills": "numpy",
    "avg_salary": "157500.00"
  },
  {
    "skills": "ruby",
    "avg_salary": "150000.00"
  },
  {
    "skills": "hadoop",
    "avg_salary": "139201.36"
  },
  {
    "skills": "julia",
    "avg_salary": "136100.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "135410.00"
  },
  {
    "skills": "phoenix",
    "avg_salary": "135248.18"
  },
  {
    "skills": "electron",
    "avg_salary": "131000.00"
  },
  {
    "skills": "c",
    "avg_salary": "123328.57"
  },
  {
    "skills": "pytorch",
    "avg_salary": "120333.33"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120333.33"
  },
  {
    "skills": "seaborn",
    "avg_salary": "120000.00"
  },
  {
    "skills": "matlab",
    "avg_salary": "120000.00"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "120000.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "120000.00"
  },
  {
    "skills": "nosql",
    "avg_salary": "119330.36"
  },
  {
    "skills": "mongodb",
    "avg_salary": "118666.67"
  },
  {
    "skills": "snowflake",
    "avg_salary": "112542.68"
  },
  {
    "skills": "looker",
    "avg_salary": "110580.64"
  },
  {
    "skills": "pandas",
    "avg_salary": "110558.33"
  },
  {
    "skills": "node.js",
    "avg_salary": "110000.00"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "110000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "110000.00"
  },
  {
    "skills": "chainer",
    "avg_salary": "110000.00"
  },
  {
    "skills": "cassandra",
    "avg_salary": "108487.50"
  }
]
*/

