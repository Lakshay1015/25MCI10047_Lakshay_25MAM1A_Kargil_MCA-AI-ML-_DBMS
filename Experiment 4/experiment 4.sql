create table employees(
e_id serial primary key, 
e_name varchar(50),
e_salary numeric(10,2)
);

insert into employees (e_name, e_salary) values
('Lakshay', 40000),
('Neha', 50000),
('Tushar', 48000),
('Sam', 35000),
('Diya', 49000);

do $$
begin
    for i in 1..5 loop
        raise notice 'Iteration Number: %', i;
    end loop;
end;
$$ ;

do $$
declare
    emp_rec RECORD;
begin
    for emp_rec in
        select e_id, e_name from employees
    loop
        raise notice 'Employee ID: %, Name: %', emp_rec.e_id, emp_rec.e_name;
    end loop;
end;
$$;

--step3
do $$
declare
    counter INT := 1;
begin
    while counter <= 5 loop
        raise notice 'Counter value: %', counter;
        counter := counter + 1;
    end loop;
end;
$$ ;

--step4

do $$
declare
    counter int := 1;
begin
    loop
        raise notice 'Counter value: %', counter;
        counter := counter + 1;
        exit when counter > 5;
    end loop;
end;
$$ ;

--step5

do $$
declare
	emp_rec RECORD;
begin
    for emp_rec in
        select e_id, e_salary from employees
    loop
        update employees
        set e_salary = e_salary * 1.10
        where e_id = emp_rec.e_id;

        raise notice 'Updated salary for Employee ID: %', emp_rec.e_id;
    end loop;
end;
$$ ;

--step6
do $$
declare
	emp_rec RECORD;
begin
    for emp_rec in
        select e_id, e_salary from employees
    loop
        if emp_rec.e_salary > 50000 then
            raise notice 'Employee ID % has salary more than 40000', emp_rec.e_id;
        else
            raise notice 'Employee ID % has salary less than 40000', emp_rec.e_id;
        end if;
    end loop;
end;
$$;


