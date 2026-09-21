-- 페이징 처리 할 때 사용. 범위를 잘라서 보여줌.
select * from emp order by empno asc
offset 0 rows
fetch next 4 rows only;

select * from emp
order by empno asc
offset 3 rows
fetch next 3 rows only;

select * from emp order by empno asc;

select * from emp
order by empno asc
offset 11 rows
fetch next 3 rows only;