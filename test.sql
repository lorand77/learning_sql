CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    grade_level INTEGER  
);

CREATE TABLE Subjects (
    subject_id INTEGER PRIMARY KEY,
    subject_name TEXT,
    teacher_name TEXT
);

CREATE TABLE Grades (
    grade_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    grade INTEGER
);

INSERT INTO Students (first_name, last_name, grade_level) VALUES
('Alice', 'Brown', 7),
('Bob', 'Smith', 8),
('Charlie', 'Johnson', 7),
('Diana', 'Lee', 8);

INSERT INTO Subjects (subject_name, teacher_name) VALUES
('Mathematics', 'Mr. Green'),
('History', 'Ms. Adams'),
('Computer Science', 'Mr. White'),
('Physics', 'Dr. Gray'),
('English', 'Mrs. Black');

INSERT INTO Grades (student_id, subject_id, grade) VALUES
(1, 1, 5),
(1, 2, 4),
(1, 3, 5),
(2, 1, 3),
(2, 3, 4),
(2, 5, 5),
(3, 2, 5),
(3, 4, 4),
(4, 1, 4),
(4, 4, 5),
(4, 5, 5);

SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Grades;

SELECT
    s.first_name, 
    s.last_name,
    sub.subject_name,
    g.grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Subjects sub ON g.subject_id = sub.subject_id;


SELECT
    s.first_name, 
    s.last_name,
    round(avg(g.grade),2) AS average_grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Subjects sub ON g.subject_id = sub.subject_id
GROUP BY s.student_id;

