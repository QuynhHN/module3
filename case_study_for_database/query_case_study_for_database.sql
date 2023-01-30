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
-- Task 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, 
dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, 
sum((dich_vu.chi_phi_thue + ifnull((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia), 0))) as 'Tổng tiền'
from hop_dong
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
right join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
group by hop_dong.ma_hop_dong, khach_hang.ma_khach_hang
order by khach_hang.ma_khach_hang;
-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where (month(hop_dong.ngay_lam_hop_dong) between 4 and 12 and year(hop_dong.ngay_lam_hop_dong) = 2021)
group by dich_vu.ma_dich_vu
order by dich_vu.ma_dich_vu;
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where year(hop_dong.ngay_lam_hop_dong) = 2020 -- and not exists (select * from hop_dong where hop_dong.ngay_lam_hop_dong = 2021) -- and year(hop_dong.ngay_lam_hop_dong) != 2021
group by dich_vu.ma_dich_vu, loai_dich_vu.ten_loai_dich_vu
order by dich_vu.ma_dich_vu;
-- còn đoạn nhưng chưa từng ko biết giải
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select distinct khach_hang.ho_ten
from khach_hang
order by khach_hang.ho_ten;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as tháng, count(khach_hang.ma_khach_hang) as so_luong
from hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) =2021
group by month(hop_dong.ngay_lam_hop_dong)
order by tháng;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong,
-- ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach like 'Diamond' and (khach_hang.dia_chi like '%Vinh' or khach_hang.dia_chi like '%Quảng Ngãi')
group by dich_vu_di_kem.ma_dich_vu_di_kem;
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021
select hd.ma_hop_dong, nv.ho_ten as ho_ten_nv, kh.ho_ten as ho_ten_kh, kh.so_dien_thoai as so_dien_thoai_kh, dv.ten_dich_vu, sum(hdct.so_luong) as so_luong_dich_vu_di_kem, hd.tien_dat_coc, hd.ngay_lam_hop_dong
from hop_dong as hd
join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where (month(ngay_lam_hop_dong) between 10 and 12) and year(ngay_lam_hop_dong) =2020
group by hd.ma_hop_dong, nv.ho_ten, dv.ten_dich_vu;
-- còn đoạn nhưng chưa từng ko biết giải
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
group by dich_vu_di_kem.ma_dich_vu_di_kem;
-- mới đúng 1 nửa
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
select  hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong as hd
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong, dvdk.ten_dich_vu_di_kem
having so_lan_su_dung = 1
order by hd.ma_hop_dong;
-- đang lỗi
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien as nv
join trinh_do as td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan as bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong as hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count(hd.ma_hop_dong) <=3
order by nv.ma_nhan_vien;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete  from nhan_vien
where ma_nhan_vien in (
	select cid from (
		select distinct nv.ma_nhan_vien as cid from nhan_vien as nv 
		join hop_dong as hd on nv.ma_nhan_vien = hd.ma_nhan_vien 
		where year(ngay_lam_hop_dong) between 2019 and 2021 
		group by nv.ma_nhan_vien 
        having count(hd.ma_hop_dong) <1) as c);
-- SET SQL_SAFE_UPDATES = 0;
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang
set Platinum = Diamond;
-- where ma_khach_hang in (select ma_khach_hang from khach_hang join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang  where
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
delete from khach_hang
where ma_khach_hang in(
	select idkh from(
		select distinct khach_hang.ma_khach_hang as idkh from khach_hang 
		join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
		where year (ngay_lam_hop_dong) <2021) as c );
SET FOREIGN_KEY_CHECKS=0;
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia = gia *10
where ma_dich_vu_di_kem in (
	select id from(
		select ma_dich_vu_di_kem as id 
        from dich_vu_di_kem 
        group by ma_dich_vu_di_kem 
        having count(ma_dich_vu_di_kem) > 10) as c);
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
drop view if exists danh_sach;
create view danh_sach as(
select nhan_vien.ma_nhan_vien, khach_hang.ma_khach_hang, nhan_vien.ho_ten, nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi,
khach_hang.ho_ten, khach_hang.email, khach_hang.so_dien_thoai, khach_hang.ngay_sinh, khach_hang.dia_chi
from  nhan_vien
left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where nhan_vien.ma_nhan_vien = khach_hang.ma_khach_hang 
and nhan_vien.ho_ten = khach_hang.ho_ten 
and nhan_vien.email = khach_hang.email 
and nhan_vien.so_dien_thoai = khach_hang.so_dien_thoai
and nhan_vien.ngay_sinh = khach_hang.ngay_sinh 
and khach_hang.dia_chi = nhan_vien.dia_chi)
