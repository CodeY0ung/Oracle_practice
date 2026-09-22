create table dept2(
    dno varchar2(20) primary key,
    dname varchar2(30) not null,
    tel varchar2(30) not null,
    location varchar2(30) not null
);

insert into dept2 values('OP','OPERATION','055-111-1111','changwon');
insert into dept2 values('HR','HUMAN RESOURCE','051-222-2222','busan');
insert into dept2 values('DV','DEVELOPMENT','032-333-3333','incheon');
insert into dept2 values('MK','MARKETING','02-444-4444','seoul');

create table emp2(
    eno number primary key,
    ename varchar2(30) not null,
    mobile varchar2(30) not null,
    hiredate date not null,
    dno varchar(20) not null,
    foreign key (dno) references dept2(dno)
);

insert into emp2 values(1,'James','010-1111-1111','2001-03-02','OP');
insert into emp2 values(2,'Smith','010-2222-2222','2005-05-18','HR');
insert into emp2 values(3,'Jane','010-3333-3333','2001-11-04','DV');
insert into emp2 values(4,'Candy','010-4444-4444','2001-09-20','MK');
insert into emp2 values(5,'Taylor','010-5555-5555','2001-01-10','DV');
savepoint a;
insert into emp2 values(6,'Taylor','010-5555-5555','2001-01-10','DV');
rollback to a; -- to 안붙이니까 a로 가는게 아니라 savepoint 무시하고 commit 안한 시점까지 다날라가노
desc dept2;
desc emp2;

SELECT * FROM DEPT2;
SELECT * FROM EMP2;

select * from student;
SELECT stu_no, stu_name, stu_dept from student;
select stu_name, stu_dept from student where stu_name like '조%' and stu_dept = '전기전자';
