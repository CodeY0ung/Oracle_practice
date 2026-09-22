-- trigger : 트리거
-- 어떤 이벤트 발생 시 다른 이벤트도 연달아서 발생
desc emp;
-- emp 테이블 복사 (제약조건은 복사되지 않는다)
create table emp_copy
as 
select * from emp;

desc emp_copy;
select * from emp_copy;


-- 백업용 테이블 생성 - emp_copy 테이블의 구조만 복사
create table bq_emp_copy
as
select * from emp_copy
where 1 = 0;

select * from bq_emp_copy;

-- 삭제 일시 저장용 컬럼 추가
alter table bq_emp_copy add deleted_at TIMESTAMP;
desc bq_emp_copy;

-- 제약조건 추가
alter table emp_copy add constraint pk_emp_copy primary key(empno);
alter table emp_copy add constraint fk_emp_copy foreign key(deptno) references dept(deptno);
alter table emp_copy drop constraint fk_emp_copy;
alter table emp_copy modify deptno not null;
desc emp_copy;

-- delete trigger
-- emp_copy 테이블의 사원정보를 삭제하면 bq_emp_copy 테이블에 삭제한 사원정보가 등록된다.
create or replace trigger trg_del_emp
after delete  -- delete가 발생한 후에.. before은 어떤 경우에 쓰이는거지?
on emp_copy
for each row -- 각 행마다 수행된다
begin
    insert into bq_emp_copy
    values (:old.empno, :old.ename, :old.job, :old.mgr, :old.hiredate, -- old, new 변수명 앞에 붙인다. 삭제된 데이터라서 old라고 붙였음. 이전의 데이터라서.
    :old.sal, :old.comm, :old.deptno, current_timestamp); -- insert에서는 new, update에서는 new, old 다 쓸 수 있음.
end;
/



select * from emp_copy;
delete from emp_copy where empno = 7839;
select * from bq_emp_copy;
delete from emp_copy where job = 'CLERK';

-- insert trigger
CREATE table emp_insert_log(
    empno char(4),
    ename varchar2(30),
    insert_date date
);
create or replace trigger trg_ins_emp
after insert
on emp_copy
for each row
begin
    insert into emp_insert_log
    values(:new.empno, :new.ename, sysdate);
end;
/

desc emp_copy;
insert into emp_copy values(1005,'홍길동', '개발자', 7989, sysdate, 4000, null, 10);
select * from emp_insert_log;

-- before은 데이터 삽입 전에 검증할 때 주로 사용함.
-- triger로 해결할지, 제약조건으로 해결할지 잘 생각해보는게 좋음.