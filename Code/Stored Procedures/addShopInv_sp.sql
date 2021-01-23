USE Country_Club_1_1
GO

--Create Procedure AddShopInv created 3 parameters

CREATE PROCEDURE AddShopInv (@productid INT,@shopid INT,@quantity INT)
AS
    --Sets @productid and @shopid to prevent random entry into the field
    SET @productid = (SELECT productid FROM dbo.Products AS p WHERE p.productid  = @productid)
    SET @shopid = (SELECT shopid FROM dbo.ShopStats AS p WHERE p.shopid = 001)

BEGIN TRY
    --Inserts data into the product id, shop id, and quantity of the Shopeitems table
    INSERT INTO ShopItems (productid, shopid, quantity)
		VALUES
    (@productid, @shopid, @quantity)
END TRY

--catches error
BEGIN CATCH
SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH


/*testing
-- Excutes and updates the ShopItems Table

EXEC AddShopInv

@productid = 00008,
@shopid = 001,
@quantity = 8;
SELECT * FROM ShopItems
*/