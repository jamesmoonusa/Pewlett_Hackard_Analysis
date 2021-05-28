--Deliverable 1
--Create retirement_title.csv
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
--INTO retirement_titles
FROM employees AS e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
--INTO unique_titles 
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Create retiring_titles
SELECT COUNT(emp_no), title
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
--INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT count(title), title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY count DESC;

