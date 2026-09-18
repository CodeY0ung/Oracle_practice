CREATE TABLE dept(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR(13)
);

CREATE TABLE salgrade(
    sgrade NUMBER(1) PRIMARY KEY,
    minimal NUMBER,
    maximal NUMBER
);

CREATE TABLE emp(
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER,
    comm NUMBER,
    deptno NUMBER(2),
    FOREIGN KEY (mgr) REFERENCES emp(empno),
    FOREIGN KEY(deptno) REFERENCES dept(deptno)
);

INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO emp 
VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-11-1981', 'dd-mm-yyyy'), 5000, NULL, 10);

INSERT INTO emp 
VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('2-4-1981', 'dd-mm-yyyy'), 2975, NULL, 20);

INSERT INTO emp 
VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('1-5-1981', 'dd-mm-yyyy'), 2850, NULL, 30);

INSERT INTO emp 
VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('9-6-1981', 'dd-mm-yyyy'), 2450, NULL, 10);

INSERT INTO emp 
VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('13-7-1987', 'dd-mm-yyyy'), 3000, NULL, 20);

INSERT INTO emp 
VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('3-12-1981', 'dd-mm-yyyy'), 3000, NULL, 20);

INSERT INTO emp 
VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20-2-1981', 'dd-mm-yyyy'), 1600, 300, 30);

INSERT INTO emp 
VALUES (7521, 'WORD', 'SALESMAN', 7698, TO_DATE('22-2-1981', 'dd-mm-yyyy'), 1250, 500, 30);

INSERT INTO emp 
VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28-9-1981', 'dd-mm-yyyy'), 1250, 1400, 30);

INSERT INTO emp 
VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('8-9-1981', 'dd-mm-yyyy'), 1500, 0, 30);

INSERT INTO emp 
VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('3-12-1981', 'dd-mm-yyyy'), 950, NULL, 30);

INSERT INTO emp 
VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23-1-1982', 'dd-mm-yyyy'), 1300, NULL, 10);

INSERT INTO emp 
VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17-12-1980', 'dd-mm-yyyy'), 800, NULL, 20);

INSERT INTO emp 
VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('13-7-1987', 'dd-mm-yyyy'), 1100, NULL, 20);

INSERT INTO salgrade VALUES(1, 700, 1200);
INSERT INTO salgrade VALUES(2, 1201, 1400);
INSERT INTO salgrade VALUES(3, 1401, 2000);
INSERT INTO salgrade VALUES(4, 2001, 3000);
INSERT INTO salgrade VALUES(5, 3001, 9999);

SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM EMP;

-- NVL2(a,b,c)
-- 인수2, 인수3을 반환하는 함수인데...
-- 인수1이 NOT NULL 이면 인수2를 반환하고,
-- 인수1이 NULL이면 인수3을 반환함.
SELECT NVL2(comm, sal+comm, sal) FROM emp;

