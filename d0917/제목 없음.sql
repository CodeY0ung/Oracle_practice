--1. 사원번호, 사원이름, 부서이름을 검색하시오.(natural join)
select empno, ename, dname from emp natural join dept;

--2. 사원번호, 사원이름, 부서이름을 검색하시오.(equi join)
select e.empno, e.ename, dname from emp e, dept d where e.deptno = d.deptno;

--3. 사원번호, 사원이름, 부서이름을 검색하시오.(join ~ using)
select empno, ename, dname from emp join dept using(deptno);

--4. 사원번호, 사원이름, 부서이름을 검색하시오.(join ~ on)
select empno, ename, dname from emp e join dept d on e.deptno = d.deptno;

--5. 지역이 NEW YORK인 사원이름을 검색하시오
select ename from emp e join dept d on e.deptno = d.deptno where d.loc = 'NEW YORK'; 

--6. 지역이 NEW YORK인 사원의 사원번호, 사원이름을 사원번호 순으로 검색하시오.
select empno, ename from emp join dept using(deptno) where loc = 'NEW YORK' order by empno; 

--7. ADAMS 사원이 근무 중인 부서이름과 지역을 검색하시오.
select dname, loc from dept join emp using(deptno) where ename = 'ADAMS';

--8. 급여가 2000 이상인 사원들의 사원명과 지역을 검색하시오.
select ename, loc
from emp join dept using(deptno)
where sal >= 2000;

--9. 급여가 1000 이상 2000 이하인 사원들의 사원번호, 사원이름, 부서이름을 사원번호순으로 검색하시오.
select empno, ename, dname from emp join dept using(deptno) where sal between 1000 and 2000;

--10. 사원직무가 SALESMAN이면서 CHICAGO 지역에 근무 중인 사원명을 검색하시오.
select ename from emp join dept using(deptno) where job = 'SALESMAN' and loc = 'CHICAGO';

--11. NEWYORK이나 DALLAS 지역에 근무하는 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하시오.
select empno, ename from emp join dept using(deptno) where loc in('NEWYORK', 'DALLAS');

--12. 부서이름이 ACCOUNTING 이거나, 지역이 CHICAGO인 사원의 사원번호와 사원이름을 검색하시오.
select empno, ename from emp join dept using(deptno) where dname ='ACCOUNTING' or loc = 'CHICAGO';

--13. 사원번호, 사원이름, 급여, 급여등급을 급여등급별 사원번호 순으로 검색하시오. -------------------------------------
select e.empno, e.ename, e.sal, s.sgrade 
from emp e join salgrade s 
on e.sal between s.minimal and maximal
order by sgrade, empno;  

--14. 사원번호, 사원이름, 상급자사원번호, 상급자이름을 검색하시오. (self join)
select a.empno, a.ename, b.mgr, b.ename from emp a join emp b on a.mgr = b.empno;

--15. BLAKE 사원보다 많은 급여를 받는 사원이름을 검색하시오.(sub-query)
select ename from emp where sal > (select sal from emp where ename = 'BLAKE');

--16. BLAKE 사원보다 많은 급여를 받는 사원이름을 검색하시오.
select ename from emp where sal > (select sal from emp where ename = 'BLAKE');

--17. FORD 사원과 같은 부서에 근무하는 사원이름을 검색하시오.
select ename from emp where deptno = (select deptno from emp where ename = 'FORD');

--18. FORD 사원과 같은 급여를 받는 사원의 사원번호를 검색하시오.
SELECT empno from emp where sal = (select sal from emp where ename = 'FORD');

--19. 부서별 인원수를 부서이름과 함께 사원이 많은 부서 순으로 검색하시오. -------------------------------------
select count(e.empno) as 부서별_인원수 , d.dname 
from emp e, dept d 
where e.deptno = d.deptno 
group by e.deptno , d.dname
order by count(e.empno) desc; 

--20. 사원번호, 사원이름을 부하직원수가 많은 순으로 검색하시오.
-- 부하직원 수가 많다 -> 많은 직원들이 그의 empno를 mgr로 가지고 있다. -------------------------------------
select b.empno, b.ename, count(a.empno) as 부하직원수
from emp a join emp b
on b.empno = a.mgr
group by b.empno, b.ename
order by count(a.empno) desc;

--21. 부서이름이 'SALES'이면서 사원직무가 'MANAGER'인 사원의 사원번호, 사원이름을 사원이름 순으로 검색하시오.
select empno, ename from emp join dept using(deptno) where dname = 'SALES' AND job = 'MANAGER';

--22. 20번 부서 사원의 사원직무와 같은 사원직무인 다른 부서의 사원벙보를 검색하시오. -------------------------------------
select * from emp where deptno != 20 and job in (select job from emp where deptno = 20);

--23. 전체 사원의 평균급여보다 급여가 많은 사원정보를 검색하시오.
select * from emp where sal>(select AVG(sal) from emp);

--24. 20번 부서의 최대 급여보다 최대 급여가 큰 부서의 번호와 최대 급여를 검색하시오.
select deptno, max(sal) from emp group by deptno having max(sal) > (select max(sal) from emp where deptno = 20);
--25. CHICAGO 지역에 위치하는 부서에 근무하는 사원 정보를 검색하시오. (sub-query)
select * from emp join dept using(deptno) where loc = 'CHICAGO';
