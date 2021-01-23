/*
CLOCK-OUT STORED PROCEDURE 

FOR TESTING
--DROP PROCEDURE clockOut
GO
*/

--takes employee ID as input, does not allow null or unknown empid
CREATE PROCEDURE clockOut (@empidin INT)
AS

--checking the entered employee id against the employees table
DECLARE @empid INT;
SET @empid = (SELECT empid FROM Employees AS e WHERE e.empid = @empidin);

--using begin try to ensure the data insersion is successful
BEGIN TRY
	UPDATE Timesheet
		SET clockout = GETDATE() WHERE empid = @empid AND clockout IS NULL
END TRY
--returns the error message if there is one
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO

/* TEST 

EXEC clockOut @empidin = 113219133
SELECT * FROM Timesheet;
*/
