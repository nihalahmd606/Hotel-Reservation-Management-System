create database hotel;
use hotel;
create table hotel( hotel_id int primary key,
                    name varchar(50),
                    location varchar(50),
                    rating int );
insert into hotel values(1, 'sunshine residency', 'calicut', 4.5);
                    
create table room( room_id int primary key,
                   hotel_id int,
                   room_type varchar(50),
                   price decimal(10,2),
                   status varchar(50),
                   foreign key (hotel_id) references hotel(hotel_id));
insert into room  values('101', 1, 'deluxe suite', 150.00, 'available');
                   
create table customer( customer_id int primary key,
					   name varchar(50),
                       phone varchar(10),
                       email varchar(50));
insert into customer values('1', 'john doe','465372','john@email.com');				

create table reservation( reservation_id varchar(20) primary key,
						  customer_id int,
                          room_id int,
                          check_in date,
                          check_out date,
                          status varchar(50),
                          foreign key (customer_id) references customer(customer_id),
                          foreign key (room_id) references room(room_id));
insert into reservation values('res1', '1', '101', '2025-09-25', '2025-09-28', 'confirmed');

create table payment( payment_id varchar(20) primary key,
                      reservation_id varchar(20),
                      amount decimal(10,2),
                      date date,
                      method varchar(50),
                      foreign key (reservation_id) references reservation(reservation_id));
insert into payment values('p1', 'res1', 450.00, '2025-09-25', 'credit card');
                      
select room_id, room_type, price 
from room
where hotel_id = 1 
and status = 'available';