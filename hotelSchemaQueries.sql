use hotelschema;

-- 1
-- Write a query that returns a list of reservations that end in July 2023, 
-- including the name of the guest, the room number(s), and the reservation dates.
SELECT
	customerName GUESTNAME,
    roomId ROOMNUMBER,
    startDate BEGINDATE,
    endDate ENDDATE
FROM reservations
WHERE endDate < '2023-06-30';
-- SUCCESS : 13 row(s) returned

-- 2
-- Write a query that returns a list of all reservations for rooms with a jacuzzi,
-- displaying the guest's name, the room number, and the dates of the reservation.

SELECT
	reservations.customerName GUESTNAME,
    Reservations.roomId ROOMNUMBER,
    Reservations.startDate BEGINDATE,
    Reservations.endDate ENDDATE
FROM reservations
INNER JOIN roomamenities ON reservations.roomId = roomamenities.roomId  AND roomamenities.amenitiesName LIKE '%Jacuzzi%'
INNER JOIN room ON roomamenities.roomId = room.roomId;
-- SUCCESS : 11 row(s) returned

-- 3
-- Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT 
	Reservations.customerName GUESTNAME,
    Reservations.roomId ROOMID,
    Reservations.startDate BEGINDATE,
    Reservations.endDate ENDDATE,
    (Reservations.numAdults + Reservations.numChilds) TOTALPEOPLE
FROM reservations
INNER JOIN room ON room.roomId = reservations.roomId
WHERE reservations.customerName = 'Yaren Menemenci';
-- SUCCESS : 2 row(s) returned

-- 4
-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation.
-- The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT
	Reservations.roomId ROOMID,
    Reservations.reservationId RESERVATIONID,
    Reservations.totalCost ROOMCOST
FROM room
LEFT OUTER JOIN reservations ON room.roomId = reservations.roomId;
-- SUCCESS: 306 AND 402 ARE NULL

-- 5
-- Write a query that returns all rooms with a capacity of three or more 
-- and that are reserved on any date in April 2023.
SELECT *
FROM room
INNER JOIN reservations ON room.roomId = reservations.roomId
WHERE room.maxOccup >=3 AND reservations.startDate > '2023-04-01' AND reservations.endDate < '2023-04-30';
-- SUCCESS : 1 row(s) returned. There's 1 reservation for roomId 301. The customer name is Walter Holaway

-- 6
-- Write a query that returns a list of all guest names and the number of reservations per guest,
-- sorted starting with the guest with the most reservations 
-- and then by the guest's last name.
SELECT
	guest.customerName GUESTNAME,
    SUBSTRING_INDEX(guest.customerName, ' ',-1) LASTNAME,
    COUNT(Reservations.customerName) NUMOFRESERVATION
FROM guest
INNER JOIN reservations ON guest.customerName = reservations.customerName
GROUP BY reservations.customerName
ORDER BY NUMOFRESERVATION DESC, LASTNAME;
-- SUCCESS : 11 row(s) returned

-- 7
-- Write a query that displays the name, address, 
-- and phone number of a guest based on their phone number. 
-- (Choose a phone number from the existing data.)
SELECT
	customerName GUESTNAME,
    address ADDRESS,
    phone PHONENUMBER
FROM guest
WHERE phone = '(291) 553-0508';
-- SUCCESS : 1 row(s) returned. I put Mack Simmer's number and got it successfully from this query.
    



















