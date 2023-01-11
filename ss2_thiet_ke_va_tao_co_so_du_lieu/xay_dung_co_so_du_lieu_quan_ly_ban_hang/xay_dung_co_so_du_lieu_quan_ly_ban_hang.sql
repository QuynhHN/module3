create database `xay_dung_co_so_du_lieu_quan_ly_ban_hang`;
use `xay_dung_co_so_du_lieu_quan_ly_ban_hang`;
CREATE TABLE customer (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(50),
    c_age INT
);
CREATE TABLE `order` (
    o_id INT PRIMARY KEY,
    customer_c_id INT,
    o_date DATE,
    o_totalprice VARCHAR(30),
    FOREIGN KEY (customer_c_id)
        REFERENCES customer (c_id)
);
CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(50),
    p_price VARCHAR(30)
);
CREATE TABLE order_detail (
    order_o_id INT,
    product_p_id INT,
    o_d_qty VARCHAR(30),
    FOREIGN KEY (order_o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (product_p_id)
        REFERENCES product (p_id)
);
drop database `xay_dung_co_so_du_lieu_quan_ly_ban_hang`;
