create database `quan_ly_ban_hang`;
use `quan_ly_ban_hang`;
CREATE TABLE customer (
    c_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(25) NOT NULL,
    c_age TINYINT NOT NULL
);
insert into customer(c_name,c_age) values ('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);
CREATE TABLE `order` (
    o_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    c_id INT NOT NULL,
    o_date DATETIME NOT NULL,
    o_totalprice INT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);
insert into `order`(c_id,o_date,o_totalprice) values (1,'2006-03-21',null),(2,'2006-03-23',null),(1,'2006-03-16',null);
CREATE TABLE product (
    p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(50) NOT NULL,
    p_price INT NOT NULL
);
insert into product(p_name,p_price) values ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);
CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    od_qty INT,
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);
insert into order_detail(o_id,p_id,od_qty) values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

drop database `quan_ly_ban_hang`;
