--DROP TABLE DeletedMembers;
CREATE TABLE DeletedMembers(
       Memmberid INT,
       memtitle VARCHAR(50),
       memfname VARCHAR(50),
       memlname VARCHAR(50),
       email VARCHAR (50),
       gender VARCHAR (50),
       memaddress VARCHAR (50),
       memstate VARCHAR (2),
       phonenumber VARCHAR (50),
       memshirtsize VARCHAR (3));
 
GO
--DROP TRIGGER DeleteMember;
CREATE TRIGGER DeleteMember ON Members
AFTER DELETE, UPDATE
AS
    INSERT DeletedMembers
              SELECT memberid,
                           memtitle,
                           memfname,
                           memlname,
                           email,
                           gender,
                           memaddress,
                           memstate,
                           phonenumber,
                           memshirtsize
    FROM deleted
 
--testing
SELECT * FROM Members WHERE memberid = 3
UPDATE Members SET memshirtsize = 'M' WHERE memberid = 3
SELECT * FROM DeletedMembers;
       