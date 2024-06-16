create table physician(
emp_id number(5) primary key,
e_name varchar2(20),
position varchar2(20),
ssn number(10)
);
create table departments(
department_id number(5) primary key,
department_name varchar2(20),
head number(5),
constraints d_h_fk foreign key (head)
references 
physician(emp_id)
);
create table affilated_with(
physician number(5),
a_department number(5),
primary_affilation varchar2(20),
constraints p_a_fk foreign key(physician)
references 
physician(emp_id),
constraints d_d_fk foreign key(a_department)
references 
departments(department_id)
);
create table procedure(
p_code number(5) primary key,
p_name varchar2(20),
p_cost number(10)
);
create table trained_in(
physician number(5),
treatment number(5),
certification_date date,
certification_expires date,
constraints t_p_fk foreign key (physician)
references
physician (emp_id),
constraints t_t_fk foreign key (treatment)
references
procedure(p_code)
);
create table patients(
ssn number(5) primary key,
pt_name varchar2(20),
pt_address varchar2(20),
phone number(10),
insurance_id number(7),
pcp number(5),
constraints pt_p_fk foreign key(pcp)
references 
physician(emp_id)
);
create table nurse(
n_id number(5) primary key,
n_name varchar2(20),
position varchar2(20),
registered varchar2(20),
n_ssn number(5)
);
create table appointment(
apt_id number(5) primary key,
patient number(5),
prenurse number(5),
physician number(5),
start_dt date,
end_date date,
examination_room number(5),
constraints a_p_fk foreign key(patient)
references
patients(ssn),
constraints a_pr_fk foreign key(prenurse)
references
nurse(n_id),
constraints a_ph_fk foreign key(physician)
references
physician(emp_id)
);
create table medication(
m_code number(5) primary key,
m_name varchar2(20),
brand varchar2(20),
description varchar2(20)
);
create table prescribes(
physician number(5),
patient number(5),
m_code number(5),
apt_id number(5),
pr_date date,
dose number(5),
constraints pr_p_fk foreign key(physician)
references
physician(emp_id),
constraints pr_pt_fk foreign key(patient)
references
patients(ssn),
constraints pr_m_fk foreign key(m_code)
references
medication(m_code),
constraints pr_apt_fk foreign key(apt_id)
references
appointment(apt_id)
);
create table block(
block_floor number(5) primary key,
block_code varchar2(20)
);
create table room(
room_no number(5) primary key,
room_type varchar2(20),
block_floor number(5),
unavailable varchar2(20),
constraints r_bk_fk foreign key(block_floor)
references
block(block_floor)
);
create table on_call(
nurse number(5),
block_floor number(5),
on_call_start date,
on_call_end date,
constraints on_n_fk foreign key(nurse)
references
nurse(n_id),
constraints on_b_fk foreign key(block_floor)
references
block(block_floor)
);
create table stay(
stay_id number(5) primary key,
patient number(5),
room_no number(5),
start_time number(5),
end_time number(5),
constraints s_st_fk foreign key(patient)
references
patients(ssn),
constraints st_r_fk foreign key(room_no)
references
room(room_no)
);

