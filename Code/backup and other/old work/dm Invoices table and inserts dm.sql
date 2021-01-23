USE Country_Club_1_1;
GO

CREATE TABLE Invoices (
	invoiceid INT PRIMARY KEY NOT NULL IDENTITY, 
	memberid INT REFERENCES Members(memberid), 
	productid VARCHAR(255), 
	saletotal MONEY NOT NULL,
	courseid INT REFERENCES GolfCourse(courseid));