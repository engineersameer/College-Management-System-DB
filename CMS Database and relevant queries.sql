CREATE TABLE Student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email_address VARCHAR(100),
    type VARCHAR(50),
    GPA DECIMAL(3, 2)
);
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    prerequisite VARCHAR(100),
    description TEXT,
    credit_hours INT
);

CREATE TABLE Course_Enrollment (
    enrollment_id INT PRIMARY KEY,
    type VARCHAR(50),
    date DATE,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
CREATE TABLE Program (
    program_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    type VARCHAR(50)
);

CREATE TABLE Program_Enrollment (
    enrollment_id INT PRIMARY KEY,
    type VARCHAR(50),
    date DATE,
    student_id INT,
    program_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id)
);

CREATE TABLE Department (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(100)
);

CREATE TABLE Course_Department (
    dep_id INT,
    course_id INT,
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
CREATE TABLE College (
    college_id INT PRIMARY KEY,
    college_name VARCHAR(100),
    college_address VARCHAR(255)
);
CREATE TABLE College_Department (
    college_id INT,
    dep_id INT,
    FOREIGN KEY (college_id) REFERENCES College(college_id),
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id)
);
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(100)
);



CREATE TABLE Administrator (
    admin_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone_no VARCHAR(20),
    email VARCHAR(100),
    position VARCHAR(100),
    level VARCHAR(100),
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES College(college_id)
);
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone_no VARCHAR(20),
    email VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES College(college_id)
);
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone_no VARCHAR(20),
    email VARCHAR(100),
    position VARCHAR(100),
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES College(college_id)
);
CREATE TABLE Faculty_Assignment (
    assign_id INT PRIMARY KEY,
    assignment_type VARCHAR(100),
    start_date DATE,
    end_date DATE,
    recurring_type VARCHAR(100),
    specific_days VARCHAR(100),
    faculty_id INT,
    department_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (department_id) REFERENCES Department(dep_id)
);
ALTER TABLE Administrator
ADD COLUMN user_name VARCHAR(100),
ADD COLUMN password VARCHAR(100);
ALTER TABLE Faculty
ADD COLUMN user_name VARCHAR(100),
ADD COLUMN password VARCHAR(100);
ALTER TABLE Staff
ADD COLUMN user_name VARCHAR(100),
ADD COLUMN password VARCHAR(100);

