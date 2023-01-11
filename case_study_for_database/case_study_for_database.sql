create database `case_study_for_database`;
use `case_study_for_database`;
-- Vị trí
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);
insert into vi_tri(ma_vi_tri,ten_vi_tri) values (1,'Quản lý');
insert into vi_tri(ma_vi_tri,ten_vi_tri) values (2,'Nhân viên');
-- Trình độ
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);
insert into trinh_do(ma_trinh_do,ten_trinh_do) values(1,'Trung cấp');
insert into trinh_do(ma_trinh_do,ten_trinh_do) values(2,'Cao đẳng');
insert into trinh_do(ma_trinh_do,ten_trinh_do) values(3,'Đại học');
insert into trinh_do(ma_trinh_do,ten_trinh_do) values(4,'Sau đại học');
-- Bộ phận
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);
insert into bo_phan(ma_bo_phan,ten_bo_phan) values (1,'Sale - Marketing');
insert into bo_phan(ma_bo_phan,ten_bo_phan) values (2,'Hành chính');
insert into bo_phan(ma_bo_phan,ten_bo_phan) values (3,'Phục vụ');
insert into bo_phan(ma_bo_phan,ten_bo_phan) values (4,'Quản lý');
-- Nhân viên
CREATE TABLE nhan_vien (
    ma_nhan_vien INT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (vi_tri_ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (trinh_do_ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (bo_phan_ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (1, 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4);
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
-- Loại khách hàng
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);
insert into loai_khach(ma_loai_khach,ten_loai_khach) values (1,'Diamond');
insert into loai_khach(ma_loai_khach,ten_loai_khach) values (2,'Platinium');
insert into loai_khach(ma_loai_khach,ten_loai_khach) values (3,'Gold');
insert into loai_khach(ma_loai_khach,ten_loai_khach) values (4,'Silver');
insert into loai_khach(ma_loai_khach,ten_loai_khach) values (5,'Member');
-- Khách hàng
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (loai_khach_ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);
-- Loại dịch vụ
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);
-- Dịch vụ
CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (kieu_thue_ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (loai_dich_vu_ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);
-- Hợp đồng
CREATE TABLE hop_dong (
    ma_hop_dong INT,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (nhan_vien_ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (khach_hang_ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (dich_vu_ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);
-- Hợp đồng chi tiết
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (hop_dong_ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (dich_vu_di_kem_ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);
-- Kiểu thuê
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);
-- Dịch vụ đi kèm
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);
drop database `case_study_for_database`;