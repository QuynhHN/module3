use `case_study_for_database`;
-- Task 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien 
where substring_index(nhan_vien.ho_ten,' ',-1) like 'H%'
or substring_index(nhan_vien.ho_ten,' ',-1) like 'T%'
or substring_index(nhan_vien.ho_ten,' ',-1) like 'K%'
and length(ho_ten)<=15;
-- Task 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where (YEAR(curdate()) - YEAR(ngay_sinh)) between 18 and 50
and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';
-- Task 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as 'Số lần đặt phòng của khách hàng'
from hop_dong inner join khach_hang on khach_hang.ma_khach_hang= hop_dong.ma_khach_hang
inner join loai_khach on loai_khach.ma_loai_khach= khach_hang.ma_loai_khach
where loai_khach.ten_loai_khach like 'Diamond'
group by khach_hang.ma_khach_hang
order by count(hop_dong.ma_khach_hang);
-- Task 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
