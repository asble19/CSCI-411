-- Tiny College Database Project
-- Ashley Bui
-- PostgreSQL
-- DDL, DML, and Sample Queries

-- 1. Department
CREATE TABLE Department (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Instructor
CREATE TABLE Instructor (
    InstructorID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- 3. Student
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- 4. Course
CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    InstructorID VARCHAR(10) NOT NULL,

    CONSTRAINT fk_course_department
        FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),

    CONSTRAINT fk_course_instructor
        FOREIGN KEY (InstructorID)
        REFERENCES Instructor(InstructorID)
);

-- 5. Enrollment
CREATE TABLE Enrollment (
    StudentID VARCHAR(10) NOT NULL,
    CourseID VARCHAR(10) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Grade VARCHAR(2),

    PRIMARY KEY (StudentID, CourseID),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- DML: Data Insertion
-- 1. Insert Departments
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
    ('D01', 'Computer Science'),
    ('D02', 'Mathematics');

-- 2. Insert Instructors
INSERT INTO Instructor (InstructorID, FirstName, LastName, Email)
VALUES
    ('I001', 'Sarah', 'Johnson', 'sarah.johnson@tinycollege.edu'),
    ('I002', 'Michael', 'Lee', 'michael.lee@tinycollege.edu'),
    ('I003', 'Jennifer', 'Smith', 'jennifer.smith@tinycollege.edu');

-- 3. Insert Students
INSERT INTO Student (StudentID, FirstName, LastName, Email)
VALUES
    ('S001', 'Ashley', 'Bui', 'ashley.bui@tinycollege.edu'),
    ('S002', 'Daniel', 'Nguyen', 'daniel.nguyen@tinycollege.edu'),
    ('S003', 'Emily', 'Garcia', 'emily.garcia@tinycollege.edu'),
    ('S004', 'James', 'Wilson', 'james.wilson@tinycollege.edu'),
    ('S005', 'Sophia', 'Kim', 'sophia.kim@tinycollege.edu');

-- 4. Insert Courses
INSERT INTO Course
    (CourseID, CourseName, Credits, DepartmentID, InstructorID)
VALUES
    ('C101', 'Database Systems', 3, 'D01', 'I001'),
    ('C102', 'Programming Fundamentals', 3, 'D01', 'I002'),
    ('C103', 'Data Structures', 3, 'D01', 'I001'),
    ('C201', 'College Algebra', 3, 'D02', 'I003'),
    ('C202', 'Statistics', 3, 'D02', 'I003');

-- 5. Insert Enrollments
INSERT INTO Enrollment
    (StudentID, CourseID, EnrollmentDate, Grade)
VALUES
    ('S001', 'C101', '2026-09-01', 'A'),
    ('S001', 'C102', '2026-09-01', 'B+'),
    ('S002', 'C101', '2026-09-02', 'A-'),
    ('S002', 'C103', '2026-09-02', 'B'),
    ('S003', 'C102', '2026-09-03', 'A'),
    ('S003', 'C201', '2026-09-03', 'B+'),
    ('S004', 'C103', '2026-09-04', 'A-'),
    ('S005', 'C201', '2026-09-04', 'A');

-- Sample Queries
-- 1. Student Enrollments
SELECT
    s.StudentID,
    s.FirstName || ' ' || s.LastName AS StudentName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate,
    e.Grade
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
ORDER BY s.StudentID, c.CourseID;


-- 2. Course Offerings
SELECT
    c.CourseID,
    c.CourseName,
    c.Credits,
    d.DepartmentName
FROM Course c
JOIN Department d ON c.DepartmentID = d.DepartmentID
ORDER BY c.CourseID;


-- 3. Instructor Assignments
SELECT
    i.InstructorID,
    i.FirstName || ' ' || i.LastName AS InstructorName,
    c.CourseID,
    c.CourseName
FROM Instructor i
JOIN Course c ON i.InstructorID = c.InstructorID
ORDER BY i.InstructorID, c.CourseID;


-- 4. Department Details
SELECT
    d.DepartmentID,
    d.DepartmentName,
    c.CourseID,
    c.CourseName
FROM Department d
LEFT JOIN Course c ON d.DepartmentID = c.DepartmentID
ORDER BY d.DepartmentID, c.CourseID;