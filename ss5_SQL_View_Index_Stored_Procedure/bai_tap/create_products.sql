CREATE DATABASE `demo`;
USE `demo`;
CREATE TABLE `products` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(30) NOT NULL,
    product_name VARCHAR(45) NOT NULL,
    product_price DECIMAL(7 , 2 ) NOT NULL,
    product_amount INT(10) NOT NULL,
    product_description VARCHAR(50),
    product_status VARCHAR(50)
);
INSERT INTO `products`(product_code,product_name,product_price,product_amount,product_description,product_status) VALUES 
('PEN','Pen Red',1.25, 5000,'write','new'),
('PEC', 'Pencil 2B', 0.28,2000,'write and draw','new');
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
ALTER TABLE `products` ADD UNIQUE products_unique (product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX productsunique ON `products` (product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM `products`;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW products_views AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        `products`;
SELECT 
    *
FROM
    products_views;
-- Tiến hành sửa đổi view
CREATE OR REPLACE VIEW products_views AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        `products`
    WHERE
        product_amount = 2000;
-- Tiến hành xoá view
DROP VIEW products_views;
-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE find_all_products()
BEGIN
  SELECT * FROM products;
END //
DELIMITER ;
CALL find_all_products();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_products (
    p_code VARCHAR(30),
    p_name VARCHAR(45),
    p_price DECIMAL(7 , 2 ),
    p_amount INT(10) ,
    p_description VARCHAR(50),
    p_status VARCHAR(50)
)
BEGIN
INSERT INTO `products`(product_code,product_name,product_price,product_amount,product_description,product_status) VALUES 
(p_code,p_name,p_price,p_amount,p_description,p_status); 
END // 
DELIMITER ; 
CALL add_products ('RL','RULER',0.1, 5000,'MEASURE','new');

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllProducts()`//

CREATE PROCEDURE update_products(
p_id int,
p_amount INT(10) 
)

BEGIN
UPDATE `products` 
SET 
    products.product_amount = p_amount
WHERE
    products.id = p_id;
END //
delimiter ;
CALL update_products(1,800);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_by_id( in id int)
BEGIN
DELETE FROM `products`
WHERE products.id=id;
END//
delimiter ;
CALL delete_by_id (2);

 -- DROP DATABASE `demo`;
