/*
====================================================================
Create Database and Schemas  
====================================================================

Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the databases exists, it is dropped and recreated. Additionally, the script sets up three schemas within the 
database: 'bronze', 'silver', 'gold'.

Warning:
Running this script will drop the entries 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. 
Proceed with caution and ensure you have propert backups before running this script.
*/  

USE MASTER;
GO

-- Drop and Recreate the 'DataWarehouse' Database
IF EXISTS(Select 1 from sys.databases where name = 'DataWarehouse')
  BEGIN
    ALTER Database DataWarehouse SET Single_User With Rollback Immediate;
    Drop Database DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

Use DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
