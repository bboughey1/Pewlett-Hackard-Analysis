
--List of Sales Employees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
	INTO sales_info
	FROM current_emp as ce
	INNER JOIN dept_emp as de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
	WHERE d.dept_name ='Sales';

--List of Sales and Development
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_dev
FROM current_emp as ce
	INNER JOIN dept_emp as de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY ce.emp_no;

--Challenge
--Number of titles retiring
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO ret_titles
FROM current_emp as ce
	INNER JOIN titles as ti
		ON (ce.emp_no = ti.emp_no)
ORDER BY ce.emp_no;

SELECT * from ret_titles

--Partition the data to show only the most recent titles per employee
SELECT emp_no,
	first_name,
	last_name,
	to_date,
	title
INTO unique_titles
FROM (
	SELECT emp_no,
		first_name,
		last_name,
		to_date,
		title, ROW_NUMBER() OVER
		(PARTITION BY (emp_no)
		ORDER BY to_date DESC) rn
		FROM ret_titles
		) tmp WHERE rn = 1
ORDER by emp_no;
		
SELECT * from unique_titles

--Counting the number of employees per title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--Creating a list of employees eligible for potential mentorship program
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER by e.emp_no;