create table undergoes(
patient number(5),
p_code number(5),
stay number(5),
un_date date,
physician number(5),
assign_nurse number(5),
constraints u_p_fk foreign key(patient)
references
patients(ssn),
constraints u_pr_fk foreign key(p_code)
references
procedure(p_code),
constraints u_s_fk foreign key(stay)
references 
stay(stay_id),
constraints u_ph_fk foreign key(physician)
references
physician(emp_id),
constraints u_n_fk foreign key(assign_nurse)
references
nurse(n_id)
);
insert into physician values(1,'Raman','Staff internist',11111);
insert into physician values(2,'Renuka','Attending physician',22222);
insert into physician values(3,'Ajay','Surgical physician',33333);
insert into physician values(4,'Yash','Staff internist',44444)
insert into physician values(5,'Sagar', 'Attending physician',55555)
insert into physician values(6,'Sita','MD resident',66666)
insert into physician values(7,'Pooja','Staff internist',77777)
insert into physician values(8,'Ramesh','Attending physician',88888)
insert into physician values(9,'Shashi','Head chief medicine',99999)
insert into physician values(10,'Aniket','Staff internist',10101)
insert into physician values(11,'Rohan','Attending physician',12121)
insert into physician values(12,'Shital','MD resident',13131)
insert into physician values(13,'Kajal','Head chief medicine',14141)
insert into physician values(14,'Lucky','Staff internist',15151)
insert into physician values(15,'Snehal','Senior  physician',16161)
insert into physician values(16,'Komal','Surgical physician',17171)
insert into physician values(17,'Umesh','Staff internist',18181)
insert into physician values(18,'Nita','MD resident',19191)
insert into physician values(19,'Komal','Attending physician',20202)
insert into physician values(20,'Aniruddh','Attending physician',21212);
select * from physician;
select * from departments;
insert into departments values(101,'General medicine',1)
insert into departments values(102,'Surgery',2)
insert into departments values(103,'Psychiatry',3)
insert into departments values(105,'Surgery',11)
insert into departments values(106,'General medicine',5)
insert into departments values(107,'General medicine',8)
insert into departments values(108,'Surgery',12)
insert into departments values(109,'Psychiatry',14)
insert into departments values(110,'General medicine',19)
insert into departments values(111,'Psychiatry',10)
insert into departments values(112,'Psychiatry',13)
insert into departments values(113,'General medicine',9)
insert into departments values(114,'Surgery',6)
insert into departments values(115,'General medicine',15)
insert into departments values(116,'Psychiatry',7)
insert into departments values(117,'General medicine',16)
insert into departments values(118,'Surgery',17)
insert into departments values(119,'General medicine',20)
select * from departments;
insert into affilated_with values(1,101,'t');
insert into affilated_with values(2,102,'t');
insert into affilated_with values(3,103,'f');
insert into affilated_with values(11,105,'t');
insert into affilated_with values(5,106,'t');
insert into affilated_with values(8,107,'f');
insert into affilated_with values(12,108,'f');
insert into affilated_with values(14,109,'t');
insert into affilated_with values(19,110,'t');
insert into affilated_with values(10,111,'f');
insert into affilated_with values(13,112,'t');
insert into affilated_with values(9,113,'f');
insert into affilated_with values(6,114,'t');
insert into affilated_with values(15,115,'t');
insert into affilated_with values(7,116,'f');
insert into affilated_with values(16,117,'t');
insert into affilated_with values(17,118,'t');
insert into affilated_with values(20,119,'t');
select * from affilated_with;
insert into procedure values(1,'Sonography',1500);
insert into procedure values(2,'Angiography',5000);
insert into procedure values(3,'2D ECHO',1500);
insert into procedure values(4,'Electrocardiogram',2000);
insert into procedure values(5,'Sonography',1500);
insert into procedure values(6,'Dermogastrotomy',1000);
insert into procedure values(7,'C.TScan',5500);
insert into procedure values(8,'MRI',4500);
insert into procedure values(9,'Sonography',1500);
insert into procedure values(10,'Electrocardiogram',2000);
insert into procedure values(11,'C.TScan',5500);
insert into procedure values(12,'Dermogastrotomy',1000);
insert into procedure values(13,'Sonography',1500);
insert into procedure values(14,'2D ECHO',1500);
insert into procedure values(15,'Electrocardiogram',2000);
insert into procedure values(16,'Sonography',1500);
insert into procedure values(17,'Angiography',5000);
insert into procedure values(18,'Angiography',5000);
select * from procedure;
select * from physician;
insert into trained_in values(1,11,'1-01-2001','09-12-2001');
insert into trained_in values(2,12,'1-07-2002','09-12-2002');
insert into trained_in values(3,13,'1-12-2001','17-12-2003');
insert into trained_in values(20,14,'31-05-2001','09-05-2003');
insert into trained_in values(5,15,'29-03-2005','19-02-2008');
insert into trained_in values(6,16,'1-01-2001','09-12-2001');
insert into trained_in values(7,17,'17-05-2003','09-12-2003');
insert into trained_in values(8,18,'01-04-2003','09-12-2003');
insert into trained_in values(9,1,'31-01-2001','09-12-2001');
insert into trained_in values(10,2,'1-01-2001','09-12-2001');
insert into trained_in values(11,3,'1-01-2001','09-12-2001');
insert into trained_in values(12,4,'20-01-2008','09-12-2009');
insert into trained_in values(13,5,'1-01-2007','30-12-2008');
insert into trained_in values(14,6,'29-01-2011','09-12-2012');
insert into trained_in values(15,7,'1-01-2013','09-12-2014');
insert into trained_in values(16,8,'19-10-2021','09-12-2022');
insert into trained_in values(17,9,'11-11-2020','09-12-2022');
insert into trained_in values(18,10,'1-01-2022','09-12-2023');
select * from trained_in;
select * from patients;
insert into patients values(10001,'Samar','Pune',8989675434,12345,1);
insert into patients values(10002,'Sayali','Nagar',9989665439,12346,2);
insert into patients values(10003,'Pooja','Pune',8999655637,12347,3);
insert into patients values(10004,'Shital','Thane',9980675534,12348,20);
insert into patients values(10005,'Shamal','Nashik',9989875444,12349,5);
insert into patients values(10006,'Pravin','Mumbai',8944676434,12310,6);
insert into patients values(10007,'Swati','Nagar',7447307430,12311,7);
insert into patients values(10008,'Divya','Pune',8459415873,12312,8);
insert into patients values(10009,'Yash','Amaravati',9552675434,12313,9);
insert into patients values(10010,'Ketan','Pune',7867546790,12314,10);
insert into patients values(10011,'Arjun','Delhi',992145434,12315,11);
insert into patients values(10012,'Ganesh','Nagar',9923606330,12316,12);
insert into patients values(10013,'Akash','Nashik',7218404167,12317,13);
insert into patients values(10014,'Rutuja','Delhi',8999630723,12318,14);
insert into patients values(10015,'Rohan','Pune',9403782445,12319,15);
insert into patients values(10016,'Sai','Akola',8967543627,12320,16);
insert into patients values(10017,'mangesh','Pune',8976989089,12321,17);
insert into patients values(10018,'Ankit','Nashik',9990896734,12322,18);
select * from patients;
insert into nurse values(1,'Kavita','Head nurse','t',12345);
insert into nurse values(2,'Neena','Nurse','t',12346);
insert into nurse values(3,'Komal','Nurse','f',12347);
insert into nurse values(4,'Sakshi','Head nurse','t',12348);
insert into nurse values(5,'Kaveri','Head nurse','f',12349);
insert into nurse values(6,'Gayatri','Nurse','t',12310);
insert into nurse values(7,'Snehal','Head nurse','f',12311);
insert into nurse values(8,'Smita','Nurse','t',12312);
insert into nurse values(9,'Kavya','Nurse','t',12313);
insert into nurse values(10,'Pooja','Head nurse','t',12314);
insert into nurse values(11,'Pallavi','Nurse','f',12315);
insert into nurse values(12,'Kishori','Head nurse','t',12316);
insert into nurse values(13,'Tejal','Nurse','t',12317);
insert into nurse values(14,'Sejal','Head nurse','t',12318);
insert into nurse values(15,'Deepika','Nurse','f',12319);
insert into nurse values(16,'Saufiya','Head nurse','t',12320);
insert into nurse values(17,'Sonali','Head nurse','t',12321);
insert into nurse values(18,'Gargi','Head nurse','t',12322);
select * from nurse;
select * from patients;
insert into appointment values(1,10001,1,1,'01-01-2001','31-12-2001',1);
insert into appointment values(2,10002,2,2,'01-11-2001','31-12-2001',1);
insert into appointment values(3,10003,3,3,'22-11-2001','11-1-2002',2);
insert into appointment values(4,10004,4,20,'10-01-2002','31-12-2002',3);
insert into appointment values(5,10005,5,5,'20-01-2002','31-03-2002',2);
insert into appointment values(6,10006,6,6,'22-01-2002','31-03-2002',1);
insert into appointment values(7,10007,7,7,'30-04-2003','31-05-2003',3);
insert into appointment values(8,10008,8,8,'01-01-2004','30-06-2001',2);
insert into appointment values(9,10009,9,9,'16-08-2002','31-12-2002',1);
insert into appointment values(10,10010,10,10,'20-10-2001','31-12-2001',2);
insert into appointment values(11,10011,11,11,'22-11-2005','31-12-2005',1);
insert into appointment values(12,10012,12,12,'24-11-2004','31-12-2004',3);
insert into appointment values(13,10013,13,13,'25-01-2005','31-03-2051',4);
insert into appointment values(14,10014,14,14,'30-01-2005','25-05-2005',5);
insert into appointment values(15,10015,15,15,'20-01-2006','31-08-2006',2);
insert into appointment values(16,10016,16,16,'01-01-2007','31-05-2007',4);
insert into appointment values(17,10017,17,17,'01-08-2007','31-12-2007',4);
insert into appointment values(18,10018,18,18,'20-01-2008','30-04-2008',5);
select * from appointment;


