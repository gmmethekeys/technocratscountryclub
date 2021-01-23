USE Country_Club_1_1;
GO

CREATE TABLE ShopStats (
	shopid INT PRIMARY KEY IDENTITY,
	shopname VARCHAR(255) NOT NULL,
	customervisits INT NOT NULL, 
	shopphone VARCHAR(12) NOT NULL,
	shopemail VARCHAR(255) NOT NULL);

INSERT INTO ShopStats (shopid, shopname, customervisits, shopphone, shopemail)
	VALUES
		(001, 'The 4077', 0, '480-895-2304', 'the4077@technocc.com');