CREATE TABLE Admin_Role (
    admin_id INT,
    role_id INT,
    FOREIGN KEY (admin_id) REFERENCES Administrator(admin_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
CREATE TABLE Staff_Role (
    staff_id INT,
    role_id INT,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
CREATE TABLE Faculty_Role (
    faculty_id INT,
    role_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

INSERT INTO Student (id, first_name, last_name, phone_number, email_address, type, GPA)
VALUES
(1, 'John', 'Doe', '555-1234', 'john.doe@example.com', 'Regular', 3.8),
(2, 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', 'Regular', 3.9),
(3, 'Alice', 'Johnson', '555-9012', 'alice.johnson@example.com', 'Regular', 3.7),
(4, 'Bob', 'Williams', '555-3456', 'bob.williams@example.com', 'Regular', 4.0),
(5, 'Emily', 'Brown', '555-6789', 'emily.brown@example.com', 'Regular', 3.5);

INSERT INTO College (college_id, college_name, college_address)
VALUES
(1, 'ABC College', '123 Main St'),
(2, 'XYZ College', '456 Elm St');

-- Insert data into the Department table
INSERT INTO Department (dep_id, dep_name)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'English'),
(4, 'History'),
(5, 'Biology');

-- Insert data into the Role table
INSERT INTO Role (role_id, role_name)
VALUES
(1, 'Admin'),
(2, 'Professor'),
(3, 'Associate Professor'),
(4, 'Secretary'),
(5, 'Custodian');

-- Insert data into the Administrator table
INSERT INTO Administrator (admin_id, first_name, last_name, address, phone_no, email, position, user_name, password, college_id)
VALUES
(1, 'Alice', 'Smith', '123 Oak St', '555-1234', 'alice.smith@example.com', 'Admin', 'alice_admin', 'adminpass123', 1),
(2, 'Bob', 'Johnson', '456 Elm St', '555-5678', 'bob.johnson@example.com', 'Admin', 'bob_admin', 'adminpass456', 2),
(3, 'Charlie', 'Williams', '789 Pine St', '555-9012', 'charlie.williams@example.com', 'Admin', 'charlie_admin', 'adminpass789', 1),
(4, 'David', 'Brown', '101 Maple St', '555-3456', 'david.brown@example.com', 'Admin', 'david_admin', 'adminpass101', 2),
(5, 'Eva', 'Davis', '543 Birch St', '555-6789', 'eva.davis@example.com', 'Admin', 'eva_admin', 'adminpass543', 1);

-- Insert data into the Faculty table
INSERT INTO Faculty (faculty_id, first_name, last_name, address, phone_no, email, position, user_name, password, college_id)
VALUES
(1, 'Frank', 'Miller', '321 Elm St', '555-2345', 'frank.miller@example.com', 'Professor', 'frank_prof', 'profpwd123', 1),
(2, 'Grace', 'Wilson', '789 Oak St', '555-6789', 'grace.wilson@example.com', 'Associate Professor', 'grace_assoc', 'assocpwd456', 2),
(3, 'Hannah', 'Taylor', '543 Pine St', '555-0123', 'hannah.taylor@example.com', 'Professor', 'hannah_prof', 'profpwd789', 1),
(4, 'Isaac', 'Anderson', '101 Maple St', '555-4567', 'isaac.anderson@example.com', 'Associate Professor', 'isaac_assoc', 'assocpwd101', 2),
(5, 'Jasmine', 'Clark', '456 Elm St', '555-8901', 'jasmine.clark@example.com', 'Professor', 'jasmine_prof', 'profpwd543', 1);

-- Insert data into the Staff table
INSERT INTO Staff (staff_id, first_name, last_name, address, phone_no, email, position, salary, user_name, password, college_id)
VALUES
(1, 'Liam', 'Martinez', '123 Pine St', '555-5678', 'liam.martinez@example.com', 'Secretary', 40000, 'liam_sec', 'secpwd123', 1),
(2, 'Olivia', 'Garcia', '456 Birch St', '555-9012', 'olivia.garcia@example.com', 'Custodian', 35000, 'olivia_cust', 'custpwd456', 2),
(3, 'Mason', 'Rodriguez', '789 Oak St', '555-2345', 'mason.rodriguez@example.com', 'Secretary', 40000, 'mason_sec', 'secpwd789', 1),
(4, 'Sophia', 'Hernandez', '101 Maple St', '555-6789', 'sophia.hernandez@example.com', 'Custodian', 35000, 'sophia_cust', 'custpwd101', 2),
(5, 'Logan', 'Lopez', '543 Elm St', '555-0123', 'logan.lopez@example.com', 'Secretary', 40000, 'logan_sec', 'secpwd543', 1);

-- Insert data into the Faculty_Assignment table
INSERT INTO Faculty_Assignment (assign_id, assignment_type, start_date, end_date, recurring_type, specific_days, faculty_id, department_id)
VALUES
(1, 'Teaching', '2024-01-01', '2024-05-31', 'Weekly', 'Monday, Wednesday, Friday', 1, 1),
(2, 'Research', '2024-02-01', '2024-12-31', 'Monthly', '1st of each month', 2, 2),
(3, 'Administration', '2024-03-01', '2024-06-30', 'Weekly', 'Tuesday, Thursday', 3, 3),
(4, 'Teaching', '2024-04-01', '2024-07-31', 'Daily', '', 4, 4),
(5, 'Research', '2024-05-01', '2024-08-31', 'Weekly', 'Wednesday', 5, 5);

-- Insert data into the Program table
INSERT INTO Program (program_id, name, description, type)
VALUES
(1, 'Computer Science', 'Bachelor of Science in Computer Science', 'Undergraduate'),
(2, 'Mathematics', 'Bachelor of Arts in Mathematics', 'Undergraduate'),
(3, 'English Literature', 'Bachelor of Arts in English Literature', 'Undergraduate'),
(4, 'History', 'Bachelor of Arts in History', 'Undergraduate'),
(5, 'Biology', 'Bachelor of Science in Biology', 'Undergraduate');

-- Insert data into the Program_Enrollment table
INSERT INTO Program_Enrollment (enrollment_id, type, date, student_id, program_id)
VALUES
(1, 'Regular', '2023-09-01', 1, 1),
(2, 'Regular', '2023-09-01', 2, 2),
(3, 'Regular', '2023-09-01', 3, 3),
(4, 'Regular', '2023-09-01', 4, 4),
(5, 'Regular', '2023-09-01', 5, 5);

-- Insert data into the Course table
INSERT INTO Course (course_id, course_name, prerequisite, description, credit_hours)
VALUES
(1, 'Introduction to Computer Science', 'None', 'Introduction to the basic concepts of computer science.', 3),
(2, 'Calculus I', 'None', 'Introduction to differential and integral calculus.', 4),
(3, 'English Composition', 'None', 'Developing skills in written communication.', 3),
(4, 'World History', 'None', 'Survey of world history from ancient civilizations to the present.', 3),
(5, 'Biology 101', 'None', 'Introduction to biology.', 4);

-- Insert data into the Enrollment table
INSERT INTO Course_Enrollment (enrollment_id, type, date, student_id, course_id)
VALUES
(1, 'Regular', '2023-09-01', 1, 1),
(2, 'Regular', '2023-09-01', 2, 2),
(3, 'Regular', '2023-09-01', 3, 3),
(4, 'Regular', '2023-09-01', 4, 4),
(5, 'Regular', '2023-09-01', 5, 5);

-- Insert data into the Faculty_Role table
INSERT INTO Faculty_Role (faculty_id, role_id)
VALUES
(1, 2),
(2, 3),
(3, 2),
(4, 3),
(5, 2);

-- Insert data into the Staff_Role table
INSERT INTO Staff_Role (staff_id, role_id)
VALUES
(1, 4),
(2, 5),
(3, 4),
(4, 5),
(5, 4);

-- Insert data into the College_Department table
INSERT INTO College_Department (college_id, dep_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5);

-- Insert data into the Admin_Role table
INSERT INTO Admin_Role (admin_id, role_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- Insert data into the Department_Course table
INSERT INTO Course_Department (dep_id, course_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Additional rows for Student table
INSERT INTO Student (id, first_name, last_name, phone_number, email_address, type, GPA)
VALUES
(6, 'Michael', 'Johnson', '555-9876', 'michael.johnson@example.com', 'Regular', 3.6),
(7, 'Sarah', 'Martinez', '555-5432', 'sarah.martinez@example.com', 'Regular', 3.2),
(8, 'William', 'Garcia', '555-6543', 'william.garcia@example.com', 'Regular', 3.9),
(9, 'Olivia', 'Brown', '555-7654', 'olivia.brown@example.com', 'Regular', 3.4),
(10, 'Ethan', 'Lee', '555-8765', 'ethan.lee@example.com', 'Regular', 3.8);

-- Additional rows for College table
INSERT INTO College (college_id, college_name, college_address)
VALUES
(3, 'LMN College', '789 Pine St'),
(4, 'PQR College', '101 Maple St'),
(5, 'STU College', '543 Birch St'),
(6, 'VWX College', '987 Oak St'),
(7, 'YZA College', '210 Cedar St');

-- Additional rows for Department table
INSERT INTO Department (dep_id, dep_name)
VALUES
(6, 'Physics'),
(7, 'Chemistry'),
(8, 'Psychology'),
(9, 'Sociology'),
(10, 'Economics');

-- Additional rows for Role table
INSERT INTO Role (role_id, role_name)
VALUES
(6, 'Librarian'),
(7, 'Registrar'),
(8, 'Admissions Officer'),
(9, 'Financial Aid Officer'),
(10, 'Career Counselor');

-- Additional rows for Administrator table
INSERT INTO Administrator (admin_id, first_name, last_name, address, phone_no, email, position, user_name, password, college_id)
VALUES
(6, 'Gabriel', 'Anderson', '321 Elm St', '555-4321', 'gabriel.anderson@example.com', 'Admin', 'gabriel_admin', 'adminpass654', 3),
(7, 'Sophie', 'Hernandez', '987 Oak St', '555-7654', 'sophie.hernandez@example.com', 'Admin', 'sophie_admin', 'adminpass765', 4),
(8, 'Jackson', 'Lopez', '210 Cedar St', '555-8765', 'jackson.lopez@example.com', 'Admin', 'jackson_admin', 'adminpass876', 5),
(9, 'Chloe', 'Kim', '543 Elm St', '555-9876', 'chloe.kim@example.com', 'Admin', 'chloe_admin', 'adminpass987', 6),
(10, 'Daniel', 'Wang', '789 Pine St', '555-0123', 'daniel.wang@example.com', 'Admin', 'daniel_admin', 'adminpass012', 7);

-- Additional rows for Faculty table
INSERT INTO Faculty (faculty_id, first_name, last_name, address, phone_no, email, position, user_name, password, college_id)
VALUES
(6, 'Natalie', 'Chen', '456 Birch St', '555-5432', 'natalie.chen@example.com', 'Professor', 'natalie_prof', 'profpwd234', 3),
(7, 'Aaron', 'Gonzalez', '123 Pine St', '555-6543', 'aaron.gonzalez@example.com', 'Associate Professor', 'aaron_assoc', 'assocpwd345', 4),
(8, 'Sophia', 'Kim', '789 Oak St', '555-7654', 'sophia.kim@example.com', 'Professor', 'sophia_prof', 'profpwd456', 5),
(9, 'Elijah', 'Liu', '101 Maple St', '555-8765', 'elijah.liu@example.com', 'Associate Professor', 'elijah_assoc', 'assocpwd567', 6),
(10, 'Hailey', 'Patel', '543 Elm St', '555-9876', 'hailey.patel@example.com', 'Professor', 'hailey_prof', 'profpwd678', 7);

-- Additional rows for Staff table
INSERT INTO Staff (staff_id, first_name, last_name, address, phone_no, email, position, salary, user_name, password, college_id)
VALUES
(6, 'Jacob', 'Nguyen', '321 Elm St', '555-0123', 'jacob.nguyen@example.com', 'Secretary', 40000, 'jacob_sec', 'secpwd234', 3),
(7, 'Emma', 'Rivera', '987 Oak St', '555-1234', 'emma.rivera@example.com', 'Custodian', 35000, 'emma_cust', 'custpwd345', 4),
(8, 'Michael', 'Wang', '210 Cedar St', '555-2345', 'michael.wang@example.com', 'Secretary', 40000, 'michael_sec', 'secpwd456', 5),
(9, 'Madison', 'Khan', '543 Elm St', '555-3456', 'madison.khan@example.com', 'Custodian', 35000, 'madison_cust', 'custpwd567', 6),
(10, 'Alexander', 'Gomez', '789 Pine St', '555-4567', 'alexander.gomez@example.com', 'Secretary', 40000, 'alexander_sec', 'secpwd678', 7);

-- Additional rows for Faculty_Assignment table
INSERT INTO Faculty_Assignment (assign_id, assignment_type, start_date, end_date, recurring_type, specific_days, faculty_id, department_id)
VALUES
(6, 'Teaching', '2024-06-01', '2024-10-31', 'Weekly', 'Tuesday, Thursday', 6, 6),
(7, 'Research', '2024-07-01', '2024-12-31', 'Monthly', '15th of each month', 7, 7),
(8, 'Administration', '2024-08-01', '2024-12-31', 'Weekly', 'Friday', 8, 8),
(9, 'Teaching', '2024-09-01', '2025-01-31', 'Daily', '', 9, 9),
(10, 'Research', '2024-10-01', '2025-02-28', 'Weekly', 'Thursday', 10, 10);

-- Additional rows for Program table
INSERT INTO Program (program_id, name, description, type)
VALUES
(6, 'Physics', 'Bachelor of Science in Physics', 'Undergraduate'),
(7, 'Chemistry', 'Bachelor of Science in Chemistry', 'Undergraduate'),
(8, 'Psychology', 'Bachelor of Arts in Psychology', 'Undergraduate'),
(9, 'Sociology', 'Bachelor of Arts in Sociology', 'Undergraduate'),
(10, 'Economics', 'Bachelor of Science in Economics', 'Undergraduate');

-- Additional rows for Program_Enrollment table
INSERT INTO Program_Enrollment (enrollment_id, type, date, student_id, program_id)
VALUES
(6, 'Regular', '2023-09-01', 6, 6),
(7, 'Regular', '2023-09-01', 7, 7),
(8, 'Regular', '2023-09-01', 8, 8),
(9, 'Regular', '2023-09-01', 9, 9),
(10, 'Regular', '2023-09-01', 10, 10);

-- Additional rows for Course table
INSERT INTO Course (course_id, course_name, prerequisite, description, credit_hours)
VALUES
(6, 'Physics 101', 'None', 'Introduction to physics.', 4),
(7, 'Chemistry 101', 'None', 'Introduction to chemistry.', 4),
(8, 'Psychology 101', 'None', 'Introduction to psychology.', 3),
(9, 'Sociology 101', 'None', 'Introduction to sociology.', 3),
(10, 'Microeconomics', 'None', 'Introduction to microeconomics.', 3);

-- Additional rows for Course_Enrollment table
INSERT INTO Course_Enrollment (enrollment_id, type, date, student_id, course_id)
VALUES
(6, 'Regular', '2023-09-01', 6, 6),
(7, 'Regular', '2023-09-01', 7, 7),
(8, 'Regular', '2023-09-01', 8, 8),
(9, 'Regular', '2023-09-01', 9, 9),
(10, 'Regular', '2023-09-01', 10, 10);

-- Additional rows for Faculty_Role table
INSERT INTO Faculty_Role (faculty_id, role_id)
VALUES
(6, 2),
(7, 3),
(8, 2),
(9, 3),
(10, 2);

-- Additional rows for Staff_Role table
INSERT INTO Staff_Role (staff_id, role_id)
VALUES
(6, 4),
(7, 5),
(8, 4),
(9, 5),
(10, 4);

-- Additional rows for College_Department table
INSERT INTO College_Department (college_id, dep_id)
VALUES
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10);

-- Additional rows for Admin_Role table
INSERT INTO Admin_Role (admin_id, role_id)
VALUES
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- Additional rows for Department_Course table
INSERT INTO Course_Department (dep_id, course_id)
VALUES
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Queries 


-- 3 
SELECT S.first_name, S.last_name, C.course_name
FROM Student S
JOIN Course_Enrollment CE ON S.id = CE.student_id
JOIN Course C ON CE.course_id = C.course_id
WHERE C.course_name = 'Introduction to Computer Science';

-- 4    
SELECT 
    FA.assign_id,
    FA.assignment_type,
    FA.start_date,
    FA.end_date,
    FA.recurring_type,
    FA.specific_days,
    F.first_name AS faculty_first_name,
    F.last_name AS faculty_last_name,
    D.dep_name AS department_name,
    C.course_name
FROM 
    Faculty_Assignment FA
JOIN 
    Faculty F ON FA.faculty_id = F.faculty_id
JOIN 
    Department D ON FA.department_id = D.dep_id
JOIN 
    Course C ON D.dep_id = C.course_id
WHERE 
    (FA.start_date >= '2002-10-10' AND FA.end_date <= '2050-10-10');

-- 5 
SELECT DISTINCT F.first_name, F.last_name
FROM Faculty F
JOIN Faculty_Assignment FA1 ON F.faculty_id = FA1.faculty_id
JOIN Faculty_Assignment FA2 ON F.faculty_id = FA2.faculty_id
WHERE FA1.department_id <> FA2.department_id
AND (
    (FA1.start_date BETWEEN FA2.start_date AND FA2.end_date)
    OR (FA1.end_date BETWEEN FA2.start_date AND FA2.end_date)
    OR (FA2.start_date BETWEEN FA1.start_date AND FA1.end_date)
    OR (FA2.end_date BETWEEN FA1.start_date AND FA1.end_date)
);


-- 6
SELECT 
    F.faculty_id,
    F.first_name,
    F.last_name,
    COUNT(FA.assign_id) AS num_assignments
FROM 
    Faculty F
JOIN 
    Faculty_Assignment FA ON F.faculty_id = FA.faculty_id
JOIN 
    Department D ON FA.department_id = D.dep_id
WHERE 
    D.dep_name = 'Biology'
    AND (FA.start_date >= '2000-10-10' AND FA.end_date <= '2050-10-10')
GROUP BY 
    F.faculty_id, F.first_name, F.last_name
ORDER BY 
    num_assignments ASC
LIMIT 1;


-- 7
SELECT 
    F.faculty_id,
    F.first_name,
    F.last_name,
    COUNT(FA.assign_id) AS num_assignments
FROM 
    Faculty F
JOIN 
    Faculty_Assignment FA ON F.faculty_id = FA.faculty_id
JOIN 
    Department D ON FA.department_id = D.dep_id
WHERE 
    D.dep_name = 'Biology'
GROUP BY 
    F.faculty_id, F.first_name, F.last_name
ORDER BY 
    num_assignments DESC
LIMIT 1;

-- 8
SELECT DISTINCT S.first_name, S.last_name, CE1.course_id, CE1.type
FROM Student S
JOIN Course_Enrollment CE1 ON S.id = CE1.student_id
JOIN Course_Enrollment CE2 ON S.id = CE2.student_id
    AND CE1.course_id = CE2.course_id
    AND CE1.type = CE2.type
    AND CE1.enrollment_id <> CE2.enrollment_id;



-- 9 
SELECT DISTINCT S.first_name, S.last_name, CE1.course_id, CE2.course_id
FROM Student S
JOIN Course_Enrollment CE1 ON S.id = CE1.student_id
JOIN Course_Enrollment CE2 ON S.id = CE2.student_id
    AND CE1.course_id <> CE2.course_id;





-- Additinal 10 Queries 


-- List of Faculty Members with Their Assignments:
SELECT F.first_name, F.last_name, FA.assignment_type, D.dep_name
FROM Faculty F
JOIN Faculty_Assignment FA ON F.faculty_id = FA.faculty_id
JOIN Department D ON FA.department_id = D.dep_id;

-- Number of Students Enrolled in Each Course:
SELECT C.course_name, COUNT(CE.enrollment_id) AS num_students
FROM Course C
LEFT JOIN Course_Enrollment CE ON C.course_id = CE.course_id
GROUP BY C.course_name;

-- Average GPA of Students in Each Department:
SELECT D.dep_name, AVG(S.GPA) AS avg_gpa
FROM Department D
JOIN Course_Department CD ON D.dep_id = CD.dep_id
JOIN Course C ON CD.course_id = C.course_id
JOIN Course_Enrollment CE ON C.course_id = CE.course_id
JOIN Student S ON CE.student_id = S.id
GROUP BY D.dep_name;

-- List of Courses with Prerequisites NUll
SELECT C.course_name, C.prerequisite
FROM Course C
WHERE C.prerequisite IS NULL;

-- List of Faculty Members with Their Roles:

SELECT F.first_name, F.last_name, R.role_name
FROM Faculty F
JOIN Faculty_Role FR ON F.faculty_id = FR.faculty_id
JOIN Role R ON FR.role_id = R.role_id;

-- Number of Faculty Assignments by Assignment Type
SELECT assignment_type, COUNT(*) AS num_assignments
FROM Faculty_Assignment
GROUP BY assignment_type;

--  List of Administrators with Their Roles
SELECT A.first_name, A.last_name, R.role_name
FROM Administrator A
JOIN Admin_Role AR ON A.admin_id = AR.admin_id
JOIN Role R ON AR.role_id = R.role_id;


-- Number of Students Enrolled in Each Course
SELECT C.course_name, COUNT(CE.enrollment_id) AS num_students
FROM Course C
JOIN Course_Enrollment CE ON C.course_id = CE.course_id
GROUP BY C.course_name;

-- List of Students with GPA below 3.0
SELECT first_name, last_name, GPA
FROM Student
WHERE GPA > 3.5;

-- Average Salary of Staff by Position
SELECT position, AVG(salary) AS avg_salary
FROM Staff
GROUP BY position;





    
    