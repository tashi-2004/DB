-- Tashfeen Abbasi
-- i22-2041
-- DS-C/D
-- SQL Statements to create tables (DDL)

create table Airlines (A_code int primary key not null, A_name varchar(15) unique, A_address varchar(20));


create table Flight (f_id int primary key not null, origin varchar(15), destination varchar(15), 
arrival_time time, departure time, stops varchar(15));


create table Travel_agencies (t_code int primary key not null, t_address varchar(15), 
contact_person int unique);


create table Milage_Program (p_code int primary key not null, description varchar(50), 
Start_date varchar(20) not null);


create table Passengers (p_number int primary key not null, address varchar(20), 
gender varchar(1) check(gender in ('F','M','f','m')), age int);


create table Menu (v_code int, LF_code int, v_protein varchar(15), v_calorie varchar(15), 
v_description varchar(30),LF_protein varchar(15), LF_calories varchar(15), LF_description varchar(30), 
primary key (v_code, LF_code));


create table Kohser_community (v_code int not null, LF_code int not null, primary key (v_code,LF_code),
foreign key (v_code,LF_code) references menu (v_code,LF_code));


create table Booking_information (f_id int, seat_no int,pilot_name varchar(20), crew_member varchar(20),
flight_date varchar(10), foreign key (f_id) references flight (f_id));


create table days_of_week (f_id int, day varchar(10), foreign key (f_id) references flight(f_id));


create table passenger_name (p_number int, n_id int, foreign key (p_number) references 
Passengers(p_number));


create table sign_up_to (p_code int,p_number int,primary key (p_code, p_number),
foreign key (p_code) references milage_program(p_code),foreign key (p_number) 
references passengers(p_number));


create table approval (v_code int,LF_code int,kohser_meals boolean,primary key (v_code, LF_code),
foreign key (v_code, LF_code) references menu(v_code, LF_code));


create table offered (p_number int,v_code int,LF_code int,f_id int,
primary key (p_number, v_code, LF_code, f_id),foreign key (p_number) 
references passengers(p_number),foreign key (v_code, LF_code) references menu(v_code, LF_code),
foreign key (f_id) references flight(f_id));


create table provides (A_code int,f_id int,primary key (A_code, f_id),
foreign key (A_code) references airlines(A_code),foreign key (f_id) references flight(f_id));


create table booked_by (f_id int,t_code int,primary key (f_id, t_code),
foreign key (f_id) references flight(f_id),foreign key (t_code) references travel_agencies(t_code));


create table offers (A_code int,p_code int,primary key (A_code, p_code),
foreign key (A_code) references airlines(a_code),foreign key (p_code) references milage_program(p_code));



-- SQL Statements to populate tables (insert statements) (DML)


insert into airlines (a_code, a_name, a_address) values
(4200, 'pia', 'islamabad'),
(9213, 'qatar_lines', 'doha'),
(210, 'Qatarsdcds', 'islamabad'),
(312, 'turkey', 'istanbul'),
(1923, 'Air_sial', 'Sailkot'),
(5201, 'Emirates', 'Dubai'),
(6314, 'British ', 'London'),
(7235, 'Luansa', 'Berlin'),
(8346, 'Delta ', 'Atlanta');


insert into flight (f_id, origin, destination, arrival_time, departure, stops) values
(1, 'Karachi', 'Lahore', '10:00:00', '12:00:00', 'None'),
(2, 'Islamabad', 'Qatar', '20:00:00', '9:00:00', 'Karachi'),
(3, 'Istanbul', 'Sialkot', '14:00:00', '23:00:00', 'Dubai'),
(4, 'Tokoyo', 'Sharjah', '4:00:00', '20:00:00','Souel'),
(5, 'Jeddah','Mekkah', '12:00:00', '21:00:00', 'Dubai');


insert into travel_agencies (t_code, t_address, contact_person) values
(4200, 'Islamabad', 03235353),
(549, 'Lahore', 98761),
(4204, 'Peshawar', 131987456),
(1200, 'Islamabad', 5353),
(59, 'Lahore', 9871261);


insert into milage_program (p_code, description, Start_date) values
(1901, 'Excellent', '08-01-2019'),
(2102, 'Best Ever', '02-09-2021'),
(7103, 'fair and normal', '03-12-2024'),
(122, 'Acha hy', '02-11-2011'),
(2103, 'theek hy g', '01-12-2000');


