CREATE PROCEDURE CustomerVisits
AS

BEGIN TRY
	UPDATE ShopStats
		SET customervisits = customervisits + 1
END TRY

BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

--EXEC CustomerVisits