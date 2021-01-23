USE Country_Club_1_1
GO

 
CREATE VIEW TotalInvDollars
AS
	SELECT	COUNT(invoiceid) AS '# of Invoices', 
			SUM(saletotal) AS '$ Total' FROM Invoices;
			
GO

SELECT * FROM TotalInvDollars;

