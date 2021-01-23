CREATE VIEW [InvoiceInfo] AS
 
SELECT i.invoiceid AS 'Invoice ID',
              i.productid AS 'Product ID',
              p.pname AS 'Product Name',
              i.saletotal AS 'Sale Total'
       FROM Invoices AS i
 
JOIN Products AS p ON i.productid = p.productid 