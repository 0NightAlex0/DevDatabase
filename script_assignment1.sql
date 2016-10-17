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
country varchar not null,
postal_code varchar not null,
house_number varchar not null,
city varchar,
street varchar,
primary key (country,postal_code,house_number),
unique(country,postal_code,house_number)
);


Create Table degree(
course varchar not null,
school varchar not null,
d_level varchar not null,
primary key (course, school, d_level),
unique (course, school, d_level)
);

Create Table headquarters(
building_name varchar not null,
country varchar not null,
postal_code varchar not null,
house_number varchar not null,
building_rent int,
number_rooms int,
primary key (building_name),
foreign key (country,postal_code,house_number) references address(country,postal_code,house_number) on delete cascade
);

Create Table project(
p_id varchar not null,
p_budget int,
p_total_hours int,
building_name varchar ,
primary key (p_id),
foreign key (building_name) references headquarters on delete cascade
);
create table position_work(
pos_name varchar not null,
pos_description varchar,
hours_fee int,
primary key(pos_name)
);
Create Table employee(
e_bsn varchar not null,
e_name varchar,
e_surname varchar,
building_name varchar not null,
primary key (e_bsn),
foreign key (building_name) references headquarters on delete cascade
);

Create Table position_employee(
e_bsn varchar,
p_name varchar,
hours int,
primary key (e_bsn,p_name),
foreign key (e_bsn) references employee on delete cascade,
foreign key (p_name) references position_work on delete cascade
);

Create Table degree_employee(
e_bsn varchar,
course varchar not null,
school varchar not null,
d_level varchar not null,
primary key (e_bsn, course, school, d_level),
foreign key (e_bsn) references employee on delete cascade,
foreign key (course, school, d_level) references degree(course, school, d_level)
);

Create Table address_employee(
e_bsn varchar,
country varchar,
postal_code varchar,
house_number varchar,
primary key (e_bsn, country, postal_code,house_number),
foreign key (e_bsn) references employee on delete cascade,
foreign key (country,postal_code,house_number) references address(country,postal_code,house_number) on delete set null
);
create table position_project(
e_bsn varchar,
p_id varchar,
pos_name varchar,
primary key(e_bsn, p_id, pos_name),
foreign key (e_bsn) references employee on delete cascade,
foreign key (p_id )references project on delete cascade,
foreign key(pos_name) references position_work on delete cascade
);
INSERT INTO address(country,postal_code,house_number,city,street)
VALUES ('Nederland','3201TT','12','Acity','Astraatweg'),('Nederland','4211TT','12','Bcity','Bstraatweg'),('Nederland','3201TT','7b','Acity','Astraatweg'),('Nederland','3301TT','22','Kcity','Kstraatweg');
INSERT INTO headquarters(building_name,country,postal_code,house_number,building_rent,number_rooms)
VALUES ('H-Gebouw','Nederland','3201TT','12',2500,30),('D-Gebouw','Nederland','4211TT','12',5500,110),('X-Gebouw','Nederland','3201TT','7b',8500,30),('L-Gebouw','Nederland','3301TT','22',6500,110);
INSERT INTO employee(e_bsn,e_name,e_surname,building_name)
VALUES ('1112','Ruben','Everwijn','H-Gebouw'),('1113','Alex','Ng','H-Gebouw'),('1122','Iemand','Ergens','D-Gebouw');
INSERT INTO degree(course, school , d_level)
VALUES ('Economics','Erasmus','Bacherlor'),('Informatica','HRO','Bachelor');
INSERT INTO degree_employee(e_bsn, course, school, d_level)
VALUES ('1112','Economics','Erasmus','Bacherlor'),('1113','Informatica','HRO','Bachelor'),('1122','Economics','Erasmus','Bacherlor');
INSERT INTO address_employee(e_bsn, country, postal_code,house_number)
VALUES ('1112','Nederland','3201TT','12'),('1113','Nederland','4211TT','12'),('1122','Nederland','3201TT','7b');
INSERT INTO project (p_id,p_budget,p_total_hours,building_name)
VALUES ('1',1000,100,'H-Gebouw'),('2',1500,150,'D-Gebouw'),('3',2000,500,'D-Gebouw'),('4',1850,300,'X-Gebouw');
INSERT INTO position_work (pos_name,pos_description, hours_fee)
VALUES ('Manager','Manage',100),('Developer','Develop',80),('Tester','Test',65);
INSERT INTO position_employee(e_bsn,p_name,hours)
VALUES ('1112', 'Manager', 100), ('1113', 'Developer', 200),('1122', 'Tester', 120);
--INSERT INTO position_project (e_bsn, p_id, pos_name)
--VALUES ('1112', '1', 'Developer'),('1113', '2','Developer'),('1122','3','Tester');