-- 1、设计一个考勤系统，包含员工表，考勤记录表
-- 2、设计一个学校宿舍管理系统，要求包含宿舍信息，学生信息，每日的宿舍查房记录。
-- 3、设计一个车辆违章系统，包含用户表，车辆表，违章信息表。违章信息表中包含用户和车辆的违章信息
-- 4、设计一个学校食堂管理系统，包含食堂表，食堂仓口表，仓口收费记录表

1.drop table if exists staff;
create table staff (
id int primary key auto_increment,
name varchar(20) comment '员工姓名'
);


drop table if exists attendance_record;
create table attendance_record(
id int primary key auto_increment,
attendance_record_id int,
sign_in_time timestamp null comment '签到',
sign_out_time timestamp null comment '签退',
foreign key(attendance_record_id) references staff(id)
);


2.drop table if exists dorm;
create table dorm(
id int primary key auto_increment,
);


drop table if exists student;
create table student(
id int primary key auto_increment,
name varchar(20) comment '学生姓名'
dorm_id int comment '宿舍id',
foreign key(dorm_id) references dorm(id)
);


drop table if exists check_record;
create table check_record(
id int primary key auto_increment,
dorm_id int comment '宿舍id',
check_time timestamp null comment '查询时间'
foreign key(dorm_id) references dorm(id)
);


3.drop table if exists user;
create table user(
id int primary key auto_increment,
name varchar(20) comment '用户姓名'
);


drop table if exists car;
create table car(
id int primary key auto_increment,
user_id int comment '用户ID'
foreign key(user_id) references user(id)
);


drop table if exists cars_violation;
create table cars_violation(
id int primary key auto_increment,
car_id int comment '车辆ID',
user_id int comment'车辆用户ID'
foreign key(user_id) references user(id)
foreign key(car_id) references car(id)
);



4.drop table if exists canteen;
create table canteen(
id int primary key auto_increment
);

drop table if exists window;
create table window(
id int primary key auto_increment,
canteen_id int comment '食堂ID',
foreign key(canteen_id) references canteen(id)
);

drop table if exists charges;
create table charges(
id int primary key auto_increment,
window_id int comment '窗口ID',
window_income int comment '盈利金额',
foreign key(window_id) references window(id)
);

-- 有一张员工表emp，字段：姓名name，性别sex，部门depart，工资salary。查询以下数据：
-- 1、查询男女员工的平均工资
-- 2、查询各部门的总薪水
-- 3、查询总薪水排名第二的部门
-- 4、查询姓名重复的员工信息
-- 5、查询各部门薪水大于10000的男性员工的平均薪水
select avg(salary) from emp group by sex;
select sum(salary) from emp group by salary;
select sum(salary) from emp group by salary having;
select (select distinct salary from emp order by Ssalary desc limit 1,1)as SecondDepart;
