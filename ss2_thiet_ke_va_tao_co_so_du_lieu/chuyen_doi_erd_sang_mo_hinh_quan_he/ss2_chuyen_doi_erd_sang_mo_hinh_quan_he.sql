create database `ss2_chuyen_doi_erd_sang_mo_hinh_quan_he`;
use `ss2_chuyen_doi_erd_sang_mo_hinh_quan_he`;
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50)
);
CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(15) PRIMARY KEY,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY,
    ngay_xuat DATE
);
CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY,
    ten_vat_tu VARCHAR(50)
);
CREATE TABLE chi_tiet_phieu_xuat (
    phieu_xuat_so_phieu_xuat INT,
    vat_tu_ma_vat_tu INT,
    don_gia_xuat VARCHAR(20),
    so_luong_xuat VARCHAR(20),
    PRIMARY KEY (phieu_xuat_so_phieu_xuat , vat_tu_ma_vat_tu),
    FOREIGN KEY (phieu_xuat_so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (vat_tu_ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATE
);
CREATE TABLE chi_tiet_phieu_nhap (
    don_gia_nhap VARCHAR(20),
    so_luong_nhap VARCHAR(20),
    vat_tu_ma_vat_tu INT,
    phieu_nhap_so_phieu_nhap INT,
    FOREIGN KEY (vat_tu_ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (phieu_nhap_so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap)
);
CREATE TABLE don_dat_hang (

    so_dat_hang INT PRIMARY KEY,
    ngay_dat_hang VARCHAR(20),
    nha_cung_cap_ma_nha_cung_cap INT,
    FOREIGN KEY (nha_cung_cap_ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
CREATE TABLE chi_tiet_don_dat_hang (
    vat_tu_ma_vat_tu INT,
    don_dat_hang_so_dat_hang INT,
    FOREIGN KEY (vat_tu_ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (don_dat_hang_so_dat_hang)
        REFERENCES don_dat_hang (so_dat_hang)
);
DROP DATABASE `ss2_chuyen_doi_erd_sang_mo_hinh_quan_he`;

