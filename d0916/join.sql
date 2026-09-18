-- 공통 속성을 중심으로 2개의 릴레이션을 하나로 합쳐서 새로운 릴레이션을 생성

SELECT student.*, enrol.*
FROM student
CROSS JOIN enrol
where student.stu_no = enrol.stu_no;

select count(*) from student;

select count(*) from enrol;

SELECT student.stu_no, stu_name, stu_dept, enr_grade
FROM student,enrol
WHERE student.stu_no = enrol.stu_no;

SELECT *
FROM student 
INNER JOIN enrol
on student.stu_no = enrol.stu_no;

select *
from student
left join enrol
on student.stu_no = enrol.stu_no;

SELECT stu_no, stu_name, stu_dept, enr_grade FROM student NATURAL JOIN enrol;

SELECT stu_no, stu_name, stu_dept, enr_grade FROM student JOIN enrol USING(stu_no);

SELECT student.stu_no, stu_name, stu_dept, enr_grade FROM student JOIN enrol ON student.stu_no = enrol.stu_no;

select s.stu_no, stu_name, sub_no
FROM student s, enrol e
WHERE s.stu_no = e.stu_no AND sub_no IN(101,102);

SELECT s.stu_no, s.stu_name, e.sub_no
FROM student s JOIN enrol e
ON s.stu_no = e.stu_no
WHERE e.sub_no IN(101,102);

SELECT stu_no, stu_name, sub_no
FROM student NATURAL JOIN enrol
WHERE sub_no IN(101,102);

SELECT stu_no, stu_name, sub_no
FROM student JOIN enrol
USING(stu_no)
WHERE sub_no IN(101,102);

SELECT s.stu_no, stu_name, sub_name
FROM student s, enrol e, subject su
WHERE s.stu_no = e.stu_no AND e.sub_no = su.sub_no AND sub_name = '컴퓨터개론';

SELECT s.stu_no, s.stu_name, su.sub_name
FROM student s JOIN enrol e
ON s.stu_no = e.stu_no 
JOIN subject su
ON e.sub_no = su.sub_no
WHERE su.sub_name = '컴퓨터개론';

-- USING 절에는 식별자를 사용 못함.
SELECT stu_no, stu_name, sub_name
FROM student JOIN enrol
USING(stu_no) 
JOIN subject 
USING(sub_no)
WHERE sub_name = '컴퓨터개론';

-- NATURAL JOIN에도 식별자 사용 불가.
SELECT stu_no, stu_name, sub_name
FROM student NATURAL JOIN enrol NATURAL JOIN subject
WHERE sub_name ='컴퓨터개론';


--NON EQUI조인
--기본키와 외래키 관계가 아닌 열값들의 의미 있는 관계로 조인
SELECT empno, ename, sal, sgrade
FROM emp, salgrade
WHERE sal BETWEEN minimal AND maximal;

-- self join
-- 자신의 상급자를 조회하시오
SELECT a.empno AS 사원번호, a.ename, b.empno AS 상급자_사원번호, b.ename
FROM emp a, emp b
WHERE a.mgr = b.empno;

SELECT a.empno AS 사원번호, a.ename, b.empno AS 상급자_사원번호, b.ename
FROM emp a JOIN emp b
ON a.mgr = b.empno;

-- OUTER JOIN
-- 조인 조건을 만족하지 않는 행들도 질의 결과에 포함하기 위한 조인
SELECT e.*, sub_name
FROM subject s LEFT OUTER JOIN enrol e
ON e.sub_no = s.sub_no
ORDER BY 1; -- SELECT 결과 첫번째 컬럼 기준

-- 인라인 뷰
-- from 절에서 서브쿼리가 가능함.

