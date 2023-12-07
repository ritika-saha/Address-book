-- uc_1 Ability to create a Address Book Service DB
create database address_book;
use address_book;
show databases;
-- OUTPUT
--address_book
--h2h
--information_schema
--mysql
--payroll_service
--performance_schema
--sys

-- uc_2 Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and 
-- email as its attributes
CREATE TABLE addressbook_table (
	firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255) UNIQUE   
);
desc addressbook_table;
-- OUTPUT
--firstName	varchar(255)	NO			
--lastName	varchar(255)	NO			
--address	varchar(255)	YES			
--city	varchar(255)	YES			
--state	varchar(255)	YES			
--zip	varchar(255)	YES			
--phone	varchar(255)	YES			
--email	varchar(255)	YES	UNI		

-- uc_3 Ability to insert new Contacts to Address Book
insert into addressbook_table (firstName,lastName,address,city,state,zip,phone,email)
values
('Ritika','Saha','ave 24','Coochbehar','WB','738283','91 3939393939','rr12@gmail.com'),
('John', 'Doe', '123 Main St', 'Anytown', 'CA', '123454', '91 5858585858', 'johndoe@email.com'),
('Jane', 'Smith', '456 Oak Ave', 'Somewhere', 'NY', '567849', '91 9292929292', 'janesmith@email.com'),
('Bob', 'Johnson', '789 Pine Rd', 'Nowhere', 'TX', '987645', '91 2020202020', 'bobjohnson@email.com'),
('Alice', 'Williams', '101 Maple Ln', 'Everywhere', 'FL', '543321', '91 2828282828', 'alicewilliams@email.com');
select * from addressbook_table;
-- OUTPUT
--Ritika	Saha	ave 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com
--John	Doe	123 Main St	Anytown	CA	123454	91 5858585858	johndoe@email.com
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com
--Bob	Johnson	789 Pine Rd	Nowhere	TX	987645	91 2020202020	bobjohnson@email.com
--Alice	Williams	101 Maple Ln	Everywhere	FL	543321	91 2828282828	alicewilliams@email.com

-- uc_4 Ability to edit existing contact person using their name
update addressbook_table 
set address='jaxvile 24' where firstName='Ritika' and lastName='Saha';
update addressbook_table set email='aliceW12@gmail.com' , zip='717171' where firstName='Alice' and lastName='Williams';
select * from addressbook_table;
-- OUTPUT
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com
--John	Doe	123 Main St	Anytown	CA	123454	91 5858585858	johndoe@email.com
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com
--Bob	Johnson	789 Pine Rd	Nowhere	TX	987645	91 2020202020	bobjohnson@email.com
--Alice	Williams	101 Maple Ln	Everywhere	FL	717171	91 2828282828	aliceW12@gmail.com

-- uc_5 Ability to delete a person using person's name
delete from addressbook_table where firstName='John' and lastName='Doe';
select * from addressbook_table;
-- OUTPUT
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com
--Bob	Johnson	789 Pine Rd	Nowhere	TX	987645	91 2020202020	bobjohnson@email.com
--Alice	Williams	101 Maple Ln	Everywhere	FL	717171	91 2828282828	aliceW12@gmail.com

-- uc_6 Ability to Retrieve Person belonging to a City or State from the Address Book
select * from addressbook_table where state='NY' or city='Coochbehar';
-- OUTPUT
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com

-- uc_7 Ability to understand the size of address book by City and State
SELECT
    city,
    state,
    COUNT(*) AS AddressBookSize
FROM
    addressbook_table
GROUP BY
    city,
    state;
-- OUTPUT
-- Coochbehar	WB	1
-- Somewhere	NY	1
-- Nowhere	TX	1
-- Everywhere	FL	1

-- uc_8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city
insert into addressbook_table (firstName,lastName,address,city,state,zip,phone,email)
values
('Aliya','Roy','rajsa 23','Coochbehar','WB','636363','91 1919191919','aliya12@gmail.com'),
('Meha','Ganguly','tulss 88','Coochbehar','WB','191919','91 6363636363','meha88@gmail.com');
select * from addressbook_table;
select * from addressbook_table where city='Coochbehar' order by firstName, lastName;

