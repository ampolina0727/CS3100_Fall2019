Create schema finalDB;
use finalDB;

#student_table
create table student_table (
	studentID int(6),
    FirstName varchar(30),
    LastName varchar(30),
    Grade int,
    primary key(studentID)
);
drop table student_table;

#Parent_table
create table parent_table (
	ParentID int(6),
    FirstName varchar(30),
    LastName varchar(30),
    Address varchar (50),
    Phone_num varchar(12),
    Email varchar(40),
    studentID int(6),
    primary key(ParentID),
    Foreign Key(studentID) references student_table(studentID)
);
drop table parent_table;

#meal_table
create table meal_table (
	MealID int(5),
    description varchar(500),
    primary key(MealID)
);

#Transaction_table
create table transaction_table (
	TransID int(7),
	MealID int(5),
    Date_bought date, 
	Time_bought time,
    Transaction_amount float,
    studentID int(6),
    primary key(TransID),
	Foreign Key(studentID) references student_table(studentID),
	Foreign Key(MealID) references meal_table(MealID)
);
drop table transaction_table;

#student_type
create table student_type (
	studentID int(6),
    student_type int,
    meal_price float,
    reduction_price float,
    price_owed float,
    Foreign Key(studentID) references student_table(studentID)
);
drop table student_type;

#payment_type
create table payment_type (
	paymentID int(6),
    studentID int(6),
    payment_amount float,
    payment_date date,
    payment_method varchar(10),
    processor varchar(30),
    notes varchar(500),
    primary key(paymentID),
    Foreign Key(studentID) references student_table(studentID)
    
); 
drop table payment_type;


#insert student_table
insert into student_table
	(studentID, FirstName, LastName, Grade)
values
	(100001, 'Bill', 'Smith', 5),
    (100002, 'Shannon', 'Parcels', 2),
    (100003, 'Matt', 'Campbell', 3),
    (100004, 'Jack', 'Oxley', 5),
    (100005, 'Austin', 'Polina', 1),
    (100006, 'Jack', 'Burns', 3),
    (100007, 'Hunter', 'Sands', 6),
    (100008, 'Joe', 'Bucheit', 3),
    (100009, 'Tommy', 'Kraus', 2),
    (100010, 'CJ', 'July', 4),
    (100011, 'Nate', 'Mark',4), 
    (100012, 'Brandt', 'Callahan', 1);
    
#insert student_type table
insert into student_type
	(studentID, student_type, meal_price, reduction_price, price_owed)
values 
	(100001, 2, 3, -2.60, 0.40),
    (100002, 2, 3, -2.60, 0.40),
    (100003, 3, 3, -3.00, 0.00),
    (100004, 1, 3, 0.00, 3.00),
    (100005, 1, 3, 0.00, 3.00),
    (100006, 2, 3, -2.60, 0.40),
    (100007, 3, 3, -3.00, 0.00),
    (100008, 3, 3, -3.00, 0.00),
    (100009, 1, 3, 0.00,  3.00),
    (100010, 2, 3, -2.60, 0.40),
    (100011, 3, 3, -3.00, 0.00),
    (100012, 1, 3, 0.00, 3.00);
truncate student_type;

#insert parent_table
insert into parent_table
	(parentID, FirstName, LastName, Address, Phone_num, Email, studentID)
values
	(200001, 'Kim', 'Smith', '123 SE lane', '888-888-888', 'ksmith@gmail.com',100001),
    (200002, 'Bryce', 'Parcels', '444 Cherry St.', '998-885-5585', 'bparcels@att.com',100002),
    (200003, 'Chad', 'Campbell', '433 East Terrace', '757-559-5585', 'N/A', 100003),
    (200004, 'Steve','Oxley', '123 3rd street', '888-410-1039', 'soxley@google.net', 100004),
    (200005, 'Tess', 'Polina', '444 12th terrace', '913-445-1200', 'tpolina@yahoo.com', 100005),
    (200006, 'Tyson', 'Burns', '345 3rd terrace', '132-575-4769', 'tburns@rockhurst.edu', 100006),
    (200007, 'Theo', 'Sands', '135 4th terr', '143-578-6970' , 'N/A', 100007),
    (200008, 'Gary', 'Bucheit', '250 SE wornall', '321-486-2967', 'N/A', 100008),
    (200009, 'Cindy', 'Kraus', '441 Rockhill road', '456-789-4876', 'Ckraus@gmail.com',100009),
    (200010, 'Sharol', 'July', '1220 Ward street', '286-575-8607', 'sharoljuly@umkc.com',100010),
    (200011, 'Michael', 'Mark', '2405 Rockhurst drive', '333-586-1067', 'mnmark@park.edu',100011),
    (200012, 'Tony', 'Callahan', '456 indiana drive', '459-697-7896', 'bcallahan@tcu.horns.edu', 100012);
    
