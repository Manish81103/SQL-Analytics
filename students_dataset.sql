create database studentslist;
use studentslist;
create  table marksheet(Roll_no int primary key,students_name char(25) not null,
email varchar(50),marks int not null);
insert into marksheet(Roll_no,Students_name,email,marks)
values(2201,"Manish singh","Manishsingh892003@gmail.com",95),
(2202,"Avinash lehra","Avinashlehra67@gmail.com",70),
(2203,"Princy","Princych832003@gmail.com",80),
(2204,"Surya kumar","Suryakumar1256@gmail.com",82),
(2205,"Muskan rao","Muskanrao123@gmail.com",65),
(2206,"Tanish rajput","Tanishyt567@gmail.com",59),
(2207,"Tara sharma","Tarasharma768@gmail.com",71),
(2208,"Ritus singh","ritusingh2312@gmail.com",79),
(2209,"Varun","Varundatt189@gmail.com",60),
(22010,"aslam khan","aslamrazi156@gmail.com",51),
(22011,"kannu singh","kannuofficial@gmail.com",89);
select * from marksheet
order by marks desc;

# questions
#1 add two columns for class and dob in tabale.
#2 display all students of section A .
#3 display top 5 students. 
#4 drop dob coloumn.
#5 find average marks of section B.
#6.create a column for Grades and give grades to students
# marks>85 A
# marks<85 and marks>75 B
# marks<75 and marks>65 C
# marks<65 and marks<55 D
# rest F
#7. count number of students of section A .

#solutions

#1 add two columns for class and dob in tabale.

alter table marksheet
add class_sec varchar(10),
add Dob date;

update marksheet
set class_sec="12th_A"
where marks>=70;
update marksheet
set class_sec="12th_B"
where marks<70;

set sql_safe_updates=0;

alter table marksheet
add Dob date;

#2 display all students of section A .

select * from marksheet
where class_sec in("12th_A");

#3 display top 5 students. 

select students_name,marks from marksheet
order by marks desc
limit 5;

#4 drop dob coloumn.

alter table marksheet
drop Dob;

#5 find average marks of section B.

select avg(marks) as count_sec_B from marksheet
where(class_sec)="12th_B";

#6.create a column for Grades and give grades to students

select students_name,marks,
case
 when marks>85 then "A"
 when marks<85 and marks>75 then "B"
 when marks<75 and marks>65 then "c"
 when marks<65 and marks>55 then "D"
else "F"
end as Grade from marksheet;

#7. count number of students of section A .

select count(students_name) as count_of_students from marksheet
where class_sec="12th_a";



















