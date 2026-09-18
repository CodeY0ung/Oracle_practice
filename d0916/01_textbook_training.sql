SELECT ename, INITCAP(ename) FROM emp; 

SELECT ename, LOWER(ename) FROM emp; 

SELECT ename, UPPER(ename) FROM emp;

SELECT ename, LENGTH(ename) FROM emp;

SELECT ename, LENGTHB(ename) FROM emp;

SELECT CONCAT(e.ename,d.dname) FROM emp e, dept d;

SELECT SUBSTR(ename,1,2) FROM emp;

SELECT INSTR(ename,'#') FROM EMP;

SELECT INSTRB(ename, '#') FROM emp;

SELECT LPAD(ename,10,'*') FROM emp;

-- RPAD 퀴즈
SELECT RPAD(ename,10,SUBSTR('1234567890',LENGTH(ename),10)) FROM emp;

SELECT LTRIM(ename,'E') FROM emp;

SELECT RTRIM(ename, 'E') FROM emp;

SELECT REPLACE(ename, 'E','Z') FROM emp;
--REPLACE 퀴즈 1
SELECT ename, REPLACE(ename, SUBSTR(ename,2,2),'--') FROM emp;

--REPLACE 퀴즈 2
SELECT REPLACE(phoneNum,SUBSTR(phoneNum,7,7),'-/-/-/-') FROM phoneNumManager;

SELECT age FROM test02;
SELECT POWER(age,3) FROM test02;

SELECT ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) FROM emp;

SELECT SYSDATE , TO_CHAR(SYSDATE,'DDTH') AS DDTH FROM DUAL;

SELECT * FROM emp;

SELECT empno, ename, hiredate 
FROM emp 
where TO_CHAR(hiredate,'MM') IN('01','02','03');