CREATE SCHEMA `e-commerce`;

USE  `e-commerce`;

CREATE TABLE user (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username nvarchar(50) unique not null,
    email nvarchar(100) not null,
    password nvarchar(60) not null,
	role smallint not null
);

CREATE TABLE proizvodi 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name NVARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    description NVARCHAR(100) NOT NULL
);

CREATE TABLE narudzba (
	id INT PRIMARY KEY AUTO_INCREMENT,
    proizvodi NVARCHAR(200) not null,
	total_cijena float not null,
    datum_narudzbe nvarchar(100) not null,
    status int not null,
	user_id int not null
);


insert into user(username,email,password,role)
values("admin","admin","admin", 1);

select * from user;
select * from proizvodi;
select * from narudzba;

