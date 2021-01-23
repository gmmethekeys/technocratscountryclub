CREATE VIEW TopFiveSales
AS
SELECT TOP 5
	p.pname as 'Product Name',
    p.setprice * i.saletotal AS 'Total Sales per Item'
FROM Invoices AS i 
JOIN Products AS p ON p.productid = i.productid 

GO

SELECT * FROM TopFiveSales;
