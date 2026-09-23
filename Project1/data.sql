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