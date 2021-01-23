CREATE VIEW [MemberInfo] AS
 
SELECT memfname AS 'First Name',
              memlname AS 'Last Name',
              email AS 'Email',
              phonenumber AS 'Phone #'
       FROM Members