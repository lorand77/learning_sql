-- ========================================
-- 1. Drop the table if it already exists
-- ========================================
DROP TABLE IF EXISTS employees;

-- ========================================
-- 2. Create the table
-- ========================================
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    position TEXT,
    salary REAL,
    department TEXT
);

-- ========================================
-- 3. Insert sample data
-- ========================================
INSERT INTO employees (name, position, salary, department) VALUES 
('Alice Johnson', 'Manager', 75000, 'HR'),
('Bob Smith', 'Developer', 65000, 'IT'),
('Charlie Brown', 'Sales Executive', 55000, 'Sales');

-- View data after INSERT
SELECT * FROM employees;

-- ========================================
-- 4. Update data
-- ========================================
-- Example 1: Increase Bob's salary and change position
UPDATE employees
SET salary = 80000, position = 'Senior Developer'
WHERE name = 'Bob Smith';

-- Example 2: Give all HR employees a raise
UPDATE employees
SET salary = salary + 5000
WHERE department = 'HR';

-- View data after UPDATE
SELECT * FROM employees;

-- ========================================
-- 5. Delete data
-- ========================================
-- Example 1: Delete all employees in Sales department
DELETE FROM employees
WHERE department = 'Sales';

-- Example 2: Delete a specific employee by ID
-- (For example, delete the employee with id = 1)
-- DELETE FROM employees WHERE id = 1;

-- View data after DELETE
SELECT * FROM employees;

-- ========================================
-- 6. Optional: Show final table structure
-- ========================================
PRAGMA table_info(employees);
