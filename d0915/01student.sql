
drop table enrol;
drop table student;
drop table subject;
CREATE TABLE student(
    stu_no CHAR(9) PRIMARY KEY,
    stu_name VARCHAR2(20),
    stu_dept VARCHAR2(20),
    stu_grade NUMBER(1),
    stu_class VARCHAR2(1) CHECK(stu_class IN('A','B','C')),
    stu_gender VARCHAR2(1) CHECK(stu_gender IN('M','F')),
    stu_height NUMBER(5,2), -- 5자리 숫자중 뒤에 2자리는 소숫점으로 쓰겠다.
    stu_weight NUMBER(5,2)
);

CREATE TABLE subject(
    sub_no VARCHAR2(3) PRIMARY KEY,
    sub_name VARCHAR2(30),
    sub_prof VARCHAR2(20),
    sub_grade NUMBER,
    sub_dept VARCHAR2(20)
);

CREATE TABLE enrol(
    sub_no VARCHAR2(3),
    stu_no CHAR(9),
    enr_grade NUMBER,
    FOREIGN KEY (sub_no) REFERENCES subject(sub_no),
    FOREIGN KEY (stu_no) REFERENCES student(stu_no)
);

INSERT INTO student VALUES (20153075, '옥한빛', '기계', 1, 'C', 'M', 177, 80);
INSERT INTO student VALUES (20153088, '이태연', '기계', 1, 'C', 'F', 162, 50);
INSERT INTO student VALUES (20143054, '유가인', '기계', 2, 'C', 'F', 154, 47);
INSERT INTO student VALUES (20152088, '조민우', '전기전자', 1, 'C', 'M', 188, 90);
INSERT INTO student VALUES (20142021, '심수정', '전기전자', 2, 'A', 'F', 168, 45);
INSERT INTO student VALUES (20132003, '박희철', '전기전자', 3, 'B', 'M', NULL, 63);
INSERT INTO student VALUES (20151062, '김인중', '컴퓨터정보', 1, 'B', 'M', 166, 67);
INSERT INTO student VALUES (20141007, '진현무', '컴퓨터정보', 2, 'A', 'M', 174, 64);
INSERT INTO student VALUES (20131001, '김종헌', '컴퓨터정보', 3, 'C', 'M', NULL, 72);
INSERT INTO student VALUES (20131025, '옥성우', '컴퓨터정보', 3, 'A', 'F', 172, 63);

SELECT * FROM student;

INSERT INTO subject VALUES ('111', '데이터베이스', '이재영', 2, '컴퓨터정보');
INSERT INTO subject VALUES ('110', '자동제어', '정순정', 2, '전기전자');
INSERT INTO subject VALUES ('109', '자동화설계', '박민영', 3, '기계');
INSERT INTO subject VALUES ('101', '컴퓨터개론', '강종영', 3, '컴퓨터정보');
INSERT INTO subject VALUES ('102', '기계공작법', '김태영', 1, '기계');
INSERT INTO subject VALUES ('103', '기초전자실험', '김유석', 1, '전기전자');
INSERT INTO subject VALUES ('104', '시스템분석설계', '강석현', 3, '컴퓨터정보');
INSERT INTO subject VALUES ('105', '기계요소설계', '김명성', 1, '기계');
INSERT INTO subject VALUES ('106', '전자회로실험', '최영민', 3, '전기전자');
INSERT INTO subject VALUES ('107', 'CAD응용실습', '구봉규', 2, '기계');
INSERT INTO subject VALUES ('108', '소프트웨어공학', '권민성', 1, '컴퓨터정보');

SELECT * FROM subject;

