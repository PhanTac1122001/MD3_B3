create database ss3b1;
use ss3b1;

create table product(
id int auto_increment primary key,
name varchar(100),
created date
);
insert into product values (1,'Quần dài','1990-5-12') ;
insert into product values (2,'Áo dài','2005-10-5') ;
insert into product values (3,'Mũ phớt','1995-7-7');
create table size(
id int auto_increment primary key,
name varchar(100),
status bit
);
insert into size values (1,'X' ,0);
insert into size values (2,'M' ,0);
insert into size values (3,'L' ,0);
create table color(
id int auto_increment primary key,
name varchar(100),
status bit
);
insert into color values (1,'red',0) ;
insert into color values (2,'blue',0) ;
insert into color values (3,'green',0);

create table product_detail(
id int auto_increment primary key,
product_id int,
color_id int,
size_id int,
price double,
stock int,
status bit,
foreign key (product_id) references product(id),
 foreign key (color_id) references color(id),
 foreign key (size_id) references size(id)
);
insert into product_detail values(1,1,1,1,1200,5,0);
insert into product_detail values(2,2,1,1,1500,2,0);
insert into product_detail values(3,1,2,3,500,3,0);
insert into product_detail values(4,1,2,3,1600,3,1);


select * from product;
select * from size;
select * from color;
select * from product_detail;

select * from product_detail where price > 1200;

select * from product_detail where product_id = 1;