-- Step 1: Drop old table if it exists
DROP TABLE IF EXISTS employees;

-- Step 2: Create table
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    department TEXT,
    salary REAL,
    hire_date TEXT
);

-- Step 3: Insert sample data
INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice',   'HR',       50000, '2021-03-15'),
('Bob',     'IT',       70000, '2020-07-01'),
('Charlie', 'Finance',  65000, '2019-01-10'),
('Diana',   'IT',       80000, '2022-09-25'),
('Eve',     'HR',       52000, '2023-05-11');

-- ====================================================
-- SELECT STATEMENT EXAMPLES
-- ====================================================

-- 1. Select all columns
SELECT * FROM employees;

-- 2. Select specific columns
SELECT name, department FROM employees;

-- 3. Filter rows using WHERE
SELECT * FROM employees WHERE department = 'IT';

-- 4. Filter using numeric comparison
SELECT * FROM employees WHERE salary > 60000;

-- 5. Combine conditions with AND / OR
SELECT * FROM employees
WHERE (department = 'HR' OR department = 'Finance')
  AND salary > 51000;

-- 6. Sort results by salary descending
SELECT * FROM employees ORDER BY salary DESC;

-- 7. Limit number of results
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 8. Aggregate with GROUP BY (average salary per department)
SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS num_employees, SUM(salary)
FROM employees
GROUP BY department;

-- 9. Filter groups with HAVING (only departments with avg > 60000)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 60000;

-- 10. Aliases for column names
SELECT name AS EmployeeName, salary AS MonthlyPay FROM employees;

-- 11. Complex condition example
SELECT name, department, salary
FROM employees
WHERE (department = 'IT' OR department = 'Finance')
  AND salary > 65000
ORDER BY salary DESC;