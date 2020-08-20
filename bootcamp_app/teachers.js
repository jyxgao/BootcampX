const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2];

pool.query(`
  SELECT teachers.name AS teacher, cohorts.name AS cohort
  FROM teachers 
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  GROUP BY cohorts.name, teachers.name
  HAVING cohorts.name LIKE $1
  ORDER BY teachers.name;
`, [`%${cohort || 'JUL02'}%`])
.then(res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`)
  })
})
.catch(err => console.error('query error', err.stack));