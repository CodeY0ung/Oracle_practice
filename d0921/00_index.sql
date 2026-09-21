--index
--데이터 검색 성능 향상을 위해 테이블 열에 사용하는 객체
--
--검색방식
--1. Table Full Scan : 테이블 데이터를 처음부터 끝까지 검색하여 데이터를 찾는 방식
--2. Index Scan : 인덱스를 검색하여 링크를 통해 데이터를 찾는 방식

select * from USER_INDEXES;

-- 대문자로 해야됨.
select * from USER_IND_COLUMNS;

SELECT * FROM emp WHERE empno = 7839;
select /*+ full(emp) */ * from emp where empno = 7839;
DESC EMP;

-- pk를 인덱스로 잡고 사용해야되는데, full scan중임.
SELECT * FROM emp;

--힌트 문법. 쿼리를 조회할 때 이 인덱스를 써서 조회를 해줘. full scan 하지말고, 가능하면 인덱스를 잡고 쓰면 좋겠다. 
SELECT /*+ INDEX(emp_sys_c007474)*/ * FROM emp;

-- 인덱스가 검색 성능을 높인다는 것을 cost를 통해서 확인이 가능하다.
-- 인덱스를 타면 무조건 성능이 올라간다는게 아니고, optimizer가 정한다.
-- 개발자가 할 수 있는건 hint문법으로 권장할 수 있음. 반드시 hint대로 수행되지는 않음. optimizer가 결정.

-- 인덱스를 고려할 만한 경우 - 사용하는 방향으로
-- - 검색 조건으로 자주 사용되는 컬럼
-- - 검색 결과가 전체 데이터 중 적은 비율
-- - where/join/order by 등에 자주 사용
-- - pk,unique 컬럼, 선택도가 높은 컬럼, 범위 검색이 필요한 컬럼

-- 신중하게 고려해야 하는 경우 - 사용하지 않는 방향으로 
-- - 데이터가 아주 적은 테이블
-- - 검색결과가 전체 데이터의 대부분인 경우
-- - 값의 종류가 매우 적은 컬럼
-- - insert/update/delete가 매우 빈번한 테이블
-- - 인덱스가 너무 많이 생성된 경우

-- 예상 카디널리티가 8개인데, 결과는 6개임.
select * from emp where empno > 7300 and empno < 7700; 

desc student;
select * from student;

create index idx_stu_name on student(stu_name asc);
select * from USER_IND_COLUMNS where TABLE_NAME = 'student'; -- 이거 왜 안 나오지?

DROP INDEX idx_stu_name;

-- 실행 계획 == f10
-- 실행 == f9
-- 중급자들은 f10으로 optimizer의 실행 계획을 보고 cost를 줄이는 방향으로 정하려고 노력한다.
-- 성능 향상을 위해서 튜닝하는 작업이 인덱스, 실행계획을 참고하는 것.
-- f6은 실행하고 났을 때의 결과. 실행 계획과 실행 결과의 차이를 보고 튜닝의 정도를 찾아내서 조합을 해본다. 
-- db쪽 사람들이 하는거임.

-- Operation : 수행 작업
-- Objec_Name : 테이블/인덱스 이름
-- Options : 검색 방법
-- Cardinality : 예상 결과 행 수
-- Cost : 옵티마이저 계산한 상대적인 비용

desc student;
select/*+ INDEX(student IDX_STU_NAME)*/ * from student where stu_name like '옥한빛';
-- 인덱스가 무조건 UNIQUE가 아니라 중복된 값이 들어갈 수도 있다.

-- 시험 범위 : 
-- 인덱스 만들고 드롭하고 정도 할 줄 알아야 함.
-- DBMS 약자. 데이터베이스 운영 시스템
-- 관계형 데이터베이스 : 표형식으로 저장. 테이블
-- CRUD정도는 할줄 알아야한다.
-- DDL = 데이터 정의. CREATE, DROP, ALTER
-- DML = MANUPLATION 운용하는 것. INSERT, UPDATE, DELETE, SELECT
-- DCL = 권한을 부여, 회수. GRANT, REVOKE
-- TCL = 트랜잭션 관련. COMMIT, ROLLBACK.. SAVE POINT A;, ROLLBACK TO A;
-- JAVA에서는 AUTO COMMIT이 기본으로 설정됨.
-- ORACLE에서는 COMMIT을 명시적으로 해야. 영구 반영이 됨.
-- ROCK 어떤 쿼리가 어떤 행에 동시에 작업중일때, 대기 상태가 발생함. 
-- DML에서 데이터베이스에 영향을 초래하는 명령어가 SELECT빼고 전부 다.
-- 이상현상. DML 중에 데이터베이스에 발생할 수 있는 이상현상. 삽삭갱
-- 이상현상 제거하기 위해 수행하는 것. 정규화
-- 정규화 -> 테이블 분리. 외래키 참조 명령어가 들어가게됨.
-- 3정규화까지는 알아야함.
-- 1. 도메인 원자성. 하나의 컬럼에는 하나의 값만 들어가야 함.
-- 2. 복합키가 있을 때, 다른 컬럼들이 기본키에 완전종속되지 않고, 부분 종속일때 필요함.
-- 3. 기본키가 아닌 컬럼이 다른 컬럼을 결정할 때.
-- 4. 반정규화 OR 역정규화. 성능 향상 때문에 테이블 합치는게 더 낫겠다.
-- 검색 성능 향상을 위해 INDEX 사용될 수 있다.
-- SELECT절
-- LIKE에는 =을 쓸 수 없다. (%,_)
-- GROUP BY 
-- WHERE : 테이블에 대한 조건
-- HAVING : GROUP한 결과에대한 조건
-- SUM,MAX,AVG,MIN GRUOP BY 집계함수
-- JOIN : 
-- EQUI JOIN : 같은것을 기준으로 찾는 것. INNER JOIN
-- NON EQUI JOIN : LEFT JOIN, RIGHT JOIN
-- JOIN문 형태 .. 돌아가게만 하면 됨. 여러가지 JOIN문 형태 중에 내가 편한 방식으로 구현하면 됨.
-- 4지선다, 주관식, QUERY문 서술