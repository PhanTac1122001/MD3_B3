create database ss3b5;
use ss3b5;

create table accounts(
	id int auto_increment primary key,
    username varchar(100) unique not null,
    password varchar(100) not null,
    address varchar(255) not null,
    status bit
);

insert into accounts ( username, password, address, status) values
('Hùng', '123456', 'Hưng Yên', 1),
('Cường' , '654321', 'Hà Nội', 1),
('Bách', '135790', 'Hải Dương', 1);

create table bill(
	id int auto_increment primary key,
    billtype bit,
    accid int,
    foreign key (accid) references accounts(id),
    created datetime,
    authdate datetime
);

insert into bill ( billtype, accid, created , authdate) values
(0, 1, str_to_date('11/02/2022' , '%d/%m/%Y'), str_to_date('12/03/2022' , '%d/%m/%Y')),
(0, 1, str_to_date('05/10/2023' , '%d/%m/%Y'), str_to_date('10/10/2023' , '%d/%m/%Y')),
(1, 2, str_to_date('15/05/2024' , '%d/%m/%Y'), str_to_date('20/05/2024' , '%d/%m/%Y')),
(1, 3, str_to_date('01/02/2022' , '%d/%m/%Y'), str_to_date('10/02/2022' , '%d/%m/%Y'));


create table product(
	id int auto_increment primary key,
    name varchar(100) unique not null,
    created date,
    price double check(price > 0),
    stock int check (stock >= 0),
    status bit 
);
insert into product (name, created, price, stock, status) values
('Quần dài', str_to_date('12/03/2022' , '%d/%m/%Y'), 1200, 5, 1),
('Áo dài', str_to_date('15/03/2023' , '%d/%m/%Y'), 1500, 8, 1),
('Mũ cối', str_to_date('08/03/1999' , '%d/%m/%Y'), 1600, 10, 1);

create table billdetail(
	id int auto_increment primary key,
    billid int ,
    foreign key (billid) references bill (id),
    productid int,
    foreign key (productid) references product(id),
    quantity int check (quantity >=0),
    price double check (price > 0)
);
insert into billdetail (billid, productid, quantity, price) values
(1, 1, 3, 1200),
(1, 2, 4, 1500),
(2, 1, 1, 1200),
(3, 2, 4, 1500),
(4, 3, 7, 1600);


select * from accounts order by username DESC;

select * from bill where authdate between  '2023-02-11' AND '2024-05-15';

select * from billdetail bd inner join bill b on 
bd.billid = b.id where b.id = 1;

select name from product order by name desc;

select * from product where stock >= 10;

select * from product where status = 1; 