INSERT INTO enrol VALUES ('101', '20131001', 80);
INSERT INTO enrol VALUES ('104', '20131001', 56);
INSERT INTO enrol VALUES ('106', '20132003', 72);
INSERT INTO enrol VALUES ('103', '20152088', 45);
INSERT INTO enrol VALUES ('101', '20131025', 65);
INSERT INTO enrol VALUES ('104', '20131025', 65);
INSERT INTO enrol VALUES ('108', '20151062', 81);
INSERT INTO enrol VALUES ('107', '20143054', 41);
INSERT INTO enrol VALUES ('102', '20153075', 66);
INSERT INTO enrol VALUES ('105', '20153075', 56);
INSERT INTO enrol VALUES ('102', '20153088', 61);
INSERT INTO enrol VALUES ('105', '20153088', 78);

-- 테이블 구조 확인하기
DESCRIBE student;
DESC emp;

-- 과목 테이블에서 학과명을 조회하시오
SELECT sub_name FROM subject;

-- 학생 테이블에서 학과명을 조회하시오
SELECT stu_dept FROM student;
-- 학과명 중복 제거
SELECT DISTINCT stu_dept FROM student;

-- 학생 테이블에서 학년과 반을 조히하시오.
SELECT stu_grade, stu_class FROM student;

-- 수강테이블에서 학번, 과목번호, 점수, 기존 점수에 10을 더한 점수를 조회하시오.
SELECT stu_no, sub_no, enr_grade, enr_grade + 10 FROM enrol;
-- 위 결과에서 기존 점수에 10을 더한 점수의 열 제목은 'plus10'으로 하시오.
SELECT stu_no, sub_no, enr_grade, enr_grade + 10 AS plus10 FROM enrol;

-- 연결 연산자 : 두 개 이상의 열을 합쳐서 조회할 때 사용.
SELECT stu_dept || stu_name AS 학과성명 FROM student;
SELECT stu_dept || ',' || stu_name || '입니다.' AS 학과설명 FROM student;

-- 학과가 '컴퓨터정보'인 학생의 이름, 학과, 학년, 반 정보를 조회하세요.
SELECT stu_name, stu_dept, stu_grade, stu_class FROM student WHERE stu_dept = '컴퓨터정보';

-- 학과가 '컴퓨터정보'가 아닌 학생의 이름, 하고가, 학년, 반 정보를 조회하세요.
SELECT stu_name, stu_dept, stu_grade, stu_class FROM student WHERE stu_dept != '컴퓨터정보';

-- 학과가 '컴퓨터정보'이고 2학년인 학생의 모든 정보를 조회하시오.
SELECT * FROM student WHERE stu_dept = '컴퓨터정보' AND stu_grade = 2;

-- 1학년, 2학년 학생의 모든 정보를 조회하시오.
SELECT * FROM student WHERE stu_grade = 1 or stu_grade = 2;

-- 체중이 60이상 70이하인 학생의 이름과 학과, 학년을 조회하시오.
SELECT stu_name, stu_grade, stu_weight FROM student WHERE stu_weight between 60 and 70;

-- 키가 170이상인 학생의 이름과 학과, 학년을 조회하시오.
SELECT stu_name, stu_dept, stu_grade FROM student WHERE stu_height >= 170;

-- 키가 170 이상인 학생의 수는 몇 명인지 조회하시오.
SELECT COUNT(stu_no) FROM student WHERE stu_height >= 170;

-- 학생 중 성이 김씨인 학생들의 정보를 검색하시오.
SELECT * FROM student WHERE stu_name like '김%';

-- 학생 중 이름의 두번째 글자가 '수'인 학생의 이름을 검색하시오.
SELECT stu_name FROM student WHERE stu_name LIKE '_수%';

-- 학생 중 이름이 '우'로 끝나는 학생의 수가 몇 명인지 검색하시오.
SELECT COUNT(stu_name) FROM student WHERE stu_name LIKE '%우';

-- 학번이 2014번인 학생의 정보를 조회하시오.
SELECT * FROM student WHERE stu_no = '2014';

-- NULL 확인
SELECT stu_no, stu_name, stu_height FROM student;

