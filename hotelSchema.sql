-- creating db
drop database if exists HotelSchema;

create database HotelSchema;

use HotelSchema;

-- tables
create table Guest(
    customerName VARCHAR(50) primary key,
    address VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    zip INT,
    phone VARCHAR(50)
);
create table Amenities(
    amenitiesName VARCHAR(50) primary key,
    price INT
);

create table Room(
	roomId INT primary key,
    roomType VARCHAR(30),
    amenitiesName VARCHAR(50) NOT NULL,
	adaAccess CHAR(3),
    stdOccup INT,
    maxOccup INT,
    basePrice DOUBLE,
    extraPerson INT
);


create table RoomAmenities(
	roomId INT NOT NULL,
    amenitiesName VARCHAR(50) NOT NULL,
    primary key pk_RoomAmenities(roomId,amenitiesName),
    foreign key fk_RoomAmenities_Room(roomId) references Room(roomId),
    foreign key fk_RoomAmenities_Amenities(amenitiesName) references Amenities(amenitiesName)
); 

create table Reservations(
	reservationId INT auto_increment primary key,
    roomId INT NOT NULL,
    customerName VARCHAR(50),
    numAdults INT,
    numChilds INT,
    startDate DATE,
    endDate DATE,
    totalCost DOUBLE,
    CONSTRAINT fk_reserv_guest FOREIGN KEY (customerName) REFERENCES guest(customerName),
	CONSTRAINT fk_reserv_room FOREIGN KEY (roomId) REFERENCES room(roomId)
);
