drop table if exists position_employee;
drop table if exists degree_employee;
drop table if exists address_employee;
drop table if exists address cascade;
drop table if exists degree cascade;
drop table if exists employee cascade;
drop table if exists headquarters cascade;
drop table if exists project cascade;
drop table if exists position_work cascade;


Create Table address(
country char(20) not null,
postal_code char(10) not null,
house_number char(10) not null,
city char(20),
street char(20),
primary key (country,postal_code,house_number),
unique(country,postal_code,house_number)
);

Create Table position_work(
p_name char(20) not null,
description char(300),
hours_fee int,
primary key (p_name)
);

Create Table degree(
degreeID int not null,
course char(20),
school char(20),
d_level char(20),
primary key (degreeID)
);

Create Table headquarters(
building_name char(20) not null,
country char(20) not null,
postal_code char(10) not null,
house_number char(10) not null,
building_rent int,
number_rooms int,
primary key (building_name),
foreign key (country,postal_code,house_number) references address(country,postal_code,house_number) on delete cascade
);

Create Table project(
p_id int not null,
p_budget int,
p_total_hours int,
building_name char(20) ,
primary key (p_id),
foreign key (building_name) references headquarters on delete cascade
);

Create Table employee(
e_bsn int not null,
e_name char(20),
e_surname char(20),
building_name char(20) not null,
primary key (e_bsn),
foreign key (building_name) references headquarters on delete cascade
);

Create Table position_employee(
bsn int,
p_name char(20),
hours int,
primary key (bsn,p_name),
foreign key (bsn) references employee on delete cascade,
foreign key (p_name) references position_work on delete cascade
);

Create Table degree_employee(
bsn int,
degreeID int,
primary key (bsn,degreeID) ,
foreign key (bsn) references employee on delete cascade,
foreign key (degreeID) references degree
);

Create Table address_employee(
bsn int,
country char(20),
postal_code char(10),
house_number char(10),
primary key (bsn, country, postal_code),
foreign key (bsn) references employee on delete cascade,
foreign key (country,postal_code,house_number) references address(country,postal_code,house_number) on delete set null
);

INSERT INTO address(country,postal_code,house_number,city,street)
VALUES ('Nederland','3201TT','12','Acity','Astraatweg'),('Nederland','4211TT','12','Bcity','Bstraatweg'),('Nederland','3201TT','7b','Acity','Astraatweg'),('Nederland','3301TT','22','Kcity','Kstraatweg');
INSERT INTO headquarters(building_name,country,postal_code,house_number,building_rent,number_rooms)
VALUES ('H-Gebouw','Nederland','3201TT','12',2500,30),('D-Gebouw','Nederland','4211TT','12',5500,110);
INSERT INTO employee(e_bsn,e_name,e_surname,building_name)
VALUES (1112,'Ruben','Everwijn','H-Gebouw'),(1113,'Alex','Ng','H-Gebouw'),(1122,'Iemand','Ergens','D-Gebouw');
