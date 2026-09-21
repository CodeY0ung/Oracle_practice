create table member(
    id number primary key,
    name varchar2(20) not null
);

create sequence member_seq
    start with 1
    increment by 1
    nocycle;

create table item(
    id number primary key,
    name varchar2(20) not null
);

create sequence item_seq
    start with 1
    increment by 1
    nocycle;

create table reservation(
    id number primary key,
    member_id number not null,
    item_id number not null,
    reservation_status varchar2(20) not null,
    reserve_at timestamp with time zone not null,
    confirm_at timestamp with time zone,
    foreign key (member_id) references member(id),
    foreign key (item_id) references item(id),
    check(reservation_status in('request','confirm','canceled'))
);

create sequence reservation_seq
    start with 1
    increment by 1
    nocycle;
    
    
drop table reservation;
drop table member;
drop table item;

select * from member;
select * from item;
select * from reservation;