USE Country_Club_1_1
GO

 
CREATE PROCEDURE TotalInvDollars
AS

BEGIN TRY 
	SELECT COUNT(invoiceid) AS '# of Invoices', SUM(saletotal) AS '$ Total' FROM Invoices;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

--EXECUTE TotalInvDollars 