insert into passengers (p_number, address, gender, age) values
(21, 'House:21,Street:2', 'M', 30),
(34, 'House:26,Street:130', 'F', 25),
(123, 'House:75,Street:4', 'M', 40),
(98, 'House:321,Street:21', 'M', 29),
(371, 'House:101,Street:44', 'F', 12);


insert into menu (v_code, LF_code, v_protein, v_calorie, v_description, LF_protein,LF_calories,
 LF_description) values
(1, 1, 'Chicken', '120', 'Grilled chicken', 'Salad', '180', 'Mixed greens'),
(2, 2, 'Saag', '200', 'lassi Saag', 'Fry', '150', 'vegetables'),
(3, 3, 'Beans', '180', 'salad with vegetables', 'Fruit', '100', 'fresh fruits'),
(4, 4, 'Chicken', '110', 'chicken', 'Salad', '180', 'Mixed greens'),
(5, 5, 'Saag', '129', 'Saag', 'Fry', '150', 'vegetables');


insert into kohser_community (v_code, LF_code) values (1, 1),(2, 2),(3, 3) ,(4,4),(5,5);


insert into booking_information (f_id, seat_no, pilot_name, crew_member, flight_date) values
(1, 21, 'Shubu', 'Sarmad', '2024-04-01'),
(2, 98, 'Laiba', 'Zarmeena', '2024-04-02'),
(3,43, 'Tashi', 'Danish', '2024-04-03'),
(4,211, 'Aaimlik', 'Hifza', '2024-04-01'),
(5, 76, 'Anqasha', 'Ariba', '2024-04-02');


insert into days_of_week (f_id, day) values
(1, 'Saturday'),
(2, 'Thursday'),
(3, 'Wednesday'),
(4, 'Sunday'),
(5, 'Tuesday');


insert into passenger_name (p_number, n_id) values
(21, 81),
(34, 39),
(123, 10),
(123, 209),
(371, 110);


insert into phone_no (t_code, num) values
(549, 81231),
(4200, 3412239),
(4204, 42141210),
(59, 81231),
(549, 3412239);


insert into sign_up_to (p_code, p_number) values
(1901, 21),
(2102, 34),
(7103, 123),
(7103, 21),
(2103, 34);


insert into approval (v_code, LF_code, kohser_meals) VALUES
(1, 1, false),
(2, 2, true),
(3, 3, true),
(4, 4, false),
(5, 5, true);


insert into provides (A_code, f_id) values
(4200, 1),
(9213, 2),
(312, 3),
(5201, 1),
(8346, 4),
(6314, 5);


insert into booked_by (f_id, t_code) values
(1, 4200),
(2, 549),
(3, 4204),
(2, 4204),
(4, 1200),
(5, 59);


insert into offers (A_code, p_code) values
(4200, 1901),
(9213, 2102),
(312, 7103),
(5201, 122),
(8346, 2102),
(6314, 7103);


insert into offered (p_number, v_code, LF_code, f_id) values
(21, 1, 1, 1),
(34, 2, 2, 2),
(123, 3, 3, 3),
(371, 4, 4, 4),
(21, 5, 5, 5);



-- SQL statements for 5 queries 

-- Query 1: Retrieve booking information for seat numbers greater than 30, along with flight details and pilot name.

select seat_no,origin,destination,pilot_name from booking_information 
left join flight on booking_information.f_id=flight.f_id 
where booking_information.seat_no > 30 order by seat_no asc;

-- Query 2: Retrieve menu information excluding items approved by kosher community, along with approval details.

select menu.v_code,menu.LF_code,menu.v_protein,menu.v_calorie,menu.LF_protein,menu.LF_calories from menu
inner join kohser_community as k on menu.v_code != k.v_code and menu.LF_code != k.LF_code
cross join approval as a on menu.v_code = a.v_code and menu.LF_code = a.LF_code;


-- Query 3: Retrieve the airline with the least number of flights originating from Islamabad.

select A_name, count(*) as total_flights from airlines
where A_code in (select A_code from airlines where A_address = 'islamabad')
group by A_name
order by total_flights asc limit 1;

-- Query 4: Retrieve passenger numbers along with their flight origin and destination.

select  passengers.p_number,
(select origin from flight where f_id = booking_information.f_id) as origin,
(select destination from flight where f_id = booking_information.f_id) as destination
from passengers inner join booking_information on p_number = passengers.p_number;

-- Query 5: Retrieve all members of airlines which are even and had length more than 10

select * from airlines
where A_code % 2 = 0 and LENGTH(A_name) > 10;