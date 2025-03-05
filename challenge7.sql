-- challenge7.sql

-- *******************************
-- Database Setup: CompanyDB
-- *******************************
-- (For SQLite, just open or create the database file. For MySQL/PostgreSQL, you might need a CREATE DATABASE statement.)

-- *******************************
-- Table Creation: Employees
-- *******************************
CREATE TABLE IF NOT EXISTS Employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary INTEGER
);

-- *******************************
-- Inserting Sample Data
-- *******************************
INSERT INTO Employees (first_name, last_name, email, department, salary)
VALUES
    ('Alice', 'Smith', 'alice.smith@example.com', 'Engineering', 75000),
    ('Bob', 'Johnson', 'bob.johnson@example.com', 'Marketing', 55000),
    ('Charlie', 'Brown', 'charlie.brown@example.com', 'Sales', 50000),
    ('Diana', 'Prince', 'diana.prince@example.com', 'Engineering', 80000),
    ('Evan', 'Davis', 'evan.davis@example.com', 'Human Resources', 60000);

-- *******************************
-- Query 1: Select All Records
-- *******************************
SELECT * FROM Employees;

-- *******************************
-- Query 2: Filter by Department (Engineering)
-- *******************************
SELECT first_name, last_name, email 
FROM Employees
WHERE department = 'Engineering';

-- *******************************
-- Query 3: Sort by Salary (Descending Order)
-- *******************************
SELECT * FROM Employees
ORDER BY salary DESC;

-- *******************************
-- Query 4: Calculate Average Salary
-- *******************************
SELECT AVG(salary) AS average_salary
FROM Employees;

-- *******************************
-- Query 5: Insert a New Record
-- *******************************
INSERT INTO Employees (first_name, last_name, email, department, salary)
VALUES ('Frank', 'Miller', 'frank.miller@example.com', 'Finance', 65000);

-- *******************************
-- Query 6: Update an Existing Record
-- (Update salary of employee with id = 3 to 52000)
-- *******************************
UPDATE Employees
SET salary = 52000
WHERE id = 3;

-- *******************************
-- Query 7: Delete a Record
-- (Delete the employee with id = 5)
-- *******************************
DELETE FROM Employees
WHERE id = 5;

-- *******************************
-- Query 8: Count Employees by Department
-- *******************************
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;

-- *******************************
-- Query 9: Retrieve High Earners
-- (List full names of employees earning more than 70000)
-- *******************************
SELECT first_name || ' ' || last_name AS full_name
FROM Employees
WHERE salary > 70000;

-- *******************************
-- Query 10: Complex Query – Conditional Filtering
-- (Select employees whose salary is below the company average)
-- *******************************
SELECT first_name || ' ' || last_name AS full_name, department, salary
FROM Employees
WHERE salary < (SELECT AVG(salary) FROM Employees);
