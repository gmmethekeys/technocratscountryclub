/*
CLOCK-IN STORED PROCEDURE 

FOR TESTING
--DROP PROCEDURE clockIn
GO
*/

--takes employee ID as input, does not allow null or unknown empid
CREATE PROCEDURE clockIn(@empidin INT)
AS

--checking the entered employee id against the employees table
DECLARE @empid INT;
SET @empid = (SELECT empid FROM Employees AS e WHERE e.empid = @empidin);

--using begin try to ensure the data insersion is successful
BEGIN TRY
	INSERT INTO Timesheet (empid, clockin)
		VALUES
			(@empid, GETDATE());
END TRY
--returns the error message if there is one
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO

/* TEST 

EXEC clockIN @empidin = 113219133
SELECT * FROM Timesheet;
*/