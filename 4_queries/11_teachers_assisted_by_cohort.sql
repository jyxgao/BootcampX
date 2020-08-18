SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers 
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name, teachers.name
HAVING cohorts.name = 'JUL02'
ORDER BY teachers.name;

-- Alernatively:

-- SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
-- FROM teachers
-- JOIN assistance_requests ON teacher_id = teachers.id
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.name = 'JUL02'
-- ORDER BY teacher;