/* 
Question - identify the top highest paying jobs for business analyst.
- identify the top 10 highest paying business analyst jobs that are available remotely.
- focus on job posting with specified salary
- it will help to understand which high paying job require certain skills,
 which will help job seekers to understand which skills to develop that align with top salaries.
*/

with top_paying_jobs as (
    SELECT
    job_id,
    company_dim.name as company_name,
    job_title,
    salary_year_avg
    from job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
    job_title_short = 'Business Analyst' AND
    job_location like 'Anywhere' AND
    salary_year_avg is not NULL
    ORDER BY
    salary_year_avg deSC
    limit 10
)
SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
inner join skills_job_dim on skills_job_dim.job_id= top_paying_jobs.job_id
inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
order BY
    salary_year_avg DESC


/* Key Skill Insights
The Core Foundation: SQL and Python are the undisputed leaders, each appearing in 5 of the top job postings. They form the baseline technical requirement for high-paying data roles.
Data Visualization & Spreadsheets: Excel and Tableau are the next most critical skills, each requested in 4 different roles, highlighting the continued importance of data presentation and traditional spreadsheet analysis.
Specialized BI & Stats: Looker, R, and SAS form a secondary tier of specialized skills, each appearing twice.
Niche & High-Value Skills: Interestingly, while mentioned only once, the skill Chef was associated with the highest average salary ($220,000) in this specific sample. Cloud platforms like GCP and BigQuery also make appearances. 

[
  {
    "job_id": 502610,
    "company_name": "Noom",
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "skills": "sql"
  },
  {
    "job_id": 502610,
    "company_name": "Noom",
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "skills": "python"
  },
  {
    "job_id": 502610,
    "company_name": "Noom",
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "skills": "excel"
  },
  {
    "job_id": 502610,
    "company_name": "Noom",
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "skills": "tableau"
  },
  {
    "job_id": 502610,
    "company_name": "Noom",
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "skills": "looker"
  },
  {
    "job_id": 502610,
    "company_name": "Noom",
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "skills": "chef"
  },
  {
    "job_id": 112859,
    "company_name": "Uber",
    "job_title": "Manager II, Applied Science - Marketplace Dynamics",
    "salary_year_avg": "214500.0",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "company_name": "Harnham",
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "skills": "sql"
  },
  {
    "job_id": 17458,
    "company_name": "Harnham",
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "company_name": "Harnham",
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "skills": "r"
  },
  {
    "job_id": 416185,
    "company_name": "Gladly",
    "job_title": "Staff Revenue Operations Analyst",
    "salary_year_avg": "170500.0",
    "skills": "excel"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "sql"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "python"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "gcp"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "looker"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "word"
  },
  {
    "job_id": 1099753,
    "company_name": "CyberCoders",
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1313937,
    "company_name": "CyberCoders",
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 1313937,
    "company_name": "CyberCoders",
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "skills": "excel"
  },
  {
    "job_id": 1313937,
    "company_name": "CyberCoders",
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "sql"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "python"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "r"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "sas"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "phoenix"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "excel"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "company_name": "USAA",
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "skills": "sas"
  },
  {
    "job_id": 661103,
    "company_name": "Get It Recruit - Marketing",
    "job_title": "Marketing Analytics Manager",
    "salary_year_avg": "134550.0",
    "skills": "tableau"
  }
]
*/