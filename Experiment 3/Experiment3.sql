CREATE TABLE Violations (
    id INT PRIMARY KEY,             
    Entity_Name VARCHAR(100),       
    Violation_count INT              
);

INSERT INTO Violations VALUES
(1, 'Passenger_data', 11),
(2, 'Payment_data', 6),
(3, 'Booking_data', 20),
(4, 'Seat_data', 2),
(5, 'Refund_data', 0),
(6, 'Staff_data', 12);


SELECT*FROM Violations;

SELECT 
    Entity_name,
    Violation_count,
    CASE
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
        WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
        ELSE 'Critical Violation'
    END AS Violation_Status
FROM Violations;


ALTER TABLE Violations
ADD COLUMN approval_status VARCHAR(30);

select * from Violations;

UPDATE Violations
SET approval_status =
    CASE
        WHEN violation_count = 0 THEN 'Approved'
        WHEN violation_count BETWEEN 1 AND 15 THEN 'Needs Review'
        ELSE 'Rejected'
    END;




DO $$
DECLARE
    v_violation_count INT := 12; 
BEGIN

    IF v_violation_count = 0 THEN
        RAISE NOTICE 'Status: Approved — No violations found';

    ELSIF v_violation_count BETWEEN 1 AND 5 THEN
        RAISE NOTICE 'Status: Needs Review — Minor violations detected';

    ELSIF v_violation_count BETWEEN 6 AND 15 THEN
        RAISE NOTICE 'Status: Needs Review — Moderate violations detected';

    ELSE
        RAISE NOTICE 'Status: Rejected — Critical violations detected';

    END IF;

END $$;

CREATE TABLE Grades (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);


INSERT INTO Grades (student_name, marks) VALUES
('Lakshay', 95),
('Neha', 82),
('Tushar', 68),
('Priya', 91),
('Sam', 56),
('Diya', 45),
('Tanu', 77),
('Sneha', 88);



SELECT 
    student_name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'A+ Grade'
        WHEN marks BETWEEN 80 AND 89 THEN 'A Grade'
        WHEN marks BETWEEN 70 AND 79 THEN 'B Grade'
        WHEN marks BETWEEN 60 AND 69 THEN 'C Grade'
        WHEN marks BETWEEN 40 AND 59 THEN 'D Grade'
        ELSE 'Fail'
    END AS Grade
FROM Grades;



SELECT 
    entity_name,
    violation_count,
    CASE
        WHEN violation_count > 15 THEN 'Critical Violation'
        WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
        WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
        ELSE 'No Violation'
    END AS Violation_Severity
FROM Violations
ORDER BY
    CASE
        WHEN violation_count > 15 THEN 1   
        WHEN violation_count BETWEEN 6 AND 15 THEN 2
        WHEN violation_count BETWEEN 1 AND 5 THEN 3
        ELSE 4                              
    END;