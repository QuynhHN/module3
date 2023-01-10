create database `ss1`;
use `ss1`;
create table class(
id int,
`name` varchar(50)
);
alter table class add primary key (id);
insert into class (id,name) values (1,'Nguyễn Văn A');
insert into class (id,name) values (2, 'Nguyễn Văn B');
select * from class;
create table teacher(
id int,
`name` varchar(50),
age int,
country varchar(30)
);
alter table teacher add primary key (id);
insert into teacher (id, name, age, country) values (1, 'Trần Văn A', 25, 'Đà Nẵng');
insert into teacher (id, name, age, country) values (2, 'Trần Văn B', 26, 'Hồ Chí Minh');
insert into teacher (id, name, age, country) values (3, 'Trần Văn C', 29, 'Đà Lạt');
select * from teacher;
drop database `ss1`;