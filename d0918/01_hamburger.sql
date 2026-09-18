
-- 자재
-- id, name, amount, price
create table material(
    id varchar2(10) primary key,
    name varchar2(20),
    amount number,
    price number
);

-- 입고
-- id, material_id, amount, created_at
create table material_in(
    id varchar2(10) primary key,
    material_id varchar2(10),
    amount number,
    in_date timestamp,
    foreign key(material_id) references material(id)
);

-- 제품
-- id, name, amount, price, fail_ratio
create table product(
    id varchar2(10) primary key,
    name varchar2(20),
    amount number,
    price number,
    fail_ratio number
);

-- 제조
-- id, material_id, product_id, material_amount
create table manufacturing(
    id varchar2(10) primary key,
    material_id varchar(10),
    product_id varchar(10),
    material_amount number,
    FOREIGN KEY(material_id) REFERENCES material(id),
    FOREIGN KEY(product_id) REFERENCES product(id)
);

-- 생산 내역 테이블 필요
-- 언제 어떤 제품이 얼마나 생산됐는가
create table production_record(
    id varchar2(10) primary key,
    product_id varchar2(10) not null,
    amount number,
    created_at date,
    foreign key(product_id) references product (id)
);

-- 생산 계획
-- id, product_id, due_date, amount
create table plan(
    id varchar2(10) primary key,
    product_id varchar2(10),
    due_date date,
    amount number,
    foreign key (product_id) references product(id)
);

-- 납품
-- id, product_id, amount, created_at
create table product_out(
    id varchar2(10) primary key,
    product_id varchar2(10),
    amount number,
    out_date date,
    foreign key(product_id) references product(id)
);


