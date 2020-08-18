SELECT students.name AS student, COUNT(assignment_submissions.*) AS total_submissions
FROM assignment_submissions
JOIN students ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING COUNT(assignment_submissions.*) < 100;