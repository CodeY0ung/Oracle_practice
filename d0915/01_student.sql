
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
    sub_dept VARCHAR2(20) CHECK(sub_dept IN('A,B,C'))
);

CREATE TABLE enrol(
    sub_no VARCHAR2(3),
    stu_no VARCHAR2(9),
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