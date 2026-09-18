create table employee(
    emp_id number(6) primary key,
    emp_no char(5) not null,
    emp_name varchar2(50) not null,
    salary number(10,2),
    birth_date date,
    hire_time timestamp
);

drop table employee;

select * from employee;

