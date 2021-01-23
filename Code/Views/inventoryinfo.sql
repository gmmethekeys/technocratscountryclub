CREATE VIEW [InventoryInfo]
AS
       SELECT t.shopname AS 'Shop Name',
                     p.pname AS 'Product Name',
                     s.quantity AS 'Quantity'
       FROM ShopItems AS s
 
JOIN Products AS p ON p.productid = s.productid
JOIN ShopStats AS t ON t.shopid = s.shopid

GO

SELECT * FROM InventoryInfo;