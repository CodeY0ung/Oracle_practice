-- transaction 연습
-- 하나의 일의 과정이 동시에 전부 수행되어야만 commit이 발생하게끔.
-- 과정 중 하나라도 불발되면 commit이 되지않아야 함.
-- java에서 같은 connection 객체에서 같은 transaction이 일어난다.
-- connection 객체 단위로 transaction이 발생함.

--ddl은 실행시 앞에 안했던 commit이 자동으로 실행됨.
-- rocking에 대해서.. 
-- 행에 걸면 같은 테이블에서 동시에 작업 가능. 
-- 동시에 같은 행만 건드리지 않으면 됨.
create table test_tcl(
    no number primary key,
    msq varchar2(100),
    writer varchar2(20)
);

create table test_tcl2(
    no number primary key,
    msq varchar2(100),
    writer varchar2(20)
);

truncate table test_tcl;

insert into test_tcl values(1,'test 1 msg...', 'admin');
insert into test_tcl2 values(1,'hello~', 'james');
insert into test_tcl values(3,'hello~good morning~', 'ann');
commit;

select * from test_tcl;
select * from test_tcl2;

insert into test_tcl values(4,'hello~good afternoon~', 'john');

insert into test_tcl values(5,'hello~good evening~', 'yen');
rollback;

create table account(
    id number primary key,
    balance number
);

INSERT INTO account VALUES(1,10000);
INSERT INTO account VALUES(2,10000);
INSERT INTO account VALUES(3,10000);
COMMIT;

select * from account;