#insert meal_table
insert into meal_table 
	(MealID, description)
values
	(10001, "Chicken Nuggets, Sweet Potatoes, Mixed Fruit, Milk"),
    (10002, "Bean Nachos, Whole Corn, Apples, Milk"),
    (10003, "PBJ, Chheesestick, Mango, Cucumber, Milk"),
    (10004, "Chili Beef, Beans, Cornbread, Pears, Milk"),
    (10005, "Sandwich, Carrots, Grapes, Milk");
    
#insert transaction_table 
insert into transaction_table 
	(TransID, MealID, Date_bought, Time_bought, Transaction_amount, studentID)
values
	(1000001, 10001, '2005-05-10', '10:30', 3.00, 100005),
    (1000002, 10003, '2005-05-10', '10:40', 3.00, 100006),
    (1000003, 10005, '2005-05-10', '11:30', 3.00, 100010),
    (1000004, 10003, '2005-05-11', '12:00', 3.00, 100003),
    (1000005, 10004, '2005-05-11', '11:30', 3.00, 100007),
    (1000006, 10001, '2005-05-11', '11:45', 3.00, 100001),
    (1000007, 10003, '2005-05-11', '11:15', 3.00, 100012),
    (1000008, 10004, '2005-05-12', '10:45', 3.00, 100002),
    (1000009, 10005, '2005-05-12', '11:15', 3.00, 100011);
truncate transaction_table;

#insert payment_table
insert into payment_type
	(paymentID, studentID, payment_amount, payment_date, payment_method, processor, notes)
values
	(100001,100005,3.00,'2005-05-10','credit','Sharol','N/A'),
    (100002,100006,0.40,'2005-05-10','cash','Tom','Student is reduced'),
    (100003,100010,0.00,'2005-05-11','none','Tom','Student received full meal'),
    (100004,100003,0.00,'2005-05-11','none','Tom','Student received full meal'),
    (100005,100007,0.00,'2005-05-11','cash','Tom','Student received full meal'),
    (100006,100001,0.40,'2005-05-11','cash','Brad','Student is reduced'),
    (100007,100012,2.00,'2005-05-11','cash','Brad','Student was short one dollar'),
    (100008,100002,0.40,'2005-05-11','cash','Brad','Student is reduced'),
    (100009,100011,0.00,'2005-05-11','none','Brad','Student recieved full meal');
truncate payment_type;



#Report 1
select 
	FirstName,
    LastName,
    Grade
from student_table
order by Grade desc, LastName, FirstName;

#Report 2
select 
	s.FirstName,
    s.LastName,
    st.student_type as 'meal status'
from student_table s
inner join student_type st
on s.studentID = st.studentID
order by student_type desc, LastName, FirstName; 

#Report 3
select
	Date_bought,
	count(TransID) as 'Number of Orders',
    sum(Transaction_amount) as 'Total amount'
from transaction_table
group by Date_bought;

#Report 4
select
	r.TransID,
	t.studentID,
    t.student_type as 'Meal Status',
    t.price_owed,
    format((r.Transaction_amount - t.price_owed),2) as 'Reimbursement amount'
from student_type t
right join transaction_table r
on r.studentID = t.studentID
where t.student_type = 3
group by r.TransID;


#Report 5
select
	r.TransID,
	t.studentID,
    t.student_type as 'Meal Status',
    format(t.price_owed,2) as 'price_owed',
    format((r.Transaction_amount - t.price_owed),2) as 'Reimbursement amount'
from student_type t
right join transaction_table r
on r.studentID = t.studentID
where t.student_type = 2
group by r.TransID;

#Report 6
select *
from payment_type
order by payment_date;

#Report 7
select
	concat(s.FirstName,' ',s.LastName) as 'name',
    format(t.price_owed,2) as 'amount owed',
    format(p.payment_amount,2) as 'amount paid',
    format(( tr.transaction_amount - p.payment_amount) + t.reduction_price,2) as 'Charges',
    p.paymentID,
    t.student_type as 'Meal Status',
	p.studentID
from student_table s
left join student_type t
on s.studentID = t.studentID
right join payment_type p 
on s.studentID = p.studentID
right join transaction_table tr
on tr.studentID = p.studentID
order by t.student_type;
    
select *
from parent_table;

    
    
    
    
    