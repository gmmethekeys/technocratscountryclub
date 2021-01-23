/* This is the academic work of Donald Marovich and is not for 
any commercial or monetary use. This database can be used, edited, 
and distributed ONLY for academic purposes. */

USE master; 
GO

IF DB_ID('Country_Club_1_1') IS NOT NULL
DROP DATABASE Country_Club_1_1;
GO

CREATE DATABASE Country_Club_1_1;
GO

USE Country_Club_1_1;
GO

CREATE TABLE Golfcourse (
	courseid INT PRIMARY KEY, 
	coursename VARCHAR(255) NOT NULL,
	courseaddress VARCHAR(255) NOT NULL,
	coursestate VARCHAR(2) NOT NULL,
	coursephone VARCHAR(50) NOT NULL,
	courseemail VARCHAR(255) NOT NULL,
	coursemanager VARCHAR(255) NOT NULL);

CREATE TABLE Jobs (
	jobid INT PRIMARY KEY IDENTITY,
	jobtitle VARCHAR(50) NOT NULL, 
	jobrank INT NOT NULL,
	jobpay MONEY NOT NULL,
	jobdesc VARCHAR(255) NOT NULL);

CREATE TABLE Employees ( 
	empid INT PRIMARY KEY, 
	jobid INT REFERENCES Jobs(jobid) NOT NULL,
	fname VARCHAR(50) NOT NULL, 
	lname VARCHAR(50) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	address VARCHAR(50) NOT NULL,
	state VARCHAR(2) NOT NULL); 

CREATE TABLE Members (
	memberid INT PRIMARY KEY,
	memtitle VARCHAR(50),
	memfname VARCHAR(50) NOT NULL,
	memlname VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	gender VARCHAR(50),
	memaddress VARCHAR(50) NOT NULL,
	memstate VARCHAR(2) NOT NULL,
	phonenumber VARCHAR(50) NOT NULL,
	memshirtsize VARCHAR(3) NOT NULL);
	
CREATE TABLE Invoices (
	invoiceid INT PRIMARY KEY NOT NULL, 
	memberid INT REFERENCES Members(memberid), 
	productid VARCHAR(255), 
	saletotal MONEY NOT NULL,
	courseid INT REFERENCES GolfCourse(courseid));
	
 CREATE TABLE HoleInfo (
    holeid INT PRIMARY KEY,
    courseid INT REFERENCES Golfcourse(courseid),
    hname VARCHAR(255) NOT NULL,
    hnumber INT NOT NULL,
    hdistance INT NOT NULL,
    hpar INT NOT NULL);	
	
CREATE TABLE Products (
	productid INT PRIMARY KEY NOT NULL,
	pcode VARCHAR(8) NOT NULL, 
	pname VARCHAR(255)NOT NULL, 
	pdesc VARCHAR(255), 
	setprice MONEY NOT NULL, 
	pdiscount MONEY, 
	datecreated DATETIME NOT NULL);

CREATE TABLE ShopStats (
	shopid INT PRIMARY KEY,
	shopname VARCHAR(255) NOT NULL,
	customervisits INT NOT NULL, 
	shopphone VARCHAR(12) NOT NULL,
	shopemail VARCHAR(255) NOT NULL);

CREATE TABLE ShopItems (
	itemid INT PRIMARY KEY NOT NULL, 
	productid INT REFERENCES Products(productid),
	shopid INT REFERENCES ShopStats(shopid),
	quantity INT NOT NULL);

CREATE TABLE Timesheet ( 
	timesheetid INT PRIMARY KEY, 
	empid INT REFERENCES Employees (empid),
	clockin DATETIME NOT NULL, 
	clockout DATETIME NOT NULL);

GO

INSERT INTO Golfcourse (courseid, coursename, courseaddress, coursestate, coursephone, courseemail, coursemanager)
	VALUES
		(001, 'Technocrats Country Club', '5668 E. Orange Blossom Ln', 'AZ', '480-889-1505', 'technoCC@technocc.com', 'Mord Fairburn');		

SET IDENTITY_INSERT Jobs ON;
INSERT INTO Jobs (jobid, jobtitle, jobrank, jobpay, jobdesc)
	VALUES
		(001, 'General Manager', 1, 80000, 'Manages the property and staff to ensure the country club runs efficiently and provides exemplary customer service to its members.'),
		(002, 'Assistant Manager', 2, 60000, 'Assists General Manager with club facilities and staff management responsibilties.'),
		(003, 'Shop Manager', 3, 40000, 'Manages the golf shop and manages all shop employees.'),
		(004, 'Shop Attendant', 4, 27000, 'Provides customer service in golf shop and assists in all shop duties.'),
		(005, 'Head Groundskeeper', 3, 40000, 'Manages  and maintains the golf course grounds and maintains pinnicle groundskeeping and service.'),
		(006, 'Groundskeeper', 4, 29000, 'Assists in grounds maintainance.'), 
		(007, 'Intern', 5, 0, 'Unpaid internship for the country club.');		
SET IDENTITY_INSERT Jobs OFF;

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
	
