USE Country_Club_1_1;
GO

CREATE TABLE Timesheet ( 
	timesheetid INT PRIMARY KEY IDENTITY, 
	empid INT REFERENCES Employees (empid),
	clockin DATETIME NOT NULL, 
	clockout DAETIME);
