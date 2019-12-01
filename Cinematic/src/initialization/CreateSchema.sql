
-- CREATE SCHEMA CinematicDB
DROP schema IF EXISTS CinematicDB;
CREATE SCHEMA CinematicDB;
USE CinematicDB;

-- CREATE Users (uid, email, pass, fname, lname, address, city, state, zip, isAdmin)
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
	uid 		INTEGER(8) 		AUTO_INCREMENT, 
	email 		VARCHAR(255) 	NOT NULL UNIQUE, 
	pass 		VARCHAR(255) 	NOT NULL,
    fname 		VARCHAR(255) 	NOT NULL,
    lname 		VARCHAR(255) 	NOT NULL,
    address 	VARCHAR(255) 	DEFAULT 'N/A',
    city	 	VARCHAR(255) 	DEFAULT 'N/A',
    state		VARCHAR(255) 	DEFAULT 'N/A',
    zip			INTEGER(5)		DEFAULT 0,
    isAdmin		BOOLEAN 		NOT NULL DEFAULT 0,
    PRIMARY KEY (uid)
);

-- CREATE CreditCards (cid, credNum, secCode, address, month, year, uid)
DROP TABLE IF EXISTS CreditCards;
CREATE TABLE CreditCards (
	cid 		INTEGER(8) 		AUTO_INCREMENT,
    credNum		BIGINT(16) 		NOT NULL UNIQUE,
    secCode 	INTEGER(3)		NOT NULL,
    address 	VARCHAR(255) 	NOT NULL,
    month       INTEGER(2)		NOT NULL,
    year        INTEGER(4)      NOT NULL,
	uid 		INTEGER(8)	    NOT NULL,		
	FOREIGN KEY (uid)           REFERENCES Users(uid),
	PRIMARY KEY (cid)
);

-- CREATE Movies (mid, title, releaseDate, synopsis, poster, trailer)
DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies (
	mid 		INTEGER(8) 		AUTO_INCREMENT,
    title 		VARCHAR(255) 	NOT NULL UNIQUE,
    releaseDate DATE 			NOT NULL,
    synopsis 	VARCHAR(700) 	UNIQUE,
    poster 		VARCHAR(255) 	NOT NULL UNIQUE,
    trailer 	VARCHAR(255) 	NOT NULL UNIQUE,
    PRIMARY KEY (mid)
);

-- CREATE Reviews (mid, uid, title, description, rating)
DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews (
	mid 		INTEGER(8),
    uid 		INTEGER(8)		NOT NULL,
    title 		VARCHAR(255),
    description VARCHAR(700),
    rating		INTEGER(1) 		NOT NULL,
    FOREIGN KEY (mid)           REFERENCES Movies(mid),
    FOREIGN KEY (uid)           REFERENCES Users(uid),
    PRIMARY KEY (mid,uid)
);

-- CREATE Showtimes (showid, mid, time)
DROP TABLE IF EXISTS Showtimes;
CREATE TABLE Showtimes (
	showid		INTEGER(8)		AUTO_INCREMENT,
    mid 		INTEGER(8)		NOT NULL,
    time 		DATETIME   		NOT NULL,
    FOREIGN KEY (mid)       	REFERENCES Movies(mid),
    PRIMARY KEY (showid)
);

-- CREATE Seats (sid, showid, uid, price, isAvailable)
DROP TABLE IF EXISTS Seats;
CREATE TABLE Seats (
	sid 		INTEGER(8) 		AUTO_INCREMENT,
    showid  	INTEGER(8) 		NOT NULL,
    uid 		INTEGER(8),
    price		DECIMAL 		NOT NULL,
    isAvailable BOOLEAN 		NOT NULL,
    FOREIGN KEY (showid)    	REFERENCES Showtimes(showid),
    FOREIGN KEY (uid)       	REFERENCES Users(uid),
    PRIMARY KEY (sid)
);
