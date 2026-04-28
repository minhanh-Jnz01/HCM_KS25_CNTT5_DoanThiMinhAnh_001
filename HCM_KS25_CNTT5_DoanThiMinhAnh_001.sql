drop database SalesManagement;
create database SalesManagement;

use SalesManagement;

create table products(
product_id int primary key auto_increment,
product_name varchar(255),
brand varchar(255),
price decimal(18, 2),
stock smallint
); 

create table customers (
customer_id int primary key auto_increment,
full_name varchar(255) not null,
email varchar(255) not null,
phone varchar(10),
address varchar(500)
);

create table orders (
order_id int primary key auto_increment,
customer_id int,
order_date timestamp default current_timestamp,
total decimal(18, 2),
foreign key (customer_id) references customers(customer_id)
);

create table orders_detail (
order_detail_id int primary key auto_increment,
order_id int,
product_id int,
quantity smallint,
price_order decimal(18, 2),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

-- phan II
alter table orders
add Ghi_chu text;

alter table products
change brand nha_san_xuat varchar(255);

drop table orders_detail;
drop table orders;
drop table customers;


-- phan III
insert into products (product_name, nha_san_xuat, price, stock)
values
('Ti vi SamSung', 'Cong Ty co phan SamSung', 25000000, 15),
('IPhone 15', 'Apple Inc', 20000000, 10),
('Laptop Asus', 'Cong Ty cong nghe Asus', 30000000, 25),
('Dien thoai SamSung', 'Cong Ty co phan SamSung', 10000000, 30),
('Ti vi LG', 'Cong Ty co phan LG', 35000000, 7);

insert into customers(full_name, email, phone, address)
values
('Doan Thi A', 'doana@gmail.com', '0868044044', 'TPHCM'),
('Le Thi B', 'Leb@gmail.com', '0868044011', 'TPHCM'),
('Duong Van C', 'duongc@gmail.com', '0997044000', 'TPHCM'),
('Tran Thi D', 'trand@gmail.com', '0123456789', 'TPHCM'),
('Nguyen Van N', 'nguyenN@gmail.com','0231564879', 'Ha Noi');

insert into orders (customer_id, order_date)
values 
(1, current_timestamp()),
(2, current_timestamp()),
(3, current_timestamp()),
(4, current_timestamp()),
(5, current_timestamp());

insert into orders_detail (order_id, product_id, quantity, price_order)
values
(1, 1, 3, 25000000),
(2, 3, 3, 30000000),
(3, 2, 3, 20000000),
(4, 1, 3, 25000000),
(1, 4, 3, 10000000);

update products
set price = price * 0.9
where nha_san_xuat = 'Apple Inc' and product_id > 0;

insert into customers(full_name, email, phone, address)
values
('Doan Thi', 'doa@gmail.com', null, 'TPHCM'),
('Le Thi', 'Le@gmail.com', null , 'TPHCM');

delete from customers
where phone is null and customer_id > 0;

select * from products 
where price between 10000000 and 20000000;

select order_id, order_date from orders
where customer_id in (
	select customer_id from customers
    where address = 'TPHCM');

select * from orders 
where order_id = 'DH001';


select * from orders;

