USE Country_Club_1_1
GO

/* Another script would feed the variables in, separated, as
a transaction could hold multiple products. A stored procedure
can take optional variables but not an unknown number of variables.
The script would split the product codes for SQL. 
*/
--https://www.sqlservercentral.com/forums/topic/pass-an-unknown-number-of-values-to-a-function
--DROP PROCEDURE cInvoice

CREATE PROCEDURE cInvoice (@memberidin INT, @productidin INT, @qtyin INT, @courseidin INT)
AS

DECLARE @memid INT;
SET @memid = (SELECT memberid FROM Members AS m WHERE m.memberid = @memberidin);

DECLARE @prodid INT;
SET @prodid = (SELECT productid FROM Products AS p WHERE p.productid = @productidin);

DECLARE @salesTotal INT;
SET @salesTotal = (SELECT setprice * @qtyin AS p1 FROM Products WHERE productid = @prodid);


DECLARE @corid INT;
SET @corid = (SELECT courseid FROM Golfcourse AS g WHERE g.courseid = @courseidin);


BEGIN TRY
	INSERT INTO Invoices (memberid, productid, saletotal, courseid)
		VALUES
			(@memid, @prodid, @salesTotal, @corid)

	UPDATE ShopItems
		SET quantity = quantity - @qtyin WHERE productid = @productidin
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

/*
EXEC cInvoice @memberidin = 65,
				@productidin =33,
				@qtyin = 2,
				@courseidin = 001;
SELECT * FROM Invoices;
*/