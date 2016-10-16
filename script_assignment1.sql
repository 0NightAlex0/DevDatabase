
drop table if exists position_employee;
drop table if exists degree_employee;
drop table if exists address_employee;
drop table if exists address cascade;
drop table if exists degree cascade;
drop table if exists employee cascade;
drop table if exists headquarters cascade;
drop table if exists project cascade;
drop table if exists position_work cascade;
drop table if exists position_project cascade;

Create Table address(
country char not null,
postal_code char not null,
house_number char not null,
city char,
street char,
primary key (country,postal_code,house_number),
unique(country,postal_code,house_number)
);


Create Table degree(
course char not null,
school char not null,
d_level char not null,
primary key (course, school, d_level),
unique (course, school, d_level)
);

Create Table headquarters(
building_name char not null,
country char not null,
postal_code char not null,
house_number char not null,
building_rent int,
number_rooms int,
primary key (building_name),
foreign key (country,postal_code,house_number) references address(country,postal_code,house_number) on delete cascade
);

Create Table project(
p_id char not null,
p_budget int,
p_total_hours int,
building_name char ,
primary key (p_id),
foreign key (building_name) references headquarters on delete cascade
);
create table position_work(
pos_name char not null,
pos_description char,
hours_fee int,
primary key(pos_name)
);
Create Table employee(
e_bsn char not null,
e_name char,
e_surname char,
building_name char not null,
primary key (e_bsn),
foreign key (building_name) references headquarters on delete cascade
);

Create Table position_employee(
e_bsn char,
p_name char,
hours int,
primary key (e_bsn,p_name),
foreign key (e_bsn) references employee on delete cascade,
foreign key (p_name) references position_work on delete cascade
);

Create Table degree_employee(
e_bsn char,
course char not null,
school char not null,
d_level char not null,
primary key (e_bsn, course, school, d_level),
foreign key (e_bsn) references employee on delete cascade,
foreign key (course, school, d_level) references degree(course, school, d_level)
);

Create Table address_employee(
e_bsn char,
country char,
postal_code char,
house_number char,
primary key (e_bsn, country, postal_code,house_number),
foreign key (e_bsn) references employee on delete cascade,
foreign key (country,postal_code,house_number) references address(country,postal_code,house_number) on delete set null
);
create table position_project(
pos_name char,
p_id char,
primary key(pos_name, p_id),
foreign key (pos_name) references position_work on delete cascade,
foreign key (p_id )references project on delete cascade
);
INSERT INTO address(country,postal_code,house_number,city,street)
VALUES ('Nederland','3201TT','12','Acity','Astraatweg'),('Nederland','4211TT','12','Bcity','Bstraatweg'),('Nederland','3201TT','7b','Acity','Astraatweg'),('Nederland','3301TT','22','Kcity','Kstraatweg');
INSERT INTO headquarters(building_name,country,postal_code,house_number,building_rent,number_rooms)
VALUES ('H-Gebouw','Nederland','3201TT','12',2500,30),('D-Gebouw','Nederland','4211TT','12',5500,110),('X-Gebouw','Nederland','3201TT','7b',8500,30),('L-Gebouw','Nederland','3301TT','22',6500,110);
INSERT INTO employee(e_bsn,e_name,e_surname,building_name)
VALUES ('1112','Ruben','Everwijn','H-Gebouw'),('1113','Alex','Ng','H-Gebouw'),('1122','Iemand','Ergens','D-Gebouw');
INSERT INTO degree(course, school , d_level)
VALUES ('Economics','Erasmus','Bacherlor');