-- 학생정보 중 키(신장) 값이 없는 학생의 학번, 이름, 키를 조회하시오.
SELECT stu_no, stu_name, stu_height FROM student
WHERE stu_height IS NULL;

-- 학생정보 중 키(신장) 값이 있는 학생의 학번, 이름, 키를 조회하시오.
SELECT stu_no, stu_name, stu_height FROM student
WHERE stu_height IS NOT NULL;

-- 학과가 '컴퓨터 정보'이거나 '기계'과인 학생의 학번, 이름, 학과를 검색하시오.
SELECT stu_no, stu_name , stu_dept FROM student
WHERE stu_dept = '컴퓨터정보' OR stu_dept = '기계';

SELECT stu_no, stu_name , stu_dept FROM student
WHERE stu_dept IN ('컴퓨터정보','기계');

-- 정렬하기 ORDER BY DESC, ORDER BY ASC
SELECT * FROM student ORDER BY stu_no ASC;
SELECT * FROM student ORDER BY stu_no ;
SELECT * FROM student ORDER BY stu_no DESC;

SELECT stu_no, stu_name, stu_dept, stu_weight-5 AS target
FROM student
ORDER BY target DESC;

--그룹
-- max, min
SELECT MAX(stu_height)FROM student;
SELECT MIN(stu_height)FROM student;

--sum
SELECT SUM(enr_grade)FROM enrol;
SELECT COUNT(*), COUNT(stu_height) FROM student;

-- GOUP BY
-- 학생테이블에서 학과별 몸무게 평균을 구하시오.
SELECT AVG(stu_weight)
FROM student
GROUP BY stu_dept;

-- 학생테이블에서 체중이 50 이상인 학생들의 학과별 인원수를 구하시오.
SELECT stu_dept, COUNT(*)
FROM student
WHERE stu_weight >= 50
GROUP BY stu_dept;

-- 학생테이블에서 학과별, 학년별 인원수를 구하시오.
SELECT stu_dept, stu_grade, COUNT(*)
FROM student
GROUP BY stu_dept, stu_grade
ORDER BY stu_dept;

-- 기계과 학생들 중에서 학년별 평균 신장이 160이상인 학년과 평균 신장을 구하시오.
SELECT stu_grade AS 학년, AVG(stu_height) AS 평균신장
FROM student 
WHERE stu_dept = '기계'
GROUP BY stu_grade
HAVING AVG(stu_height) >= 160;

-- 최대 신장이 175 이상인 학과들을 구하고 학과별 최대 신장을 구하시오.
SELECT stu_dept, MAX(stu_height)
FROM student
GROUP BY stu_dept
HAVING MAX(stu_height) >= 175;

-- 학과별 평균 신장 중 가장 높은 평균 신장을 구하시오.
SELECT MAX(AVG(stu_height))
FROM student
GROUP BY stu_dept;

SELECT TO_CHAR(MAX(AVG(stu_height)), '999.99')
FROM student
GROUP BY stu_dept;


-- NULL 관련 함수
-- NVL(a,b)
-- 인수1을 반환하는 함수인데...
-- 인수1(a)이 null이면 인수2(b)를 반환함.
SELECT NVL(stu_height,0) FROM student;

-- NVL2(a,b,c)
-- 인수2, 인수3을 반환하는 함수인데...
-- 인수1이 NOT NULL 이면 인수2를 반환하고,
-- 인수1이 NULL이면 인수3을 반환함.
-- emp 테이블로 실습

-- NULLIF(a,b)
-- 인수1 = 인수2 이면 NULL 반환,
-- 아니면 인수 1을 반환.
SELECT NVL(NULLIF('a','a'),'널 값') FROM dual;

-- COALESCE(...)
-- 여러 인수들 중 처음으로 NULL이 아닌 값이 나타날 때 그 값을 반환함.
SELECT COALESCE(NULL,NULL,10,100,NULL)FROM dual;