-- OUTPUT
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com
--Bob	Johnson	789 Pine Rd	Nowhere	TX	987645	91 2020202020	bobjohnson@email.com
--Alice	Williams	101 Maple Ln	Everywhere	FL	717171	91 2828282828	aliceW12@gmail.com
--Aliya	Roy	rajsa 23	Coochbehar	WB	636363	91 1919191919	aliya12@gmail.com
--Meha	Ganguly	tulss 88	Coochbehar	WB	191919	91 6363636363	meha88@gmail.com

-- ------------------- sorted alphabetically by name for city Coochbehar--------------------
--Aliya	Roy	rajsa 23	Coochbehar	WB	636363	91 1919191919	aliya12@gmail.com
--Meha	Ganguly	tulss 88	Coochbehar	WB	191919	91 6363636363	meha88@gmail.com
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com

-- uc_9 Ability to identify each Address Book with name and Type
alter table addressbook_table 
add column fullName varchar(250), 
add column entryType varchar(30);
update addressbook_table set fullName=concat(firstName,' ',lastName);
update addressbook_table set entryType='Family' where city='Coochbehar';
update addressbook_table set entryType='Friend' where city='Somewhere';
update addressbook_table set entryType='Profession' where city='Everywhere';
update addressbook_table set entryType='Neighbor' where city='Nowhere';
select * from addressbook_table; 
-- OUTPUT
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com	Ritika Saha	Family
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com	Jane Smith	Friend
--Bob	Johnson	789 Pine Rd	Nowhere	TX	987645	91 2020202020	bobjohnson@email.com	Bob Johnson	Neighbor
--Alice	Williams	101 Maple Ln	Everywhere	FL	717171	91 2828282828	aliceW12@gmail.com	Alice Williams	Profession
--Aliya	Roy	rajsa 23	Coochbehar	WB	636363	91 1919191919	aliya12@gmail.com	Aliya Roy	Family
--Meha	Ganguly	tulss 88	Coochbehar	WB	191919	91 6363636363	meha88@gmail.com	Meha Ganguly	Family

-- uc_10 Ability to get number of contact persons i.e. count by type
select entryType , count(*) as PersonPerEntry from addressbook_table group by entryType;
-- OUTPUT
--Family	3
--Friend	1
--Neighbor	1
--Profession	1

-- uc-11 Ability to add person to both Friend and Family
INSERT INTO addressbook_table (firstName, lastName, address, city, state, zip, phone, email, fullName, entryType)
VALUES ('John', 'Doe', '123 Main St', 'Anytown', 'CA', '123456', '91 5555555555', 'john.doe@email.com', 'John Doe', 'Family');
INSERT INTO addressbook_table (firstName, lastName, address, city, state, zip, phone, email, fullName, entryType)
VALUES ('John', 'Doe', '123 Main St', 'Anytown', 'CA', '123457', '91 5555555556', 'john.doe2@email.com', 'John Doe', 'Friend');
select * from addressbook_table;
-- OUTPUT
--Ritika	Saha	jaxvile 24	Coochbehar	WB	738283	91 3939393939	rr12@gmail.com	Ritika Saha	Family
--Jane	Smith	456 Oak Ave	Somewhere	NY	567849	91 9292929292	janesmith@email.com	Jane Smith	Friend
--Bob	Johnson	789 Pine Rd	Nowhere	TX	987645	91 2020202020	bobjohnson@email.com	Bob Johnson	Neighbor
--Alice	Williams	101 Maple Ln	Everywhere	FL	717171	91 2828282828	aliceW12@gmail.com	Alice Williams	Profession
--Aliya	Roy	rajsa 23	Coochbehar	WB	636363	91 1919191919	aliya12@gmail.com	Aliya Roy	Family
--Meha	Ganguly	tulss 88	Coochbehar	WB	191919	91 6363636363	meha88@gmail.com	Meha Ganguly	Family
--John	Doe	123 Main St	Anytown	CA	123456	91 5555555555	john.doe@email.com	John Doe	Family
--John	Doe	123 Main St	Anytown	CA	123457	91 5555555556	john.doe2@email.com	John Doe	Friend

