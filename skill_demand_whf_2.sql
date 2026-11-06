/* Question - to find out the skills most in demand for 
business analyst work from home jobs*/

/*
with remote_job_skills as 
(
    SELECT skill_id,
    count(*) as skill_count
    FROM skills_job_dim
    inner JOIN job_postings_fact on job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_postings_fact.job_work_from_home = TRUE AND
    job_postings_fact.job_title_short = 'Business Analyst'
    group BY
    skill_id
)
SELECT 
    skills,
    remote_job_skills.skill_count
FROM 
    remote_job_skills
INNER JOIN skills_dim on 
    skills_dim.skill_id = remote_job_skills.skill_id
order by 
    skill_count desc
limit 5
*/

select 
  skills,
  count(skills_job_dim.job_id) as demand_count
from 
  job_postings_fact
INNER JOIN skills_job_dim on
  skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on
  skills_dim.skill_id = skills_job_dim.skill_id
where
  job_title_short = 'Business Analyst' AND
  job_work_from_home = true
group by
  skills
order by
  demand_count desc
limit
  5;
/*
[
  {
    "skills": "sql",
    "skill_count": "1266"
  },
  {
    "skills": "excel",
    "skill_count": "983"
  },
  {
    "skills": "tableau",
    "skill_count": "728"
  },
  {
    "skills": "power bi",
    "skill_count": "555"
  },
  {
    "skills": "python",
    "skill_count": "546"
  }
]
*/