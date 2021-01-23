USE Country_Club_1_1;
GO

CREATE TABLE ShopItems (
	itemid INT PRIMARY KEY NOT NULL IDENTITY, 
	productid INT REFERENCES Products(productid),
	shopid INT REFERENCES ShopStats(shopid),
	quantity INT NOT NULL);
	
