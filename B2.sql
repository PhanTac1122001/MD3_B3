create database ss3b2;
use ss3b2;

create table customer(
	cid int auto_increment primary key,
    cname varchar(100) not null,
    cage int check (cage > 0)
    );
    insert into customer values(1,'Minh Quan', 10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha', 50);
    create table orders(
	oid int auto_increment primary key,
    cid int not null,
    foreign key (cid) references customer(cid),
    odate datetime not null,
    ototalprice double check (ototalprice > 0)
);
insert into orders values(1,1, '2006-3-21', 150000),
(2,2, '2006-3-23', 200000),
(3,1, '2006-3-16', 170000);

create table product(
	pid int auto_increment primary key,
    pname varchar(100) not null,
    pprice double check (pprice > 0)
);
insert into product values(1,'May giat', 300),
(2,'Tu lanh', 500),
(3,'Dieu hoa', 700),
(4,'Quat', 100),
(5,'Bep dien', 200),
(6,'May hut mui', 500);
create table orderdetail(
	oid int not null, 
    foreign key (oid) references orders (oid),
    pid int not null,
    foreign key (pid) references product (pid),
    odqty int check (odqty >= 0)
);
insert into orderdetail values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);


select * from customer;
select * from orders;
select * from product;
select * from orderdetail;

select oid, odate, ototalprice from orders;


select cname, pname, odqty
from customer c inner join orders o on c.cid = o.cid inner join orderdetail od on o.oid = od.oid  
inner join product p on od.pid = p.pid order by c.cname, p.pname;

select cname from customer c left join orders o on c.cid = o.cid where o.oid is null;

select odate, ototalprice from 
orders o inner join orderdetail od on o.oid = od.oid
inner join product p on od.pid = p.pid ;