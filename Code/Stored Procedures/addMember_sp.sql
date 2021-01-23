USE Country_Club_1_1
GO
 
--DROP PROCEDURE addMember
CREATE PROCEDURE addMember (
		@memberid INT,
		@memtitle VARCHAR(50),
		@memfname VARCHAR(50),
		@memlname VARCHAR(50),
		@email VARCHAR(50),
		@gender VARCHAR(50),
		@memaddress VARCHAR(50),
		@memstate VARCHAR(2),
		@phonenumber VARCHAR(50),
		@memshirtsize VARCHAR(3))    
AS
--takes parameters and inserts them in the correct order into the Members table
BEGIN TRY
    INSERT INTO dbo.Members
                     (memberid, memtitle, memfname, memlname, email, gender, memaddress, memstate, phonenumber, memshirtsize)
              VALUES
                     (@memberid, @memtitle, @memfname, @memlname, @email, @gender, @memaddress, @memstate, @phonenumber, @memshirtsize);
END TRY
BEGIN CATCH
       SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
 
--how to format the stored procedure calling
EXEC addmember	
	@memberid = 138,
	@memtitle = 'Mr',
    @memfname = 'John',
    @memlname = 'Smith',
	@email = 'jsmith@technocc.com',
    @gender = 'male',
	@memaddress = '6901 falcoln ln',
    @memstate = 'AZ',
    @phonenumber = '5122542421',
    @memshirtsize = 'XL'; 
SELECT * FROM Members WHERE memberid = 138;