-- 1. 사원 테이블의 구조를 검색하시오.
DESCRIBE emp;
-- 2. 사원들의 사원번호, 사원이름, 사원직무를 검색하시오.
SELECT empno, ename, job FROM emp;
-- 3. 사원들의 입사일을 중복없이 검색하시오.
SELECT DISTINCT hiredate FROM emp;
-- 4. 사원들의 부서번호 중복을 제거하고 검색하시오.
SELECT DISTINCT deptno FROM emp;
-- 5. 사원들의 6개월치 급여를 검색하시오.
SELECT sal*6 FROM emp;
-- 6. 사원들의 6개월치 커미션을 검색하시오. 커미션이 없을 경우 0으로 표기
SELECT NVL(comm*6,0) FROM emp;
-- 7. 부서번호, 부서이름, 지역을 한글 제목으로 검색하시오.
SELECT deptno AS 부서번호, dname AS 부서이름, loc AS 지역 FROM dept;
-- 8. 입사일(hiredate), 사원이름을 '80-12-17에 입사한 SMITH입니다.' 식으로 검색하시오.
SELECT hiredate ||'에 입사한 '||ename||'입니다.' FROM emp;
-- 9. 10번 부서에 근무하는 사원이름을 검색하시오
SELECT ename FROM emp WHERE deptno = 10;
-- 10. 급여가 2000 이상인 사원들의 사원번호, 사원이름을 검색하시오.
SELECT empno, ename FROM emp WHERE sal >=2000;
-- 11. 사원 직무가 'CLERK'인 사원들의 사원번호, 사원이름을 검색하시오.
SELECT empno,ename FROM emp WHERE job = 'CLERK';
-- 12. 1980년 12월 17일에 입사한 사원이름을 검색하시오.
SELECT ename FROM emp WHERE hiredate = '1980-12-17';
-- 13. 부서번호 30 이외의 부서이름과 지역을 검색하시오.
SELECT dname, loc FROM dept WHERE deptno != 30;
--14. 10번 부서에 근무하는 MANAGER의 사원이름을 검색하시오.
SELECT ename FROM emp WHERE deptno = 10 AND job = 'MANAGER';
--15. 급여가 2000 이상이며, 30번 부서에 근무하는 사원들의 사원번호와 사원이름을 검색하시오.
SELECT empno, ename FROM emp WHERE sal >= 2000 OR deptno = 30;
--16. 사원 직무가 'CLERK'이며 81년 이후에 입사한 사원들의 사원번호와 사원이름을 검색하시오.
SELECT empno, ename FROM emp WHERE job = 'CLERK' AND hiredate >= TO_dATE('01-01-1981','DD-MM-YYYY');
--17. BOSTON 이외 지역에 있는 부서이름을 검색하시오.
SELECT dname FROM dept WHERE loc != 'BOSTON';
--18. SALESMAN이며 급여가 1500 이상인 사원이름을 검색하시오.
SELECT ename FROM emp WHERE job = 'SALESMAN' AND sal >= 1500;
--19. 급여가 1000 이상이며, 2500 이하인 사원의 사원번호, 사원이름, 급여를 검색하시오.(BETWEEN 사용)
SELECT empno, ename, sal FROM emp WHERE sal BETWEEN 1000 AND 2500;
--20. 사원번호가 75XX인 사원의 사원번호, 사원이름, 부서번호를 검색하시오.
SELECT empno, ename, deptno FROM emp WHERE empno LIKE '75__';
--21. 부서번호가 10 또는 30에 근무하는 사원들의 사원이름과 급여를 검색하시오.
SELECT ename, sal FROM emp WHERE deptno IN(10,30);
--22. 상급자 번호가 76으로 시작하는 사원들의 사원이름을 검색하시오.
SELECT ename FROM emp WHERE mgr LIKE '76%';
--23. 사원번호가 7로 시작하는 사원들의 사원이름, 급여, 커미션을 검색하시오.
SELECT ename, sal, comm FROM emp WHERE empno LIKE '7%';
--24. 1981년 2월에 입사한 사원의 사원번호, 사원이름, 부서번호를 검색하시오.
SELECT empno, ename, deptno FROM emp WHERE TRUNC(hiredate,'MM') = TO_DATE('01-02-1981','DD-MM-YYYY');
--25. 사원이름 중간에 'A'가 들어있는 사원의 사원번호와 사원이름을 검색하시오.
SELECT empno, ename FROM emp WHERE ename LIKE '%A%';
--26. 상급자사원번호가 NULL인 사원의 사원번호와 사원이름을 검색하시오.
SELECT empno, ename FROM emp WHERE mgr IS NULL;
--27. 상급자사원번호가 NULL이 아닌 사원의 사원번호, 이름, 상급자사원번호를 검색하시오.
SELECT empno, ename, mgr FROM emp WHERE mgr IS NOT NULL;
--28. 사원번호가 7902 또는 7781인 사원이름을 검색하시오.(IN 사용)
SELECT ename FROM emp WHERE empno IN('7902','7781');
--29. 사원들의 사원번호와 사원이름을 사원번호 순(오름차순)으로 검색하시오.
SELECT empno, ename FROM emp ORDER BY empno;
--30. 사원들의 사원번호와 사원이름을 부서번호별 이름순으로 검색하시오. ----------문제를 잘못 이해했음 GROUP BY 안써도 됨.
SELECT deptno, empno, ename FROM emp ORDER BY deptno;
--31. 사원들의 정보를 부서별 급여가 높은 순으로 검색하시오.
SELECT * FROM emp ORDER BY sal DESC; 
--32. 사원번호, 사원이름, 입사일, 근무일자를 계산하여 검색하시오.
SELECT empno, ename, hiredate, SYSDATE-hiredate FROM emp;
--33. 사원들의 입사일에서 3달째 되는 날짜를 검색하시오.
SELECT ADD_MONTHS(hiredate,3);
--34. 사원들의 입사일 다음 토요일의 날짜를 검색하시오.
SELECT NEXT_DAY(hiredate,'토요일') FROM emp;
--35. 사원들의 입사월의 마지막 날짜를 검색하시오.
SELECT LAST_DAY(hiredate) FROM emp;
--36. 상급자사원번호가 없는 사원의 경우 '상급자없음'을 나타내도록 하는 질의문을 작성하시오.
SELECT NVL(TO_CHAR(mgr),'상급자 없음') FROM emp;
--37. 커미션을 포함한 급여(컬럼명: 커미션포함 급여)를 사원번호, 사원이름과 함께 검색하시오.
SELECT sal+comm AS 커미션포함급여, empno, ename FROM emp;
--38. 커미션을 포함한 연봉을 사원번호, 사원이름과 함께 검색하시오.
SELECT sal*12+comm, empno, ename FROM emp;
--39. 상급자 사원번호가 NULL 인 경우 'CEO'로 바꾸어 사원번호, 사원이름, 상급자사원번호를 검색하시오.
SELECT empno, ename, NVL(TO_CHAR(mgr) ,'CEO') FROM emp;
--40. 전체 사원의 사원이름 중 MAX와 MIN 값을 검색하시오.
SELECT MAX(ename), MIN(ename) FROM emp;
--41. 전체 사원의 입사일 중 MAX와 MIN 값을 검색하시오.
SELECT MAX(hiredate), MIN(hiredate) FROM emp;
--42. 상급자 사원번호 열의 개수를 검색하시오.
-- 열의 개수??
--43. 사원(emp) 테이블의 튜플 수(행)를 검색하시오.
SELECT COUNT(*) FROM emp;
--44. 부서별 사원들의 인원수를 검색하시오.
SELECT deptno, COUNT(*) FROM emp GROUP by deptno
--45. 상급자 사원번호별 사원들의 인원수를 검색하시오.
SELECT COUNT(empno) FROM emp GROUP BY mgr;
--46. 부서별 사원들의 평균 급여를 검색하시오.
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno;
--47. 부서별 사원직무별 사원의 급여 합을 검색하시오.
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job;
--48. 부서별 사원직무별 사원들의 평균 급여를 검색하시오.
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job;
--49. 부서별 사원들의 인원수를 인원수가 많은 순으로 검색하시오.
SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno ORDER BY COUNT(empno) DESC; 
--50. 부서별, 사원직무별 사람들의 평균 급여를 평균 급여가 많은 순으로 검색하시오.
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job ORDER BY AVG(sal) DESC;
--51. 평균 급여가 1000 이상인 부서를 검색하시오.
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal) >= 1000;
--52. 직무별 사원수가 3명 이상인 부서를 검색하시오.
SELECT job FROM emp GROUP BY job HAVING COUNT(*) >= 3;
--53. 부서 10, 20 중 평균 급여가 2500 이상인 부서의 부서번호, 사원수, 평균급여를 검색하시오.
SELECT deptno, COUNT(*), AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal) >= 2500;

-- SCOTT와 똑같은 급여를 받는 사람의 이름
SELECT sal, ename FROM emp WHERE sal = (SELECT sal FROM emp WHERE ename = 'SCOTT') AND ename != 'SCOTT';

-- SCOTT보다 급여가 낮은 사람들의 수
SELECT COUNT(empno) FROM emp WHERE sal < (SELECT sal FROM emp WHERE ename = 'SCOTT');