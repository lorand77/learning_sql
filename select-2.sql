-- Clean up previous runs (optional)
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- ============================================
-- 1. CREATE TABLES
-- ============================================

CREATE TABLE students (
    student_id INTEGER,
    name TEXT,
    course_id INTEGER
);

CREATE TABLE courses (
    course_id INTEGER,
    course_name TEXT
);

-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================

INSERT INTO students (student_id, name, course_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 103),
(3, 'Charlie', 101),
(3, 'Charlie', 102),
(4, 'David', 104);

INSERT INTO courses (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'History'),
(103, 'Science');

-- ============================================
-- 3. INNER JOIN
-- ============================================

SELECT '=== INNER JOIN ===' AS section;
SELECT S.name AS student_name, C.course_name
FROM students S
INNER JOIN courses C
ON S.course_id = C.course_id;

-- ============================================
-- 4. LEFT JOIN (LEFT OUTER JOIN)
-- ============================================

SELECT '=== LEFT JOIN ===' AS section;
SELECT S.name AS student_name, C.course_name
FROM students S
LEFT JOIN courses C
ON S.course_id = C.course_id;
