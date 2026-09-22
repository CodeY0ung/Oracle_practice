create table order_record(
    id number generated as identity primary key,
    user_id number not null,
    item_id number not null,
    quantity number not null
);

INSERT INTO order_record (user_id, item_id, quantity) VALUES (1, 1, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (1, 3, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (2, 2, 5);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (2, 4, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (3, 1, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (3, 5, 4);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (4, 6, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (4, 3, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (5, 7, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (5, 2, 6);

INSERT INTO order_record (user_id, item_id, quantity) VALUES (6, 8, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (6, 1, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (7, 9, 4);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (7, 5, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (8, 10, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (8, 4, 5);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (9, 11, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (9, 6, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (10, 12, 4);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (10, 7, 1);

INSERT INTO order_record (user_id, item_id, quantity) VALUES (1, 8, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (2, 9, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (3, 10, 5);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (4, 11, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (5, 12, 4);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (6, 13, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (7, 14, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (8, 15, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (9, 1, 6);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (10, 2, 2);

INSERT INTO order_record (user_id, item_id, quantity) VALUES (1, 4, 5);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (2, 6, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (3, 8, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (4, 10, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (5, 12, 4);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (6, 14, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (7, 1, 5);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (8, 3, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (9, 5, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (10, 7, 4);

INSERT INTO order_record (user_id, item_id, quantity) VALUES (1, 9, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (2, 11, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (3, 13, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (4, 15, 4);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (5, 1, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (6, 3, 5);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (7, 5, 1);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (8, 7, 3);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (9, 9, 2);
INSERT INTO order_record (user_id, item_id, quantity) VALUES (10, 11, 4);

select * from order_record;

COMMIT;