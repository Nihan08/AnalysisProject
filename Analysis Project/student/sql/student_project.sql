-- 🎓 Student Scores Project

CREATE DATABASE IF NOT EXISTS school_project;
USE school_project;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  class INT
);

CREATE TABLE subjects (
  subject_id VARCHAR(10) PRIMARY KEY,
  subject_name VARCHAR(50)
);

CREATE TABLE marks (
  student_id INT,
  subject_id VARCHAR(10),
  exam_date DATE,
  score INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO students VALUES
(1,'Arun',10),(2,'Divya',10),(3,'Farhan',10),(4,'Geetha',10),(5,'Hari',10);

INSERT INTO subjects VALUES
('M1','Math'),('E1','English'),('S1','Science');

INSERT INTO marks VALUES
(1,'M1','2025-07-01',95),(1,'E1','2025-07-01',88),(1,'S1','2025-07-01',92),
(2,'M1','2025-07-01',55),(2,'E1','2025-07-01',60),(2,'S1','2025-07-01',58),
(3,'M1','2025-07-01',75),(3,'E1','2025-07-01',80),(3,'S1','2025-07-01',78),
(4,'M1','2025-07-01',40),(4,'E1','2025-07-01',45),(4,'S1','2025-07-01',50),
(5,'M1','2025-07-01',85),(5,'E1','2025-07-01',90),(5,'S1','2025-07-01',88);

-- Avg marks per subject
SELECT s.subject_name, ROUND(AVG(m.score),1) AS avg_score
FROM marks m JOIN subjects s ON m.subject_id = s.subject_id
GROUP BY s.subject_name;

-- Number of students failed per subject (score < 50)
SELECT s.subject_name, COUNT(*) AS failed_students
FROM marks m JOIN subjects s ON m.subject_id = s.subject_id
WHERE m.score < 50 GROUP BY s.subject_name;

-- Top scorer in each subject
SELECT s.subject_name, st.student_name, m.score
FROM marks m JOIN students st ON m.student_id = st.student_id
JOIN subjects s ON m.subject_id = s.subject_id
WHERE (s.subject_name, m.score) IN (
  SELECT subject_name, MAX(score)
  FROM marks m2 JOIN subjects s2 ON m2.subject_id = s2.subject_id
  GROUP BY subject_name
);
