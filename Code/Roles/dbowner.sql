CREATE ROLE databaseowner AUTHORIZATION db_owner;  
ALTER ROLE databaseowner ADD MEMBER donaldm;
ALTER ROLE databaseowner DROP MEMBER usha5;