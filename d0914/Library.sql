-- 도서관에서는 여러 권의 도서를 관리한다.

-- 도서는 도서번호, 도서명, 저자, 출판사 정보를 가진다.

-- 학생은 학생번호, 학생명, 전화번호를 가진다.

-- 학생은 여러 권의 도서를 대여할 수 있고, 하나의 도서는 여러 번 대여될 수 있다.

-- 도서를 대여할 때 대여일과 반납일을 기록한다.

-- 한 번의 대여에는 하나의 도서만 대여한다고 가정한다.

-- 도서관
-- 도서, 도서번호, 도서명 ,저자, 출판사, 
-- 학생, 학생번호, 학생명, 전화번호
-- 대여, 대여일, 반납일

-- 대여할수있다
--drop table book;
--drop table rental;
--drop table student;

CREATE TABLE student(
    sid NUMBER PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20) NOT NULL UNIQUE
);

CREATE TABLE book(
    bid NUMBER PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    author VARCHAR2(20) NOT NULL,
    publicationDate VARCHAR2(20) NOT NULL,
    rentalStatus VARCHAR2(20) NOT NULL
);

CREATE TABLE rental(
    rid NUMBER PRIMARY KEY,
    rentalDate VARCHAR2(20) NOT NULL,
    returnDate VARCHAR2(20) NOT NULL,
    sid NUMBER NOT NULL,
    Constraint fk_student_sid FOREIGN KEY(sid) REFERENCES student(sid)
);

CREATE TABLE onetimebooks(
    obid NUMBER PRIMARY KEY,
    rid NUMBER NOT NULL,
    bid NUMBER NOT NULL,
    CONSTRAINT fk_rental_rid FOREIGN KEY (rid) REFERENCES rental(rid),
    CONSTRAINT fk_book_bid FOREIGN KEY (bid) REFERENCES book(bid)
);

-- 쿼리 목록


-- 학생
-- 대여


-- 관리자
-- 책 관리 CRUD