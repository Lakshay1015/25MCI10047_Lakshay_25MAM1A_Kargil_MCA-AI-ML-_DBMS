CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees VALUES
(1, 'Rajesh', NULL, 'Management', 130000),
(2, 'Meena', 1, 'Sales', 75000),
(3, 'Suresh', 1, 'Finance', 85000),
(4, 'Anita', 2, 'Sales', 55000),
(5, 'Deepak', 2, 'Sales', 58000),
(6, 'Kavita', 3, 'Finance', 60000),
(7, 'Nitin', 3, 'Finance', 62000),
(8, 'Pallavi', 1, 'HR', 72000),
(9, 'Rohit', 1, 'IT', 90000),
(10, 'Snehal', 9, 'IT', 65000);

SELECT * FROM Employees;

CREATE OR REPLACE PROCEDURE add_employee(
    p_id INT,
    p_name VARCHAR,
    p_manager INT,
    p_dept VARCHAR,
    p_salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employees VALUES (p_id, p_name, p_manager, p_dept, p_salary);
END;
$$;

CALL add_employee(11, 'Varun', 9, 'IT', 68000);

SELECT * FROM Employees;

CREATE OR REPLACE PROCEDURE update_salary_procc(
    IN p_emp_id INT,
    INOUT p_salary NUMERIC(20,3),
    OUT status VARCHAR(20)
)
AS
$$
DECLARE
    curr_sal NUMERIC(20,3);

BEGIN
    SELECT salary + p_salary
    INTO curr_sal
    FROM employees
    WHERE emp_id = p_emp_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'EMPLOYEE NOT FOUND';
    END IF;

    UPDATE employees
    SET salary = curr_sal
    WHERE emp_id = p_emp_id;

    p_salary := curr_sal;
    status := 'SUCCESS';

EXCEPTION
    WHEN OTHERS THEN
        IF SQLERRM LIKE '%EMPLOYEE NOT FOUND%' THEN
            status := 'EMPLOYEE NOT FOUND';
        ELSE
            status := 'FAILED';
        END IF;
END;
$$
LANGUAGE plpgsql;

CALL update_salary_procc(4, 5000, NULL);

CREATE OR REPLACE PROCEDURE delete_employee(
    p_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employees
    WHERE emp_id = p_id;
END;
$$;

CALL delete_employee(5);

CREATE OR REPLACE PROCEDURE get_employee_by_id(
    IN p_emp_id INT,
    OUT p_name VARCHAR(50),
    OUT p_manager_id INT,
    OUT p_department VARCHAR(50),
    OUT p_salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT emp_name, manager_id, department, salary
    INTO p_name, p_manager_id, p_department, p_salary
    FROM Employees
    WHERE emp_id = p_emp_id;
END;
$$;

CALL get_employee_by_id(3, NULL, NULL, NULL, NULL);

