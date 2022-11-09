use hotelschema;

SELECT * FROM hotelschema.room;

LOAD DATA LOCAL INFILE 'C:/Users/yaree/Desktop/reservation3.csv'
INTO TABLE hotelschema.reservations
FIELDS TERMINATED BY ',';

-- Delete Jeremiah from Reservation first because Reservation references Guest. 
DELETE FROM reservations
WHERE customerName = 'Jeremiah Pendergrass';

-- Delete Jeremiah from Guest.
DELETE FROM guest
WHERE customerName = "Jeremiah Pendergrass";
