Create a TABLE
==============
SQL> CREATE TABLE mkt_Products (
  2      ProductID INT PRIMARY KEY,
  3      ProductName VARCHAR(50),
  4      Category VARCHAR(50),
  5      Price DECIMAL(10, 2),
  6      StockQuantity INT
  7  );
  
SQL> INSERT ALL
  2      INTO mkt_Products VALUES (1, 'Laptop', 'Electronics', 800.00, 50)
  3      INTO mkt_Products VALUES (2, 'Smartphone', 'Electronics', 500.00, 100)
  4      INTO mkt_Products VALUES (3, 'Desk Chair', 'Furniture', 120.00, 25)
  5      INTO mkt_Products VALUES (4, 'Coffee Maker', 'Appliances', 40.00, 30)
  6      INTO mkt_Products VALUES (5, 'Running Shoes', 'Apparel', 80.00, 50)
  7      INTO mkt_Products VALUES (6, 'Bookshelf', 'Furniture', 150.00, 20)
  8      INTO mkt_Products VALUES (7, 'Backpack', 'Accessories', 30.00, 40)
  9      INTO mkt_Products VALUES (8, 'Microwave', 'Appliances', 70.00, 15)
 10      INTO mkt_Products VALUES (9, 'Office Desk', 'Furniture', 200.00, 10)
 11      INTO mkt_Products VALUES (10, 'T-shirt', 'Apparel', 15.00, 75)
 12  SELECT * FROM dual;
 
SQL> commit;


CONNECT to RMAN
===============
PS C:\Users\JAY> cd C:\app\JAY\product\21c
PS C:\app\JAY\product\21c> mkdir rman_bkp
PS C:\app\JAY\product\21c> cd rman_bkp
PS C:\app\JAY\product\21c\rman_bkp> rman target /


LEVEL 0 BACKUP
==============
RMAN> BACKUP INCREMENTAL LEVEL 0 DATABASE FORMAT 'C:\app\JAY\product\21c\rman_bkp\%u';


Modify the TABLE
=================
INSERT ALL
INTO mkt_Products VALUES (11, 'Keyboard', 'Electronics', 30.00, 50)
INTO mkt_Products VALUES (12, 'Pendrive', 'Electronics', 15.00, 20)
INTO mkt_Products VALUES (13, 'Boots', 'Apparel', 20.00, 10)
SELECT * FROM dual;

SQL> commit;


LEVEL 1 BACKUP
===============
RMAN> BACKUP INCREMENTAL LEVEL 1 DATABASE FORMAT 'C:\app\JAY\product\21c\rman_bkp\%u';


Simulate database file failures by deleting essential data files
=================================================================
SQL> select name from v$datafile;

cd C:\APP\JAY\PRODUCT\21C\ORADATA\XE
rm SYSAUX01.DBF
rm SYSTEM01.DBF
rm TEMP01.DBF
rm UNDOTBS01.DBF
rm USERS01.DBF


Restore and recover the Database
=================================
RMAN> SHUTDOWN IMMEDIATE;

RMAN> STARTUP MOUNT;

RMAN> run
{
restore database from tag TAG20241105T212739;
recover database from tag TAG20241105T213108;
recover database;
sql'alter database open';
}


Check if datafiles are recovered and restored
==============================================
SQL> select name from v$datafile;


Check if the table content are recovered and restored
=============================================
PS C:\Users\JAY> sqlplus / as sysdba

SQL> select * from v$mkt_Products; 

