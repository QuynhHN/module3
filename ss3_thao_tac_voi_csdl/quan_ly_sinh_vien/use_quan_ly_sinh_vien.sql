use `quan_ly_sinh_vien`;
select *
from student;

select *
from student
where status=true;

select *
from `subject`
where credit<10;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where student_name like 'h%';
