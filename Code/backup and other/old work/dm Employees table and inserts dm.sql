USE Country_Club_1_1;
GO

CREATE TABLE Employees ( 
	empid INT PRIMARY KEY, 
	jobid INT REFERENCES Jobs(jobid) NOT NULL,
	fname VARCHAR(50) NOT NULL, 
	lname VARCHAR(50) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	address VARCHAR(50) NOT NULL,
	state VARCHAR(2) NOT NULL); 


INSERT INTO  Employees (empid, jobid, fname, lname, email, address, state) 
	VALUES 
		(366501048, 001, 'Mord', 'Fairburne', 'mfairburne0@hostgator.com', '14 Browning Center', 'AZ'),
		(280951769, 002, 'Conan', 'Dameisele', 'cdameisele1@blinklist.com', '26 Coleman Center', 'AZ'),
		(677860224, 003, 'Yorgo', 'Baltrushaitis', 'ybaltrushaitis2@vkontakte.ru', '11 Dixon Avenue', 'AZ'),
		(897664403, 004, 'Teddi', 'MacNulty', 'tmacnulty3@goo.gl', '015 Boyd Parkway', 'AZ'),
		(653300684, 004, 'Farand', 'Coneybeer', 'fconeybeer4@diigo.com', '74192 Eastwood Street', 'AZ'),
		(175825115, 004, 'Tedra', 'Cowlin', 'tcowlin5@cpanel.net', '17 Kensington Drive', 'AZ'),
		(495757031, 004, 'Pen', 'Fransoni', 'pfransoni6@istockphoto.com', '77 Moulton Point', 'AZ'),
		(420155019, 004, 'Torrie', 'Baggs', 'tbaggs7@newyorker.com', '48898 Macpherson Crossing', 'AZ'),
		(934808748, 004, 'Rad', 'Cawdron', 'rcawdron8@xrea.com', '0914 Loftsgordon Center', 'AZ'),
		(604155001, 004, 'Anthony', 'Brahmer', 'abrahmer9@liveinternet.ru', '74995 Waxwing Place', 'AZ'),
		(893857465, 004, 'Ines', 'Kaine', 'ikainea@home.pl', '04 Debs Way', 'AZ'),
		(819628809, 005, 'Clareta', 'Bridgen', 'cbridgenb@unc.edu', '96 Sommers Avenue', 'AZ'),
		(432491729, 006, 'Erroll', 'Janovsky', 'ejanovskyc@deliciousdays.com', '9403 Prentice Center', 'AZ'),
		(885765238, 006, 'Jehu', 'Dockrey', 'jdockreyd@sbwire.com', '31 La Follette Place', 'AZ'),
		(998006012, 006, 'Irma', 'Stolting', 'istoltinge@myspace.com', '11195 Manufacturers Circle', 'AZ'),
		(945277163, 006, 'Gradeigh', 'Passy', 'gpassyf@hubpages.com', '56 Express Terrace', 'AZ'),
		(113219133, 006, 'Annabelle', 'Burtonshaw', 'aburtonshawg@hatena.ne.jp', '59 Schmedeman Lane', 'AZ'),
		(170933354, 006, 'Norrie', 'Bewsy', 'nbewsyh@friendfeed.com', '92228 Derek Way', 'AZ'),
		(701667922, 007, 'Sebastiano', 'Dyas', 'sdyasi@thetimes.co.uk', '031 Golf View Lane', 'AZ'),
		(969229908, 007, 'Nert', 'Barajaz', 'nbarajazj@tumblr.com', '2695 Forest Dale Lane', 'AZ');
		