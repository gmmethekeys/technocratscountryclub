USE Country_Club_1_1;
GO

CREATE TABLE Jobs (
	jobid INT PRIMARY KEY IDENTITY,
	jobtitle VARCHAR(50) NOT NULL, 
	jobrank INT NOT NULL,
	jobpay MONEY NOT NULL,
	jobdesc VARCHAR(255) NOT NULL);
	
	
INSERT INTO Jobs (jobid, jobtitle, jobrank, jobpay, jobdesc)
	VALUES
		(001, 'General Manager', 1, 80000, 'Manages the property and staff to ensure the country club runs efficiently and provides exemplary customer service to its members.'),
		(002, 'Assistant Manager', 2, 60000, 'Assists General Manager with club facilities and staff management responsibilties.'),
		(003, 'Shop Manager', 3, 40000, 'Manages the golf shop and manages all shop employees.'),
		(004, 'Shop Attendant', 4, 27000, 'Provides customer service in golf shop and assists in all shop duties.'),
		(005, 'Head Groundskeeper', 3, 40000, 'Manages  and maintains the golf course grounds and maintains pinnicle groundskeeping and service.'),
		(006, 'Groundskeeper', 4, 29000, 'Assists in grounds maintainance.'), 
		(007, 'Intern', 5, 0, 'Unpaid internship for the country club.');