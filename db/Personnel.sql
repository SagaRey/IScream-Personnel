-- 删除数据表
drop table talents;
drop table probationary;
drop table mobilizedep;
drop table mobilizepost;
drop table dimission;
drop table managements;
drop table employees;
drop table posts;
drop table departments;

drop view departmentinfo;
drop view employeeinfo;
drop view mobilizedepinfo;
drop view mobilizepostinfo;
drop view probationaryinfo;
drop view dimissioninfo;

-- 删除数据库
drop database personnel;



-- 创建数据库
create database personnel;

-- 使用数据库
use personnel;

-- 创建表
create table managements(
	id int(4) auto_increment primary key,
	name varchar(16) unique NOT NULL,
	password varchar(16) NOT NULL
);



create table departments(
	depid int(4) auto_increment primary key,
	name varchar(16) unique NOT NULL,
	parentdepid int(4),
	type tinyint(2) NOT NULL,
	phone varchar(16),
	established date NOT NULL,
	foreign key (parentdepid) references departments(depid) on update cascade on delete restrict
);

alter table departments auto_increment = 1000;



create table posts(
	postid int(4) auto_increment primary key,
	name varchar(16) unique NOT NULL,
	type tinyint(2) NOT NULL,
	establishment int(4)
);

alter table posts auto_increment = 6000;



create table employees(
	empid int(8) auto_increment primary key,
	name varchar(16) NOT NULL,
	sex varchar(6) NOT NULL check(sex in('male','female')),
	type tinyint(2) NOT NULL,
	birthday date NOT NULL,
	identity varchar(18) unique NOT NULL,
	depid int(4) NOT NULL,
	postid int(4) NOT NULL,
	hiredate date NOT NULL,
	nativeplace varchar(16),
	phone varchar(16),
	email varchar(32),
	foreign key (depid) references departments(depid) on update cascade on delete restrict,
	foreign key (postid) references posts(postid) on update cascade on delete restrict
);

alter table employees auto_increment = 10000000;



create table talents(
	id int(8) auto_increment primary key,
	name varchar(16) unique NOT NULL,
	sex varchar(6) NOT NULL,
	birthday date NOT NULL,
	identity varchar(18) NOT NULL,
	nativeplace varchar(16),
	phone varchar(16),
	email varchar(32)
);



create table probationary(
	id int(4) auto_increment primary key,
	empid int(8) NOT NULL,
	startdate date NOT NULL,
	enddate date NOT NULL,
	status tinyint(2) NOT NULL,
	foreign key (empid) references employees(empid) on update cascade on delete restrict
);



create table mobilizedep(
	id int(4) auto_increment primary key,
	empid int(8) NOT NULL,
	originaldepid int(4) NOT NULL,
	currentdepid int(4) NOT NULL,
	mobilizedate date NOT NULL,
	type tinyint(2) NOT NULL,
	foreign key (empid) references employees(empid) on update cascade on delete restrict,
	foreign key (originaldepid) references departments(depid) on update cascade on delete restrict,
	foreign key (currentdepid) references departments(depid) on update cascade on delete restrict
);



create table mobilizepost(
	id int(4) auto_increment primary key,
	empid int(8) NOT NULL,
	originalpostid int(4) NOT NULL,
	currentpostid int(4) NOT NULL,
	mobilizedate date NOT NULL,
	type tinyint(2) NOT NULL,
	foreign key (empid) references employees(empid) on update cascade on delete restrict,
	foreign key (originalpostid) references posts(postid) on update cascade on delete restrict,
	foreign key (currentpostid) references posts(postid) on update cascade on delete restrict
);



create table dimission(
	id int(4) auto_increment primary key,
	empid int(8) NOT NULL,
	dimissiondate date NOT NULL,
	type tinyint(2) NOT NULL,
	istalent boolean NOT NULL,
	foreign key (empid) references employees(empid) on update cascade on delete restrict
);

-- 创建视图
create view departmentinfo as
	select dep.depid,dep.name,dep.parentdepid,d.name parentdepname,dep.type,dep.phone,dep.established
	from departments dep left join departments d
	on dep.parentdepid = d.depid;

create view employeeinfo as
	select e.empid,e.name,e.sex,e.type,e.birthday,e.identity,e.depid,d.name depname,e.postid,p.name postname,e.hiredate,e.nativeplace,e.phone,e.email
	from employees e,departments d,posts p
	where e.depid = d.depid and e.postid = p.postid;

create view mobilizedepinfo as
	select m.id,m.empid,e.name empname,m.originaldepid,d1.name originaldepname,m.currentdepid,d2.name currentdepname,m.mobilizedate,m.type
	from mobilizedep m,employees e,departments d1,departments d2
	where m.empid = e.empid and m.originaldepid = d1.depid and m.currentdepid = d2.depid;

create view mobilizepostinfo as
	select m.id,m.empid,e.name empname,m.originalpostid,p1.name originalpostname,m.currentpostid,p2.name currentpostname,m.mobilizedate,m.type
	from mobilizepost m,employees e,posts p1,posts p2
	where m.empid = e.empid and m.originalpostid = p1.postid and m.currentpostid = p2.postid;

create view probationaryinfo as
	select pro.id,pro.empid,e.name empname,pro.startdate,pro.enddate,e.depid,d.name depname,e.postid,p.name postname,pro.status
	from probationary pro,employees e,departments d,posts p
	where pro.empid = e.empid and e.depid = d.depid and e.postid = p.postid;

create view dimissioninfo as
	select dim.id,dim.empid,e.name empname,dim.dimissiondate ,e.depid depid,d.name depname,e.postid postid,p.name postname,dim.type,dim.istalent
	from dimission dim,employees e,departments d,posts p
	where dim.empid = e.empid and e.depid = d.depid and e.postid = p.postid;


--创建触发器
create trigger changeemployeedep after insert on mobilizedep for each row
		update employees set employees.depid = new.currentdepid where employees.empid = new.empid

create trigger changeemployeepost after insert on mobilizepost for each row
		update employees set employees.postid = new.currentpostid where employees.empid = new.empid