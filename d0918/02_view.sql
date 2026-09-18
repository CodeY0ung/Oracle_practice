-- view
-- 논리적 테이블
create view c as select * from emp join dept using(deptno);

select * from C;

drop view c;