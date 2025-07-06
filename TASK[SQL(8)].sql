DROP TABLE IF EXISTS employee_data;

CREATE TABLE employee_data (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    date_of_joining DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    status VARCHAR(20),
    location VARCHAR(50),
    rating FLOAT
);

INSERT INTO employee_data VALUES
(1, 'John', 'Doe', 'IT', 'Developer', 60000, '2020-01-15', 'john.doe@example.com', '9876543210', 'Active', 'New York', 4.5),
(2, 'Jane', 'Smith', 'HR', 'Manager', 75000, '2019-03-10', 'jane.smith@example.com', '8765432109', 'Active', 'Chicago', 4.2),
(3, 'Mike', 'Brown', 'Finance', 'Analyst', 55000, '2021-06-01', 'mike.brown@example.com', '7654321098', 'Inactive', 'Boston', 3.8),
(4, 'Emily', 'Davis', 'IT', 'Tester', 50000, '2022-01-20', 'emily.davis@example.com', '6543210987', 'Active', 'Seattle', 4.0),
(5, 'David', 'Wilson', 'Sales', 'Executive', 45000, '2018-10-05', 'david.wilson@example.com', '5432109876', 'Active', 'Houston', 3.9),
(6, 'Sarah', 'Miller', 'IT', 'Support', 40000, '2023-04-25', 'sarah.miller@example.com', '4321098765', 'Active', 'Phoenix', 4.1),
(7, 'Chris', 'Anderson', 'Finance', 'Manager', 80000, '2017-07-17', 'chris.anderson@example.com', '3210987654', 'Inactive', 'Atlanta', 4.6),
(8, 'Laura', 'Thomas', 'HR', 'Recruiter', 47000, '2020-08-30', 'laura.thomas@example.com', '2109876543', 'Active', 'Dallas', 4.0),
(9, 'Daniel', 'Jackson', 'Sales', 'Executive', 46000, '2021-09-12', 'daniel.jackson@example.com', '1098765432', 'Active', 'Miami', 3.7),
(10, 'Olivia', 'Martin', 'IT', 'Developer', 61000, '2022-11-14', 'olivia.martin@example.com', '1987654321', 'Active', 'Denver', 4.3),
(11, 'Peter', 'Clark', 'Marketing', 'Coordinator', 43000, '2023-01-01', 'peter.clark@example.com', '1234567890', 'Active', 'San Diego', 3.5),
(12, 'Sophia', 'Lee', 'Marketing', 'Manager', 72000, '2019-12-12', 'sophia.lee@example.com', '2345678901', 'Active', 'Las Vegas', 4.4);

select *from employee_data;

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept (
    IN dept_name VARCHAR(50)
)
BEGIN
    IF EXISTS (SELECT 1 FROM employee_data WHERE department = dept_name) THEN
        SELECT * FROM employee_data WHERE department = dept_name;
    ELSE
        SELECT 'No employees found in the given department.' AS Message;
    END IF;
END $$

DELIMITER ;

CALL GetEmployeesByDept('IT');

DELIMITER $$

CREATE FUNCTION GetEmpCountByLocation(loc VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count FROM employee_data WHERE location = loc;
    RETURN emp_count;
END $$

DELIMITER ;

SELECT GetEmpCountByLocation('Chicago') AS EmpCount;
