--update discount column on each row in products

DECLARE @productid AS INT;
DECLARE @curItemID AS INT; 
DECLARE @discount AS INT;

SET @productid = 0;
SET @discount = 20;

DECLARE discount_Cursor CURSOR FOR

	SELECT productid FROM Products

OPEN discount_Cursor;

FETCH NEXT FROM discount_cursor INTO @curItemID

	WHILE @@FETCH_STATUS = 0
		BEGIN
			UPDATE Products
				SET pdiscount = @discount
					WHERE CURRENT OF discount_cursor;

			SELECT @productid = @productid + 1;

			FETCH NEXT FROM discount_cursor INTO @curItemID
		END;

CLOSE discount_cursor;

DEALLOCATE discount_cursor;