insert into medication values(1,'Procrastin_X','X','N/A');
insert into medication values(2,'Thesisin','foo labs','N/A');
insert into medication values(3,'Procrastin_X','X','N/A');
insert into medication values(4,'Awasin','Bar laboratories','N/A');
insert into medication values(5,'Crescaviatin','Baz industries','N/A');
insert into medication values(6,' Melioraurin','Snafu Pharma','N/A');
insert into medication values(7,'Awasin','Bar laboratories','N/A');
insert into medication values(8,'Paracetamol','Cipla','N/A');
insert into medication values(9,'Cipladine','Cipla','N/A');
insert into medication values(10,'Citerizine','Cipla','N/A');
select * from medication;
select * from appointment;
select * from patients;
insert into block values(1,'A');
insert into block values(2,'B');
insert into block values(3,'C');
insert into block values(4,'A');
insert into block values(5,'B');
insert into block values(6,'C');
insert into block values(7,'D');
insert into block values(8,'A');
insert into block values(9,'B');
insert into block values(10,'C');
select * from block;
insert into room values(1,'Single',4,'f');
insert into room values(2,'Single',3,'f');
insert into room values(3,'Single',5,'f');
insert into room values(4,'Single',2,'f');
insert into room values(5,'Single',1,'f');
insert into room values(6,'Single',7,'f');
insert into room values(7,'Single',8,'f');
insert into room values(8,'Single',6,'f');
insert into room values(9,'Single',9,'f');
insert into room values(10,'Single',10,'f');
select * from room;
select * from nurse;
insert into on_call values(1,1,'21-10-2002','23-11-2002');
insert into on_call values(2,2,'21-03-2001','23-11-2002');
insert into on_call values(3,3,'1-10-2000','03-11-2002');
insert into on_call values(4,4,'21-10-2002','23-11-2002');
insert into on_call values(5,5,'01-03-2002','23-11-2002');
insert into on_call values(6,6,'20-10-2008','23-11-2008');
insert into on_call values(7,7,'21-10-2002','23-11-2002');
insert into on_call values(8,8,'17-10-2003','20-11-2003');
insert into on_call values(9,9,'1-10-2004','23-11-2004');
insert into on_call values(10,10,'21-10-2002','23-11-2002');
select * from on_call;
select * from room;
insert into stay values(1,10001,1,9,11);
insert into stay values(2,10002,2,12,11);
insert into stay values(3,10003,3,2,11);
insert into stay values(4,10004,4,10,1);
insert into stay values(5,10005,5,9,11);
insert into stay values(6,10006,6,9,3);
insert into stay values(7,10007,7,6,11);
insert into stay values(8,10008,8,8,6);
insert into stay values(9,10009,9,2,11);
insert into stay values(10,10010,10,9,6);
select * from stay;
select * from procedure;
select * from nurse;
insert into undergoes values(10001,1,1,'01-03-2002',1,1);
insert into undergoes values(10002,2,2,'04-03-2004',2,2);
insert into undergoes values(10003,3,3,'01-10-2002',3,3);
insert into undergoes values(10004,4,4,'01-11-2001',20,4);
insert into undergoes values(10005,5,5,'04-05-2002',5,5);
select * from undergoes;
insert into undergoes values(10006,6,6,'01-03-2004',6,6);
insert into undergoes values(10007,7,7,'11-03-2003',7,7);
insert into undergoes values(10008,8,8,'02-03-2004',8,8);
insert into undergoes values(10009,9,9,'17-03-2005',9,9);
insert into undergoes values(10010,10,10,'01-03-2002',10,10);
select * from undergoes;
select * from medication;
select * from appointment;
insert into prescribes values(1,10001,1,1,'01-01-2001',1);
insert into prescribes values(2,10002,2,2,'01-03-2002',2);
insert into prescribes values(3,10003,3,3,'02-01-2003',3);
insert into prescribes values(20,10004,4,4,'11-01-2003',4);
insert into prescribes values(5,10005,5,5,'09-01-2004',5);
insert into prescribes values(6,10006,6,6,'11-01-2005',6);
insert into prescribes values(7,10007,7,7,'30-01-2006',7);
insert into prescribes values(8,10008,8,8,'20-01-2005',8);
insert into prescribes values(9,10009,9,9,'01-01-2006',9);
insert into prescribes values(10,10010,10,10,'01-11-2001',10);
select * from prescribes;
