SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistances
FROM teachers 
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name, teachers.name
HAVING cohorts.name = 'JUL02'
ORDER BY teachers.name;