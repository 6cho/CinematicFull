
-- CREATE Users (uid, email, pass, fname, lname, address, city, state, zip, isAdmin)
/*	NOTES:
	Users with uid 1-2 will be assigned as an Admin by default
    Users with uid 2-9 will not be assigned as an Admin by default
    Users with uid 1-2 will be assigned an address,city,state,zip by default
    Users with uid 2-9 will not be assigned an address,city,state,zip by default
*/

-- INSERT Movies (mid, title, releaseDate, synopsis, poster, trailer)
/*	NOTES:
	All 12 movies have complete imformation
*/

-- INSERT CreditCards (cid, credNum, secCode, address, month, year, uid)
/*	NOTES:
	Users with uid 1   will have 2 assigned CreditCards by default
    Users with uid 2-5 will have 1 assigned CreditCards by default
    Users with uid 6-9 will have 0 assigned CreditCards by default
*/

-- INSERT Reviews (mid, uid, title, description, rating)
/*	NOTES:
	Movies with mid 1 will have:
	no ratings
    to show that no reviews can be assigned to movie
	
    Movies with mid 2 will have ratings:
    4/5 from user 1
    to show that one review can be assigned to movie
    
    Movies with mid 3 will have ratings:
    5/5 from user 1, 5/5 from user 2, 5/5 from user 3
    to show that repeating ratings can be assigned to movie
    
    Movies with mid 4 will have ratings:
    1/5 from user 1, 2/5 from user 2, 3/5 from user 3
    to show that multiple reviews can be assigned to movie
    to show that users can assign many reviews to many movies
    
    Movies with mid 5-12 will have:
	no ratings
    for testing purposes
*/

-- INSERT Showtimes (showid, mid, time)
/*	NOTES:
	Movies with mid 1    will have 1 assigned Showtimes over 1 days by default
    Movies with mid 2    will have 3 assigned Showtimes over 1 days by default
    Movies with mid 3    will have 1 assigned Showtimes over 3 days by default
    Movies with mid 4-12 will have 3 assigned Showtimes over 2 days by default
*/

USE CinematicDB;

INSERT INTO Users (email, pass, fname, lname, address, city, state, zip, isAdmin)
VALUES('eric@gmail.com', 'passAdmin', 'Eric', 'Cho', '111 RealStreet St', 'Athens', 'GA', 30001, 1);

INSERT INTO Users (email, pass, fname, lname, address, city, state, zip, isAdmin)
VALUES('overton@gmail.com', 'passAdmin', 'Overton', 'Wright', '222 CoolStreet St', 'Athens', 'GA', 30002, 1);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample3@gmail.com', 'pass3', 'first', 'last', 0);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample4@gmail.com', 'pass4', 'first', 'last', 0);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample5@gmail.com', 'pass5', 'first', 'last', 0);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample6@gmail.com', 'pass6', 'first', 'last', 0);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample7@gmail.com', 'pass7', 'first', 'last', 0);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample8@gmail.com', 'pass8', 'first', 'last', 0);

INSERT INTO Users (email, pass, fname, lname, isAdmin)
VALUES('sample9@gmail.com', 'pass9', 'first', 'last', 0);

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Frozen II', 
	STR_TO_DATE('11/22/2019', '%m/%d/%Y'), 
	'Elsa the Snow Queen and her sister Anna embark on an adventure 
    far away from the kingdom of Arendelle. They are joined by 
    friends, Kristoff, Olaf, and Sven.', 
    'resources/1.jpg', 
	'https://www.youtube.com/embed/bwzLiQZDw2I');

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Ford V Ferrari', 
	STR_TO_DATE('11/15/2019', '%m/%d/%Y'), 
	'American automotive designer Carroll Shelby and fearless British 
    race car driver Ken Miles battle corporate interference, the laws 
    of physics and their own personal demons to build a revolutionary 
    vehicle for the Ford Motor Co. Together, they plan to compete 
    against the race cars of Enzo Ferrari at the 24 Hours of Le Mans 
    in France in 1966.', 
    'resources/2.jpg', 
	'https://www.youtube.com/embed/I3h9Z89U9ZA');  

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'A Beautiful Day in the Neighborhood', 
	STR_TO_DATE('11/22/2019', '%m/%d/%Y'), 
	'A journalist\'s life is enriched by friendship when he takes on 
    an assignment profiling Fred Rogers. Based on the real-life 
    friendship between journalist Tom Junod and television star 
    Fred Rogers.', 
    'resources/3.jpg', 
	'https://www.youtube.com/embed/-VLEPhfEN2M');  

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'21 Bridges', 
	STR_TO_DATE('11/22/2019', '%m/%d/%Y'), 
	'After uncovering a massive conspiracy, an embattled NYPD detective 
    joins a citywide manhunt for two young cop killers. As the night 
    unfolds, he soon becomes unsure of who to pursue -- and who\'s in 
    pursuit of him. When the search intensifies, authorities decide to 
    take extreme measures by closing all of Manhattan\'s 21 bridges to 
    prevent the suspects from escaping.', 
    'resources/4.jpg', 
	'https://www.youtube.com/embed/BVZDhunTrYA');  
    
INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'The Good Liar', 
	STR_TO_DATE('11/15/2019', '%m/%d/%Y'), 
	'Career con artist Roy Courtnay can hardly believe his luck when 
    he meets well-to-do widow Betty McLeish online. As Betty opens 
    her life and home to him, Roy is surprised to find himself caring 
    about her, turning what should be a cut-and-dry swindle into the 
    most treacherous tightrope walk of his life.', 
    'resources/5.jpg', 
	'https://www.youtube.com/embed/ljKzFGpPHhw');  
    
INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Star Wars: The Rise of Skywalker', 
	STR_TO_DATE('12/20/2019', '%m/%d/%Y'), 
	'The surviving Resistance faces the First Order once more as Rey, 
    Finn and Poe Dameron\'s journey continues. With the power and 
    knowledge of generations behind them, the final battle commences.', 
    'resources/6.jpg', 
	'https://www.youtube.com/embed/8Qn_spdM5Zg');  
    
INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Doctor Sleep', 
	STR_TO_DATE('11/08/2019', '%m/%d/%Y'), 
	'Struggling with alcoholism, Dan Torrance remains traumatized 
    by the sinister events that occurred at the Overlook Hotel when 
    he was a child. His hope for a peaceful existence soon becomes 
    shattered when he meets Abra, a teen who shares his extrasensory 
    gift of the "shine." Together, they form an unlikely alliance to 
    battle the True Knot, a cult whose members try to feed off the 
    shine of innocents to become immortal.', 
    'resources/7.jpg', 
	'https://www.youtube.com/embed/BOzFZxB-8cw');  

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Midway', 
	STR_TO_DATE('11/08/2019', '%m/%d/%Y'), 
	'On Dec. 7, 1941, Japanese forces launch a devastating attack 
    on Pearl Harbor, the U.S. naval base in Hawaii. Six months later, 
    the Battle of Midway commences on June 4, 1942, as the Japanese 
    navy once again plans a strike against American ships in the Pacific. 
    For the next three days, the U.S. Navy and a squad of brave fighter 
    pilots engage the enemy in one of the most important and decisive 
    battles of World War II.', 
    'resources/8.jpg', 
	'https://www.youtube.com/embed/BfTYY_pac8o');

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Charlie\'s Angels', 
	STR_TO_DATE('11/15/2019', '%m/%d/%Y'), 
	'A brilliant scientist invents Calisto -- a sustainable energy 
    source that will revolutionize the way people use power. But 
    when Calisto falls into the wrong hands, the Angels must 
    retrieve it before it can be used as a weapon of mass 
    destruction.', 
    'resources/9.jpg', 
	'https://www.youtube.com/embed/RSUq4VfWfjE');

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Last Christmas', 
	STR_TO_DATE('11/08/2019', '%m/%d/%Y'), 
	'Nothing seems to go right for young Kate, a frustrated Londoner 
    who works as an elf in a year-round Christmas shop. But things 
    soon take a turn for the better when she meets Tom -- a handsome 
    charmer who seems too good to be true. As the city transforms 
    into the most wonderful time of the year, Tom and Kate\'s growing 
    attraction turns into the best gift of all -- a Yuletide romance.', 
    'resources/10.jpg', 
	'https://www.youtube.com/embed/z9CEIcmWmtA');
    
INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Harriet', 
	STR_TO_DATE('11/01/2019', '%m/%d/%Y'), 
	'From her escape from slavery through the dangerous missions she 
    led to liberate hundreds of slaves through the Underground Railroad, 
    the story of heroic abolitionist Harriet Tubman is told.', 
    'resources/11.jpg', 
	'https://www.youtube.com/embed/osP9iJjvlAE');

INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer)
VALUES(
	'Joker', 
	STR_TO_DATE('10/04/2019', '%m/%d/%Y'), 
	'Forever alone in a crowd, failed comedian Arthur Fleck seeks 
    connection as he walks the streets of Gotham City. Arthur wears 
    two masks -- the one he paints for his day job as a clown, and 
    the guise he projects in a futile attempt to feel like he\'s 
    part of the world around him. Isolated, bullied and disregarded 
    by society, Fleck begins a slow descent into madness as he 
    transforms into the criminal mastermind known as the Joker.', 
    'resources/12.jpg', 
	'https://www.youtube.com/embed/zAGVQLHvwOY');

INSERT INTO CreditCards (credNum, secCode, address, month, year, uid)
VALUES(1111111111111111,111,'1 address rd',1,2021,1);

INSERT INTO CreditCards (credNum, secCode, address, month, year, uid)
VALUES(1111111111111112,111,'1 address rd',1,2021,1);

INSERT INTO CreditCards (credNum, secCode, address, month, year, uid)
VALUES(2222222222222222,222,'2 address rd',2,2022,2);

INSERT INTO CreditCards (credNum, secCode, address, month, year, uid)
VALUES(3333333333333333,333,'3 address rd',3,2023,3);

INSERT INTO CreditCards (credNum, secCode, address, month, year, uid)
VALUES(4444444444444444,444,'4 address rd',4,2024,4);

INSERT INTO CreditCards (credNum, secCode, address, month, year, uid)
VALUES(5555555555555555,555,'5 address rd',5,2025,5);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(2,1,'Cool','I like it',4);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(3,1,'Not bad','Thanks. That was cool',5);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(3,2,'I like it','I agree with the comment above',5);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(3,3,'great movie','life changing. very good ',5);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(4,1,'Not good','I hated it',1);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(4,2,'Im confused','I thought this was frozen 2',2);

INSERT INTO Reviews (mid, uid, title, description, rating)
VALUES(4,3,'Apparently not a musical','I was singing during the 
movie and was thrown out.',3);

INSERT INTO ShowTimes (mid, time) VALUES(1,'2019-11-22 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(1,'2019-11-22 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(1,'2019-11-22 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(1,'2019-11-23 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(1,'2019-11-23 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(1,'2019-11-23 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(2,'2019-11-15 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(2,'2019-11-15 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(2,'2019-11-15 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(2,'2019-11-16 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(2,'2019-11-16 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(2,'2019-11-16 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(3,'2019-11-22 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(3,'2019-11-22 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(3,'2019-11-22 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(3,'2019-11-23 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(3,'2019-11-23 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(3,'2019-11-23 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(4,'2019-11-22 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(4,'2019-11-22 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(4,'2019-11-22 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(4,'2019-11-23 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(4,'2019-11-23 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(4,'2019-11-23 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(5,'2019-11-15 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(5,'2019-11-15 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(5,'2019-11-15 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(5,'2019-11-16 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(5,'2019-11-16 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(5,'2019-11-16 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(6,'2019-12-20 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(6,'2019-12-20 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(6,'2019-12-20 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(6,'2019-12-21 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(6,'2019-12-21 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(6,'2019-12-21 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(7,'2019-11-08 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(7,'2019-11-08 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(7,'2019-11-08 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(7,'2019-11-09 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(7,'2019-11-09 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(7,'2019-11-09 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(8,'2019-11-08 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(8,'2019-11-08 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(8,'2019-11-08 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(8,'2019-11-09 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(8,'2019-11-09 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(8,'2019-11-09 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(9,'2019-11-15 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(9,'2019-11-15 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(9,'2019-11-15 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(9,'2019-11-16 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(9,'2019-11-16 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(9,'2019-11-16 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(10,'2019-11-08 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(10,'2019-11-08 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(10,'2019-11-08 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(10,'2019-11-09 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(10,'2019-11-09 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(10,'2019-11-09 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(11,'2019-11-01 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(11,'2019-11-01 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(11,'2019-11-01 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(11,'2019-11-02 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(11,'2019-11-02 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(11,'2019-11-02 18:00:00');

INSERT INTO ShowTimes (mid, time) VALUES(12,'2019-10-04 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(12,'2019-10-04 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(12,'2019-10-04 18:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(12,'2019-10-05 12:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(12,'2019-10-05 15:00:00');
INSERT INTO ShowTimes (mid, time) VALUES(12,'2019-10-05 18:00:00');
