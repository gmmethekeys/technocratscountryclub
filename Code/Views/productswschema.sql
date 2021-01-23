CREATE VIEW ProductOrder WITH SCHEMABINDING
AS
	SELECT	pname AS 'Product Name',
			pdesc AS 'Product Description',
			setprice AS 'Original Price',
			pdiscount AS 'Product Discount',
			datecreated AS 'Date in Inventory'        
	FROM dbo.Products  

GO

SELECT * FROM ProductOrder;