INSERT INTO Members (memberid, memtitle, memfname, memlname, email, gender, memaddress, memstate, phonenumber, memshirtsize) 
	VALUES 
		(1, 'Ms', 'Hermia', 'Godspede', 'hgodspede0@irs.gov', 'Female', '7209 Stoughton Hill', 'TX', '806-995-5801', 'L'),
		(2, 'Rev', 'Peterus', 'Disman', 'pdisman1@furl.net', 'Male', '12 Myrtle Circle', 'TN', '865-306-0528', 'L'),
		(3, 'Mr', 'Reeva', 'O''Hannen', 'rohannen2@ebay.co.uk', 'Female', '379 Spenser Point', 'CA', '559-624-1627', 'L'),
		(4, 'Dr', 'Wilfrid', 'Milham', 'wmilham3@mac.com', 'Male', '39576 Service Street', 'AL', '205-545-9683', 'M'),
		(5, 'Honorable', 'Mindy', 'Swedeland', 'mswedeland4@ox.ac.uk', 'Female', '5136 Ludington Park', 'GA', '912-181-6792', 'L'),
		(6, 'Ms', 'Mylo', 'Todd', 'mtodd5@imgur.com', 'Male', '7 Mayer Pass', 'GA', '770-909-0182', 'M'),
		(7, 'Mrs', 'Markus', 'Sharpous', 'msharpous6@usgs.gov', 'Male', '38547 Ohio Street', 'DE', '302-790-6000', 'M'),
		(8, 'Dr', 'Kennith', 'Kobel', 'kkobel7@ihg.com', 'Male', '66 Spaight Court', 'VA', '571-793-6821', 'XS'),
		(9, 'Rev', 'Felice', 'Farfolomeev', 'ffarfolomeev8@blogtalkradio.com', 'Female', '351 Summit Pass', 'DC', '202-539-3312', 'M'),
		(10, 'Rev', 'Spencer', 'Redferne', 'sredferne9@dagondesign.com', 'Male', '45 Mendota Lane', 'NC', '919-203-4879', 'L'),
		(11, 'Dr', 'Dyan', 'Hatwell', 'dhatwella@163.com', 'Female', '02 Merry Parkway', 'CA', '559-729-4714', 'XL'),
		(12, 'Mrs', 'Valentina', 'Craydon', 'vcraydonb@desdev.cn', 'Female', '24714 Colorado Point', 'CA', '916-139-4084', 'XS'),
		(13, 'Dr', 'Debee', 'Cerro', 'dcerroc@pcworld.com', 'Female', '48 Clyde Gallagher Park', 'CA', '559-659-1461', 'M'),
		(14, 'Mrs', 'Grover', 'Ninnotti', 'gninnottid@newyorker.com', 'Male', '09331 Kings Way', 'GA', '404-256-3742', 'L'),
		(15, 'Honorable', 'Tillie', 'Wedderburn', 'twedderburne@marriott.com', 'Female', '567 Lakewood Gardens Pass', 'TX', '210-667-8552', '2XL'),
		(16, 'Ms', 'Cary', 'Harraway', 'charrawayf@smugmug.com', 'Male', '3017 Walton Pass', 'VA', '757-636-8608', 'S'),
		(17, 'Ms', 'Fairlie', 'Witherow', 'fwitherowg@qq.com', 'Male', '11843 Beilfuss Terrace', 'VA', '804-775-0816', '3XL'),
		(18, 'Honorable', 'Geri', 'Laurentin', 'glaurentinh@quantcast.com', 'Male', '6 Daystar Circle', 'GA', '229-746-1586', '2XL'),
		(19, 'Mrs', 'Joann', 'Sealey', 'jsealeyi@tumblr.com', 'Female', '00657 Arkansas Park', 'WI', '414-711-2275', 'L'),
		(20, 'Dr', 'Iosep', 'Paszak', 'ipaszakj@liveinternet.ru', 'Male', '25 Melrose Center', 'OH', '513-547-9642', '2XL'),
		(21, 'Mrs', 'Stevena', 'Handyside', 'shandysidek@msu.edu', 'Female', '43081 Towne Crossing', 'CA', '559-837-0287', '2XL'),
		(22, 'Ms', 'Bartel', 'Fossett', 'bfossettl@amazon.de', 'Male', '60957 Jenifer Trail', 'DC', '202-502-1110', '2XL'),
		(23, 'Rev', 'Boniface', 'Clack', 'bclackm@arizona.edu', 'Male', '456 Comanche Way', 'AL', '205-222-5745', 'L'),
		(24, 'Mrs', 'Augustine', 'Offin', 'aoffinn@reuters.com', 'Male', '2791 Farragut Way', 'VA', '571-388-1226', 'XL'),
		(25, 'Ms', 'Annice', 'Cowope', 'acowopeo@stumbleupon.com', 'Female', '5 Autumn Leaf Place', 'CA', '916-614-8976', 'L'),
		(26, 'Dr', 'Staford', 'Le Monnier', 'slemonnierp@gravatar.com', 'Male', '96405 Cambridge Terrace', 'CA', '415-152-9688', 'L'),
		(27, 'Ms', 'Ronalda', 'Fairhall', 'rfairhallq@admin.ch', 'Female', '83 Esch Court', 'TX', '254-903-7886', '2XL'),
		(28, 'Rev', 'Eachelle', 'Zolini', 'ezolinir@about.com', 'Female', '8 Jana Way', 'KS', '785-148-9284', 'L'),
		(29, 'Ms', 'Charleen', 'Hassett', 'chassetts@comsenz.com', 'Female', '82 Anniversary Crossing', 'IL', '309-910-7126', 'M'),
		(30, 'Mr', 'Arlyne', 'Burkhill', 'aburkhillt@mapquest.com', 'Female', '927 Sachtjen Lane', 'NY', '212-737-2808', '3XL'),
		(31, 'Mr', 'Cecilla', 'Althrope', 'calthropeu@xrea.com', 'Female', '6113 Forest Court', 'NC', '704-556-9412', '3XL'),
		(32, 'Mr', 'Marie', 'Domenichelli', 'mdomenichelliv@slideshare.net', 'Female', '355 Transport Hill', 'NY', '914-577-3383', 'S'),
		(33, 'Mr', 'Holly-anne', 'Honacker', 'hhonackerw@theglobeandmail.com', 'Female', '72603 Meadow Valley Drive', 'VA', '540-751-6358', 'XL'),
		(34, 'Rev', 'Davie', 'Conahy', 'dconahyx@wufoo.com', 'Male', '80 Huxley Avenue', 'IL', '217-690-3323', 'L'),
		(35, 'Ms', 'Jody', 'Willcott', 'jwillcotty@timesonline.co.uk', 'Female', '092 Dwight Circle', 'PA', '412-838-3350', 'S'),
		(36, 'Ms', 'Wandie', 'Luxon', 'wluxonz@plala.or.jp', 'Female', '489 Thierer Circle', 'CA', '916-697-6166', 'S'),
		(37, 'Ms', 'Mathew', 'Kubyszek', 'mkubyszek10@pinterest.com', 'Male', '8 Superior Way', 'PA', '412-505-6470', '2XL'),
		(38, 'Ms', 'Goran', 'Tregale', 'gtregale11@hubpages.com', 'Male', '5497 Walton Center', 'CO', '719-667-8762', 'XL'),
		(39, 'Rev', 'Susy', 'Batman', 'sbatman12@google.cn', 'Female', '6038 Northwestern Road', 'CA', '858-226-2222', 'M'),
		(40, 'Dr', 'Cyndie', 'Clooney', 'cclooney13@virginia.edu', 'Female', '49772 Morrow Court', 'TX', '210-361-4404', 'XL'),
		(41, 'Honorable', 'Reagen', 'Schimonek', 'rschimonek14@nbcnews.com', 'Male', '59 Chinook Way', 'CA', '805-127-4263', '3XL'),
		(42, 'Rev', 'Stephi', 'Tower', 'stower15@youtu.be', 'Female', '9873 Glacier Hill Park', 'FL', '754-776-3307', 'XL'),
		(43, 'Rev', 'Karleen', 'Studart', 'kstudart16@hugedomains.com', 'Female', '3152 Morningstar Junction', 'FL', '321-523-2118', '2XL'),
		(44, 'Mr', 'Dana', 'Carse', 'dcarse17@irs.gov', 'Female', '7019 Walton Court', 'NY', '607-611-3370', 'S'),
		(45, 'Ms', 'Goldie', 'Hampson', 'ghampson18@seattletimes.com', 'Female', '88 Forest Dale Circle', 'FL', '941-891-1226', '2XL'),
		(46, 'Ms', 'Isahella', 'Tezure', 'itezure19@ft.com', 'Female', '8631 Heffernan Road', 'CA', '209-157-0872', 'L'),
		(47, 'Ms', 'Pippo', 'Bladder', 'pbladder1a@cnbc.com', 'Male', '693 Quincy Center', 'FL', '561-945-0084', '2XL'),
		(48, 'Rev', 'Gina', 'Havis', 'ghavis1b@nyu.edu', 'Female', '981 Dixon Pass', 'PA', '215-808-8716', '3XL'),
		(49, 'Honorable', 'Arda', 'Tolcher', 'atolcher1c@google.com.hk', 'Female', '02 Lillian Drive', 'CA', '619-995-8769', 'S'),
		(50, 'Rev', 'Aime', 'Huyhton', 'ahuyhton1d@paypal.com', 'Female', '61 Dovetail Pass', 'DC', '202-642-1922', 'L'),
		(51, 'Rev', 'Edwin', 'Sayle', 'esayle1e@printfriendly.com', 'Male', '85966 Di Loreto Lane', 'NY', '585-329-6350', '3XL'),
		(52, 'Ms', 'Maurie', 'Chaloner', 'mchaloner1f@goo.ne.jp', 'Male', '7891 Springview Circle', 'FL', '850-769-9000', 'XL'),
		(53, 'Dr', 'Yevette', 'Pasmore', 'ypasmore1g@nasa.gov', 'Female', '981 Hanover Alley', 'WA', '206-131-9511', '2XL'),
		(54, 'Ms', 'Monica', 'Duchesne', 'mduchesne1h@ihg.com', 'Female', '15156 Hermina Terrace', 'DC', '202-208-1210', 'M'),
		(55, 'Ms', 'Hersch', 'Wiltshaw', 'hwiltshaw1i@squidoo.com', 'Male', '621 Chinook Place', 'WA', '253-397-6181', 'M'),
		(56, 'Rev', 'Melanie', 'Dantesia', 'mdantesia1j@indiegogo.com', 'Female', '3 Autumn Leaf Hill', 'MA', '617-811-0869', 'S'),
		(57, 'Rev', 'Elliot', 'Cusick', 'ecusick1k@liveinternet.ru', 'Male', '87420 Carey Crossing', 'KY', '502-382-5288', '2XL'),
		(58, 'Mrs', 'Riva', 'Sarle', 'rsarle1l@nyu.edu', 'Female', '054 Sachtjen Alley', 'LA', '504-844-7352', 'M'),
		(59, 'Ms', 'Adelaide', 'Tapson', 'atapson1m@google.com.au', 'Female', '629 Lakewood Gardens Point', 'TX', '713-363-6863', 'M'),
		(60, 'Dr', 'Harlin', 'Ditchfield', 'hditchfield1n@wordpress.com', 'Male', '76 Thackeray Alley', 'TX', '806-558-3163', 'S'),
		(61, 'Mr', 'Millie', 'Loftin', 'mloftin1o@nifty.com', 'Female', '4227 Bayside Court', 'MI', '616-894-1551', 'S'),
		(62, 'Mr', 'Christabel', 'Worledge', 'cworledge1p@jiathis.com', 'Female', '94 Butternut Plaza', 'SC', '864-726-8388', 'L'),
		(63, 'Rev', 'Poul', 'Fraczak', 'pfraczak1q@shutterfly.com', 'Male', '90 Morningstar Terrace', 'MA', '978-405-1498', 'XS'),
		(64, 'Honorable', 'Brose', 'Castello', 'bcastello1r@macromedia.com', 'Male', '1 Eastwood Trail', 'NY', '212-137-6477', 'M'),
		(65, 'Mr', 'Janeva', 'Calvey', 'jcalvey1s@sourceforge.net', 'Female', '5 Dapin Point', 'GA', '478-110-8558', 'S'),
		(66, 'Ms', 'Meredeth', 'Jedraszek', 'mjedraszek1t@cbc.ca', 'Male', '19 Walton Trail', 'TN', '865-588-4090', '2XL'),
		(67, 'Rev', 'Alasteir', 'Matthai', 'amatthai1u@hao123.com', 'Male', '04 Oriole Lane', 'CA', '323-379-5684', 'S'),
		(68, 'Ms', 'Howey', 'Franken', 'hfranken1v@nasa.gov', 'Male', '9713 Shasta Circle', 'TX', '903-970-0352', 'XS'),
		(69, 'Dr', 'Gar', 'Dohmer', 'gdohmer1w@bing.com', 'Male', '28104 3rd Parkway', 'AZ', '480-118-8133', '3XL'),
		(70, 'Mr', 'Brunhilda', 'Jirka', 'bjirka1x@samsung.com', 'Female', '1338 Rusk Center', 'MO', '816-374-4788', 'M'),
		(71, 'Ms', 'Sarene', 'Lambarth', 'slambarth1y@goo.ne.jp', 'Female', '2144 Graceland Point', 'AZ', '520-390-9706', 'S'),
		(72, 'Mrs', 'Timmy', 'Rosencwaig', 'trosencwaig1z@topsy.com', 'Male', '7062 Eggendart Parkway', 'MD', '410-316-1544', 'S'),
		(73, 'Mr', 'Laura', 'Jaume', 'ljaume20@nytimes.com', 'Female', '17702 Reinke Alley', 'CA', '619-203-5823', 'XL'),
		(74, 'Mr', 'Roxie', 'Sowerbutts', 'rsowerbutts21@wordpress.org', 'Female', '17970 Golf Road', 'MO', '314-975-0897', '3XL'),
		(75, 'Honorable', 'Kearney', 'Goldup', 'kgoldup22@t-online.de', 'Male', '84327 Crest Line Parkway', 'TN', '865-638-3029', 'XS'),
		(76, 'Mrs', 'Theodore', 'Bertson', 'tbertson23@lulu.com', 'Male', '4 Canary Drive', 'NE', '402-258-5303', 'L'),
		(77, 'Ms', 'Merci', 'Thiese', 'mthiese24@samsung.com', 'Female', '462 Basil Junction', 'CA', '310-716-0044', 'XS'),
		(78, 'Mrs', 'Silvano', 'Maffiotti', 'smaffiotti25@cnet.com', 'Male', '1069 Goodland Terrace', 'MT', '406-951-2113', 'XL'),
		(79, 'Ms', 'Brennen', 'Cantos', 'bcantos26@purevolume.com', 'Male', '80 Daystar Road', 'MI', '313-657-1753', 'XL'),
		(80, 'Mr', 'Missy', 'Willarton', 'mwillarton27@businessinsider.com', 'Female', '8 Jana Plaza', 'KY', '502-979-2297', '2XL'),
		(81, 'Honorable', 'Diarmid', 'Van Der Straaten', 'dvanderstraaten28@google.nl', 'Male', '48540 Derek Plaza', 'OR', '503-933-5160', '2XL'),
		(82, 'Mr', 'Jacquenette', 'Olpin', 'jolpin29@meetup.com', 'Female', '49 Stone Corner Center', 'TX', '915-473-2135', 'XS'),
		(83, 'Honorable', 'Domenico', 'Boij', 'dboij2a@usgs.gov', 'Male', '64 Badeau Crossing', 'CA', '916-291-9858', 'S'),
		(84, 'Mrs', 'Moira', 'Wipper', 'mwipper2b@etsy.com', 'Female', '770 Sunbrook Pass', 'IN', '812-263-3127', '2XL'),
		(85, 'Mrs', 'Darcy', 'De Simone', 'ddesimone2c@buzzfeed.com', 'Female', '11941 Steensland Road', 'LA', '504-836-2379', 'S'),
		(86, 'Dr', 'Allie', 'Rohloff', 'arohloff2d@de.vu', 'Female', '9225 Old Shore Court', 'CA', '559-604-6983', '2XL'),
		(87, 'Rev', 'Margo', 'Maffetti', 'mmaffetti2e@squidoo.com', 'Female', '5 Twin Pines Drive', 'VA', '571-643-9538', 'M'),
		(88, 'Mrs', 'Roderigo', 'Paddock', 'rpaddock2f@plala.or.jp', 'Male', '01285 Laurel Center', 'TN', '423-407-7290', 'XL'),
		(89, 'Ms', 'Adrianne', 'Driffe', 'adriffe2g@odnoklassniki.ru', 'Female', '04165 Huxley Way', 'AL', '334-734-9185', 'L'),
		(90, 'Ms', 'Greta', 'Kemell', 'gkemell2h@privacy.gov.au', 'Female', '19 North Plaza', 'OK', '918-988-6523', 'S'),
		(91, 'Mr', 'Ephrem', 'Meachem', 'emeachem2i@moonfruit.com', 'Male', '91635 Spenser Way', 'NM', '505-702-6257', 'XS'),
		(92, 'Dr', 'Reynard', 'Flippen', 'rflippen2j@spiegel.de', 'Male', '4050 Meadow Vale Park', 'CO', '720-755-9458', 'XL'),
		(93, 'Ms', 'Tibold', 'Bayston', 'tbayston2k@yellowpages.com', 'Male', '1096 Fairfield Center', 'TX', '682-124-3563', '2XL'),
		(94, 'Ms', 'Georgetta', 'Smoote', 'gsmoote2l@cbc.ca', 'Female', '9 Buell Center', 'IA', '712-149-5116', 'M'),
		(95, 'Ms', 'Ennis', 'Fabry', 'efabry2m@omniture.com', 'Male', '6819 La Follette Way', 'MA', '318-931-8612', 'S'),
		(96, 'Dr', 'Aurie', 'Peizer', 'apeizer2n@uiuc.edu', 'Female', '133 Heffernan Lane', 'FL', '561-307-7883', '3XL'),
		(97, 'Dr', 'Adelbert', 'Kaszper', 'akaszper2o@wikimedia.org', 'Male', '421 Riverside Road', 'TX', '713-833-2889', 'XL'),
		(98, 'Honorable', 'Adriaens', 'Spyby', 'aspyby2p@umich.edu', 'Female', '691 Old Shore Trail', 'FL', '786-487-5514', '2XL'),
		(99, 'Mrs', 'Ansell', 'Derbyshire', 'aderbyshire2q@t-online.de', 'Male', '414 Kings Road', 'CT', '203-865-1498', 'XL'),
		(100, 'Dr', 'Sanson', 'Hambatch', 'shambatch2r@yahoo.com', 'Male', '38209 Sutteridge Alley', 'CA', '213-186-8600', 'S'),
		(101, 'Dr', 'Gretel', 'Brando', 'gbrando2s@usa.gov', 'Female', '38406 Hagan Alley', 'PA', '215-906-2910', 'S'),
		(102, 'Mr', 'Jolee', 'Flaxon', 'jflaxon2t@de.vu', 'Female', '894 Roxbury Alley', 'OH', '330-756-1298', 'S'),
		(103, 'Rev', 'Humfrid', 'Caulder', 'hcaulder2u@live.com', 'Male', '16 Pennsylvania Lane', 'AZ', '520-527-7175', 'XS'),
		(104, 'Mrs', 'Farris', 'Frany', 'ffrany2v@prlog.org', 'Male', '5150 Northfield Court', 'NV', '702-939-2618', '2XL'),
		(105, 'Mrs', 'Daffi', 'Ardron', 'dardron2w@lulu.com', 'Female', '928 Mallard Avenue', 'IL', '773-293-4824', 'XL'),
		(106, 'Mr', 'Angy', 'Reinbach', 'areinbach2x@theglobeandmail.com', 'Female', '734 Hudson Road', 'PA', '215-918-8537', 'S'),
		(107, 'Ms', 'Marianna', 'Blazynski', 'mblazynski2y@biblegateway.com', 'Female', '66 Rutledge Lane', 'CA', '213-737-1269', 'XS'),
		(108, 'Honorable', 'Burton', 'Monget', 'bmonget2z@berkeley.edu', 'Male', '3123 Canary Place', 'AR', '501-476-2657', 'XS'),
		(109, 'Mr', 'Nomi', 'Copins', 'ncopins30@statcounter.com', 'Female', '87585 Shasta Place', 'IA', '515-511-3730', 'M'),
		(110, 'Honorable', 'Georgette', 'Cappell', 'gcappell31@toplist.cz', 'Female', '97 Mayfield Point', 'FL', '727-503-3633', 'L'),
		(111, 'Honorable', 'Desirae', 'Timcke', 'dtimcke32@livejournal.com', 'Female', '26786 Columbus Alley', 'NC', '704-388-5814', 'L'),
		(112, 'Ms', 'Melloney', 'Necrews', 'mnecrews33@vimeo.com', 'Female', '44 Jenifer Way', 'NE', '402-439-9464', 'L'),
		(113, 'Ms', 'Irwinn', 'Rama', 'irama34@twitter.com', 'Male', '73 Daystar Park', 'CA', '714-307-3433', '3XL'),
		(114, 'Honorable', 'Willey', 'Willingam', 'wwillingam35@google.com.au', 'Male', '346 Farragut Trail', 'HI', '808-441-8825', 'M'),
		(115, 'Dr', 'Patricio', 'Wroth', 'pwroth36@w3.org', 'Male', '4 Donald Trail', 'CA', '714-517-1130', 'XS'),
		(116, 'Honorable', 'Regina', 'Madge', 'rmadge37@sphinn.com', 'Female', '109 Sage Place', 'WI', '414-989-8656', '2XL'),
		(117, 'Mrs', 'Cristina', 'Spiniello', 'cspiniello38@theguardian.com', 'Female', '3 Hooker Pass', 'NY', '718-635-0634', 'S'),
		(118, 'Mr', 'Cord', 'Woodsford', 'cwoodsford39@archive.org', 'Male', '12 Manley Trail', 'NV', '702-101-5205', '2XL'),
		(119, 'Honorable', 'Oswald', 'Purches', 'opurches3a@buzzfeed.com', 'Male', '620 Goodland Street', 'MI', '517-224-7813', '3XL'),
		(120, 'Mr', 'Faina', 'Caddock', 'fcaddock3b@acquirethisname.com', 'Female', '6897 Towne Park', 'NY', '212-762-4274', '3XL'),
		(121, 'Rev', 'Jo', 'Lidgely', 'jlidgely3c@fastcompany.com', 'Female', '203 Raven Parkway', 'TX', '254-504-0793', 'S'),
		(122, 'Dr', 'Corri', 'Meekins', 'cmeekins3d@opera.com', 'Female', '2767 Dwight Alley', 'TX', '210-875-0674', 'S'),
		(123, 'Rev', 'Berny', 'Guyet', 'bguyet3e@google.com.hk', 'Male', '2 Lien Junction', 'LA', '504-898-9982', 'L'),
		(124, 'Mrs', 'Thacher', 'McCole', 'tmccole3f@skyrock.com', 'Male', '2 Sherman Way', 'MO', '573-938-7571', 'S'),
		(125, 'Rev', 'Rosana', 'Bembridge', 'rbembridge3g@webs.com', 'Female', '390 Lien Circle', 'IN', '812-211-1240', 'XS'),
		(126, 'Rev', 'Pat', 'Alman', 'palman3h@nba.com', 'Male', '81135 Butterfield Center', 'CA', '760-931-8606', 'M'),
		(127, 'Dr', 'Bettine', 'Halliday', 'bhalliday3i@google.co.uk', 'Female', '09660 Ilene Trail', 'MA', '508-736-3050', '3XL'),
		(128, 'Dr', 'Leroy', 'Spada', 'lspada3j@qq.com', 'Male', '1558 Ramsey Crossing', 'OK', '405-399-9191', 'XL'),
		(129, 'Dr', 'Katti', 'Stolworthy', 'kstolworthy3k@answers.com', 'Female', '79389 Fordem Park', 'PA', '267-984-3579', 'S'),
		(130, 'Dr', 'Ellary', 'Treweek', 'etreweek3l@skyrock.com', 'Male', '734 Service Trail', 'OH', '419-204-5744', 'XS'),
		(131, 'Dr', 'Owen', 'Dunbleton', 'odunbleton3m@scribd.com', 'Male', '4 Fallview Crossing', 'FL', '904-128-5372', 'XS'),
		(132, 'Mr', 'Beitris', 'Yele', 'byele3n@twitpic.com', 'Female', '02481 Stuart Circle', 'IA', '319-641-7209', 'XS'),
		(133, 'Honorable', 'Patrizia', 'Konertz', 'pkonertz3o@webmd.com', 'Female', '593 Knutson Point', 'DC', '202-432-0325', 'XL'),
		(134, 'Rev', 'Rinaldo', 'Gilfoy', 'rgilfoy3p@slideshare.net', 'Male', '03139 Dapin Drive', 'VA', '434-855-3357', '3XL'),
		(135, 'Mrs', 'Rafaelia', 'Glasspoole', 'rglasspoole3q@opensource.org', 'Female', '8 Sauthoff Alley', 'FL', '561-829-5546', 'M'),
		(136, 'Ms', 'Melinda', 'Francello', 'mfrancello3r@oaic.gov.au', 'Female', '08931 Melvin Street', 'IL', '312-197-7548', 'S'),
		(137, 'Mr', 'Hetty', 'Dalliston', 'hdalliston3s@spotify.com', 'Female', '1 Grover Road', 'NY', '212-387-0223', 'M');	

