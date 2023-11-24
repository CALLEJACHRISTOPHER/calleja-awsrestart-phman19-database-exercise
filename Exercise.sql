CREATE TABLE STUDENTS (
  STUDENTID VARCHAR(50) PRIMARY KEY,
  STUDENTNAME VARCHAR(50),
  DATEOFBIRTH DATE,
  YEARLEVEL INT
);


CREATE TABLE COURSES (
  COURSEID VARCHAR(50),
  COURSENAME VARCHAR(50),
  UNITS INT,
  PROFESSORNAME VARCHAR(50)
);


CREATE TABLE ENROLLMENTS (
  ENROLLMENTID INT PRIMARY KEY,
  STUDENTID VARCHAR(50),
  COURSEID VARCHAR(50),
  PROFESSORID INT,
  STUDENTNAME VARCHAR(50),
  PROFESSORNAME VARCHAR(50),
  COURSENAME VARCHAR(50),
  DATEENROLLED DATE
);

CREATE TABLE PROFESSORS (
  PROFESSORID INT PRIMARY KEY,
  PROFESSORNAME VARCHAR(50),
  PARTTIME BOOLEAN
);

INSERT INTO STUDENTS VALUES
  ('2023001', 'John Doe', '2000-01-15', 1),
  ('2023002', 'Jane Smith', '1999-08-22', 2),
  ('2023003', 'Bob Johnson', '2001-03-10', 1),
  ('2023004', 'Alice Williams', '2002-05-05', 3),
  ('2023005', 'Charlie Brown', '1998-11-30', 2),
  ('2023006', 'Eva Davis', '2003-02-18', 1),
  ('2023007', 'Michael Wilson', '2000-09-03', 2),
  ('2023008', 'Sophia Lee', '2001-12-20', 3),
  ('2023009', 'David Miller', '1999-04-07', 1),
  ('2023010', 'Olivia White', '2002-07-12', 2);
  
INSERT INTO COURSES VALUES
  ('C001', 'Introduction to Computer Science', 3, 'Dr. Smith'),
  ('C002', 'Data Structures and Algorithms', 4, 'Prof. Johnson'),
  ('C003', 'Database Management Systems', 3, 'Dr. White'),
  ('C004', 'Web Development', 3, 'Prof. Davis'),
  ('C005', 'Machine Learning', 4, 'Dr. Brown'),
  ('C006', 'Software Engineering', 3, 'Prof. Wilson'),
  ('C007', 'Network Security', 3, 'Dr. Miller'),
  ('C008', 'Artificial Intelligence', 4, 'Prof. Lee'),
  ('C009', 'Mobile App Development', 3, 'Dr. Jones'),
  ('C010', 'Operating Systems', 4, 'Prof. Taylor');
  
INSERT INTO ENROLLMENTS VALUES
  (1, '2023001', 'C001', 1, 'John Doe', 'Dr. Smith', 'Introduction to Computer Science', '2023-01-10'),
  (2, '2023002', 'C001', 2, 'Jane Smith', 'Prof. Johnson', 'Introduction to Computer Science', '2023-01-12'),
  (3, '2023003', 'C001', 3, 'Bob Johnson', 'Dr. White', 'Introduction to Computer Science', '2023-01-15'),
  (4, '2023004', 'C002', 4, 'Alice Williams', 'Prof. Davis', 'Data Structures and Algorithms', '2023-01-20'),
  (5, '2023005', 'C002', 5, 'Charlie Brown', 'Dr. Brown', 'Data Structures and Algorithms', '2023-01-25'),
  (6, '2023006', 'C002', 6, 'Eva Davis', 'Prof. Wilson', 'Data Structures and Algorithms', '2023-01-28'),
  (7, '2023007', 'C003', 7, 'Michael Wilson', 'Dr. Miller', 'Database Management Systems', '2023-02-02'),
  (8, '2023008', 'C003', 8, 'Sophia Lee', 'Prof. Lee', 'Database Management Systems', '2023-02-05'),
  (9, '2023009', 'C003', 9, 'David Miller', 'Dr. Jones', 'Database Management Systems', '2023-02-10'),
  (10, '2023010', 'C004', 10, 'Olivia White', 'Prof. Taylor', 'Web Development', '2023-02-15');


  
INSERT INTO PROFESSORS  VALUES
  (1, 'Dr. Smith', FALSE),
  (2, 'Prof. Johnson', FALSE),
  (3, 'Dr. White', FALSE),
  (4, 'Prof. Davis', FALSE),
  (5, 'Dr. Brown', FALSE),
  (6, 'Prof. Wilson', FALSE),
  (7, 'Dr. Miller', FALSE),
  (8, 'Prof. Lee', FALSE),
  (9, 'Dr. Jones', FALSE),
  (10, 'Prof. Taylor', FALSE);
  
  
SELECT DISTINCT E.STUDENTID, S.STUDENTNAME, E.COURSENAME
FROM ENROLLMENTS E
JOIN STUDENTS S ON E.STUDENTID = S.STUDENTID
WHERE E.COURSEID = 'C001';

SELECT S.STUDENTID, S.STUDENTNAME, SUM(C.UNITS) AS TOTAL_CREDITS
FROM ENROLLMENTS E
JOIN STUDENTS S ON E.STUDENTID = S.STUDENTID
JOIN COURSES C ON E.COURSEID = C.COURSEID
GROUP BY S.STUDENTID, S.STUDENTNAME;

SELECT C.COURSEID, C.COURSENAME, COUNT(E.STUDENTID) AS ENROLLED_STUDENTS
FROM COURSES C
LEFT JOIN ENROLLMENTS E ON C.COURSEID = E.COURSEID
GROUP BY C.COURSEID, C.COURSENAME;


