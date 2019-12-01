
-- INSERT Seats (sid, showid, uid, price, isAvailable)
/*	NOTES:
	12 seats will be added to each showtime with no uid defined
    and for a price of 10 as a default.
*/

/*	NOTES:

	Running this script might take a couple tries.
	
    12 seats will be added to each showtime with no uid defined
    and for a price of 10 as a default.
	
    PROCEDURE InsertSeat
	This will add seats to a single showtime.
    PARAMS:
    counter INT: should always be 0
    numSeats INT: number of seats to add
    showid INT: indicates which showtime to add seats to
    price INT: price of a seat
	
    PROCEDURE PopulateShowtimes
	This will populate the number of showtimes given with seats
    PARAMS: 
    counter INT: should always be 0
    numShowtimes INT: number of showtimes to populate
    numSeats INT: number of seats in each showtime
    price INT: price of each seat
*/

USE CinematicDB;

DELIMITER //
DROP PROCEDURE IF EXISTS PopulateShowtimes;
CREATE PROCEDURE PopulateShowtimes (counter INT, numShowtimes INT, numSeats INT, price INT)
BEGIN
   label1: LOOP     
     CALL InsertSeat(0,numSeats,counter+1,price);
     
     SET counter = counter + 1;
     IF counter < numShowtimes THEN
       ITERATE label1;
     END IF;
     LEAVE label1;
   END LOOP label1;
END; //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS InsertSeat;
CREATE PROCEDURE InsertSeat (counter INT, numSeats INT, showid INT, price INT)
BEGIN
   label1: LOOP     
     INSERT INTO Seats (showid, price, isAvailable) 
     VALUES(showid,price,1);
     SET counter = counter + 1;
     IF counter < numSeats THEN
       ITERATE label1;
     END IF;
     LEAVE label1;
   END LOOP label1;
END; //
DELIMITER ;

SET @numShowtimes = (SELECT COUNT(*) FROM Showtimes);

-- This will create @numShowtimes * 12 number of seats
CALL PopulateShowtimes(0,@numShowtimes,12,10);