INSERT INTO holeinfo (holeid, courseid, hname, hnumber, hdistance, hpar)
    VALUES
        (1, 001, 'Ironman', 1, 600, 5),
        (2, 001, 'Ant Man', 2, 320, 3),
        (3, 001, 'Hulk', 3, 575, 5),
        (4, 001, 'Thor', 4, 600, 5),
        (5, 001, 'Loki', 5, 425, 4),
        (6, 001, 'Black Widow', 6, 580, 5),
        (7, 001, 'Black Panther', 7, 610, 5),
        (8, 001, 'Spiderman', 8, 350, 3),
        (9, 001, 'Goose the Cat', 9, 650, 5),
        (10, 001, 'Captain America', 10, 701, 5),
        (11, 001, 'Hawkeye', 11, 480, 4),
        (12, 001, 'Star-Lord', 12, 510, 4),
        (13, 001, 'Mantis', 13, 635, 5),
        (14, 001, 'Rocket', 14, 690, 5),
        (15, 001, 'Gamora', 15, 325, 3),
        (16, 001, 'Groot', 16, 597, 5),
        (17, 001, 'Thanos', 17, 780, 5),
        (18, 001, 'Winter Soldier', 18, 545, 5);	

INSERT INTO Products (productid, pcode, pname, pdesc, setprice, datecreated)
	VALUES
		(00001, 'aaaaaaab', 'Callaway Mens Strata Ultimate Complete Golf Set 18-Piece', 'Strata Ultimate is an 18-piece golf set, featuring a driver, 2 fairway woods, 2 hybrids, 4 irons, 2 wedges, a putter, lightweight stand bag, and 5 headcovers.', 374.99, '2019-04-20 11:15:00'),
		(00002, 'aaaaaaac', 'Callaway Mens Strata Tour Golf Set 18-Piece', 'Strata Tour is an 18-piece golf set, featuring a driver, 2 fairway woods, 2 hybrids, 4 irons, 2 wedges, a putter, lightweight stand bag, and 5 headcovers.', 589.99, '2019-04-20 11:16:00'),
		(00003, 'aaaaaaad', 'Wilson Golf Mens Ultra Complete Package Set', 'Super game improvement design focuses on generating more distance for beginner golfers.', 159.99, '2019-04-20 11:17:00'),
		(00004, 'aaaaaaae', 'Callaway Womens Strata Ultimate Complete Golf Set 16-Piece', 'The ultimate set is complete with a driver, a fairway wood, two hybrids, four irons, two wedges, a putter a stand bag and four headcovers. ', 379.49, '2019-04-20 11:18:00'),
		(00005, 'aaaaaaaf', 'Precise M5 Ladies Womens Complete Right Handed Golf Clubs Set', 'Includes Titanium Driver, Fairway Wood, Hybrid, 5-PW Irons, Putter, Stand Bag, 3 H/Cs', 219.99, '2019-04-20 11:19:00'),
		(00006, 'aaaaaaag', 'Wilson Golf Profile SGI Womens Complete Golf Set with Bag', 'This set include state of the art golf clubs with a comfy bag.', 345.33, '2019-04-20 11:20:00'),
		(00007, 'aaaaaaah', 'Titleist Pro V1 Prior Generation Golf Balls, White One Dozen', 'Extraordinary Distance with Consistent Flight', 39.95, '2019-04-20 11:21:00'),
		(00008, 'aaaaaaai', 'Callaway 50 Mix Near Mint AAAA Used Golf Balls', 'Callaway Mix includes the following models: Diablo, Diablo Tour, Big Bertha, Warbird, etc.', 27.57, '2019-04-20 11:22:00'),
		(00009, 'aaaaaaaj', 'Night Sports Tracer Light Range Balls 50 pack', 'These golf balls light up and let you play all night long!', 199.99, '2019-04-20 11:23:00'),
		(00010, 'aaaaaaak', 'Volvik Golf DS-55 Low Compression Golf Balls One Dozen', 'Orange color makes them easy to find, and low compression ensures a longer flight.', 99.99, '2019-04-20 11:24:00'),
		(00011, 'aaaaaaal', 'Under Armor Mens Tech Polo - S', 'Textured fabric thats soft, light & breathable.', 28.99, '2019-04-20 11:25:00'),
		(00012, 'aaaaaaam', 'Under Armor Mens Tech Polo - M', 'Textured fabric thats soft, light & breathable.', 28.99, '2019-04-20 11:26:00'),
		(00013, 'aaaaaaan', 'Under Armor Mens Tech Polo - L', 'Textured fabric thats soft, light & breathable.', 28.99, '2019-04-20 11:27:00'),
		(00014, 'aaaaaaao', 'NIKE Mens Dry Victory Solid Golf Polo Shirt - S', 'NIKE Dry Fabric, powered by sweat-wicking technology, wicks sweat away to help keep you dry and comfortable.', 26.78, '2019-04-20 11:28 :00'),
		(00015, 'aaaaaaap', 'NIKE Mens Dry Victory Solid Golf Polo Shirt - M', 'NIKE Dry Fabric, powered by sweat-wicking technology, wicks sweat away to help keep you dry and comfortable.', 26.78, '2019-04-20 11:29:00'),
		(00016, 'aaaaaaaq', 'NIKE Mens Dry Victory Solid Golf Polo Shirt - L', 'NIKE Dry Fabric, powered by sweat-wicking technology, wicks sweat away to help keep you dry and comfortable.', 26.78, '2019-04-20 11:30:00'),
		(00017, 'aaaaaaar', 'Callaway Womens Short Sleeve Opti-Vent Open Mesh Polo - XS', 'OptiDri: transfers moisture away from the body to aid in evaporation.', 23.99, '2019-04-20 11:31:00'),
		(00018, 'aaaaaaas', 'Callaway Womens Short Sleeve Opti-Vent Open Mesh Polo - S', 'OptiDri: transfers moisture away from the body to aid in evaporation.', 23.99, '2019-04-20 11:32:00'),
		(00019, 'aaaaaaat', 'Callaway Womens Short Sleeve Opti-Vent Open Mesh Polo - M', 'OptiDri: transfers moisture away from the body to aid in evaporation.', 23.99, '2019-04-20 11:33:00'),
		(00020, 'aaaaaaau', 'Callaway Womens Short Sleeve Opti-Vent Open Mesh Polo - L', 'OptiDri: transfers moisture away from the body to aid in evaporation.', 23.99, '2019-04-20 11:34:00'),
		(00021, 'aaaaaaav', 'Under Armour Womens Tech Twist Zip Up - XS', 'Material wicks sweat and dries really fast.', 52.99, '2019-04-20 11:35:00'),
		(00022, 'aaaaaaaw', 'Under Armour Womens Tech Twist Zip Up - S', 'Material wicks sweat and dries really fast.', 52.99, '2019-04-20 11:36:00'),
		(00023, 'aaaaaaax', 'Under Armour Womens Tech Twist Zip Up - M', 'Material wicks sweat and dries really fast.', 52.99, '2019-04-20 11:37:00'),
		(00024, 'aaaaaaay', 'Under Armour Womens Tech Twist Zip Up - L', 'Material wicks sweat and dries really fast.', 52.99, '2019-04-20 11:38:00'),
		(00025, 'aaaaaaaz', 'IZOD Mens Classic Fit Golf Shorts - S', 'Moisture-wicking properties pull moisture away from the body keeping you dry and feeling cool ', 54.99, '2019-04-20 11:39:00'),
		(00026, 'aaaaaaba', 'IZOD Mens Classic Fit Golf Shorts - M', 'Moisture-wicking properties pull moisture away from the body keeping you dry and feeling cool ', 54.99,'2019-04-20 11:40:00'),
		(00027, 'aaaaaabb', 'IZOD Mens Classic Fit Golf Shorts - L', 'Moisture-wicking properties pull moisture away from the body keeping you dry and feeling cool ', 54.99, '2019-04-20 11:41:00'),
		(00028, 'aaaaaabc', 'Adidas Golf Womens Essential Golf Shorts - XS', 'adidas Golf designs award-winning products across apparel, footwear and accessories for every golfer. Innovation is at the heart of everything we do. ', 29.99, '2019-04-20 11:42:00'),
		(00029, 'aaaaaabd', 'Adidas Golf Womens Essential Golf Shorts - S', 'adidas Golf designs award-winning products across apparel, footwear and accessories for every golfer. Innovation is at the heart of everything we do. ', 29.99, '2019-04-20 11:43:00'),
		(00030, 'aaaaaabe', 'Adidas Golf Womens Essential Golf Shorts - M', 'adidas Golf designs award-winning products across apparel, footwear and accessories for every golfer. Innovation is at the heart of everything we do. ', 29.99, '2019-04-20 11:44:00'),
		(00031, 'aaaaaabf', 'Adidas Golf Womens Essential Golf Shorts - L', 'adidas Golf designs award-winning products across apparel, footwear and accessories for every golfer. Innovation is at the heart of everything we do. ', 29.99, '2019-04-20 11:45:00'),
		(00032, 'aaaaaabg', 'Adidas Mens Tech Response Golf Shoes - 7', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:46:00'),
		(00033, 'aaaaaabh', 'Adidas Mens Tech Response Golf Shoes - 8', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:47:00'),
		(00034, 'aaaaaabi', 'Adidas Mens Tech Response Golf Shoes - 9', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:48:00'),
		(00035, 'aaaaaabj', 'Adidas Mens Tech Response Golf Shoes - 10', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:49:00'),
		(00036, 'aaaaaabk', 'Adidas Mens Tech Response Golf Shoes - 11', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:50:00'),
		(00037, 'aaaaaabl', 'Adidas Mens Tech Response Golf Shoes - 12', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:51:00'),
		(00038, 'aaaaaabm', 'Adidas Mens Tech Response Golf Shoes - 13', 'Comfort + performance.  Designed with materials that are durable, lightweight and extremely comfortable.', 78.00, '2019-04-20 11:52:00'),
		(00039, 'aaaaaabn', 'Adidas Womens Tech Response Golf Shoes - 4', 'The heart and soul of adidas golf, this product features powerful designs and bold branding.', 78.99, '2019-04-20 11:53:00'),
		(00040, 'aaaaaabo', 'Adidas Womens Tech Response Golf Shoes - 5', 'The heart and soul of adidas golf, this product features powerful designs and bold branding.', 78.99, '2019-04-20 11:54:00'),
		(00041, 'aaaaaabp', 'Adidas Womens Tech Response Golf Shoes - 6', 'The heart and soul of adidas golf, this product features powerful designs and bold branding.', 78.99, '2019-04-20 11:55:00'),
		(00042, 'aaaaaabq', 'Adidas Womens Tech Response Golf Shoes - 7', 'The heart and soul of adidas golf, this product features powerful designs and bold branding.', 78.99, '2019-04-20 11:56:00'),
		(00043, 'aaaaaabr', 'Adidas Womens Tech Response Golf Shoes - 8', 'The heart and soul of adidas golf, this product features powerful designs and bold branding.', 78.99, '2019-04-20 11:57:00'),
		(00044, 'aaaaaabs', 'Adidas Womens Tech Response Golf Shoes - 9', 'The heart and soul of adidas golf, this product features powerful designs and bold branding.', 78.99, '2019-04-20 11:58:00'),
		(00045, 'aaaaaabt', 'Pride Professional Tee System 3-1/4 inch - 20 pack', 'Golf tees that allows for easy identification of length and appropriateness for various golf clubs.', 16.99, '2019-04-20 11:59:00'),
		(00046, 'aaaaaabu', 'Wedge Guys PGA Bamboo Golf Tees - 1000 bulk', 'Engineered from specific species of bamboo to ensure a stronger, longer lasting and more capable golf tee.', 24.99, '2019-04-20 12:00:00'),
		(00047, 'aaaaaabv', 'Callaway Golf 2018 Adjustable Trucker Hat', 'High quality material and stitching with a mesh back for those hot days.', 24.99, '2019-04-20 12:01:00'),
		(00048, 'aaaaaabw', 'Titleist Classic Golf Hat Unisex', 'Wear what the masters wear to up your game!', 32.99, '2019-04-20 11:01:00'),
		(00049, 'aaaaaabx', 'Bag Boy Quad XL Golf Cart', 'Carry around your clubs with style and wheels! Save your back and never carry your bag ever again!', 198.99, '2019-04-20 11:02:00'),
		(00050, 'aaaaaaby', 'Suncast Golf Bag Garage Organizer', 'DOUBLE GOLF BAG ORGANIZER: Organize and store all your golfing equipment in one spot. Ideal for garages or basements.', 74.99, '2019-04-20 11:03:00'),
		(00051, 'aaaaaabz', 'Greens Towel Microfiber 3-pack', 'Clean your clubs, your hands, your face, your friends face!', 48.99, '2019-04-20 11:04:00'),
		(00052, 'aaaaaaca', 'TecTec Laser Range Finder', 'Find the distance to any object with just the push of a button.', 149.99, '2019-04-20 11:05:00');


INSERT INTO ShopStats (shopid, shopname, customervisits, shopphone, shopemail)
	VALUES
		(001, 'The 4077', 0, '480-895-2304', 'the4077@technocc.com');

