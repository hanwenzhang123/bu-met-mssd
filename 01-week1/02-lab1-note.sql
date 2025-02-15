Datatype:
decimal - number
DECIMAL(12) - number - up to 12 digits
varchar - string
VARCHAR(256) - limit of the characters, here is 256 characters
date - date


Step 1: Creating a Table
tables are data containers
tables enforces a structure
tables have columns

CREATE TABLE TableNmae(   //TableName is an identifier
Column1 Datatype1,
Column2 Datatype2,...
);    //(; - SQL command)

example:
CREATE TABLE Person( 
person_id DECIMAL(12), 
first_name VARCHAR(256), 
last_name VARCHAR(256) 
);


Step2: Inserting a Row
INSERT INTO TableName (column1, column2...)
VALUES(value1, value2, ...);

example:
INSERT INTO Person (person_id, first_name, last_name)
VALUES(1, 'John', 'Smith');
//the order of the value is corresponding to the column
//' 'is a string literal, means for data


Step 3: Selecting All Rows
SELECT *      //(* means all)
FROM TableName

example:
SELECT *
FROM Person;


Step 4: Updating All Rows
UPDATE TableName
SET columnX = Value;

example:
UPDATE Person
Set last_name = 'Glass';


Step 5: Deleting All Rows
DELETE FROM TableName

example:
DELETE FROM Person;
// all the rows are gone, but the table (person_id, first_name, last_name) still exists


Step 6: Dropping a Table 
DROP TABLE TableName;

example:
DROP TABLE Person;

//getting rid of whole table - dangerous
//person no longer exist


Step 7: Table Setup
creating a table with constraints, must be true all the time
CREATE TABLE TableName(
Column1 Datatype 2 NOT NULL PRIMARY KEY, // set it as a primary key, must be unique
Column1 Datatype 2 NOT NULL...);      // all row must have a value, can not be null

example:
CREATE TABLE Person( 
person_id DECIMAL(12) NOT NULL PRIMARY KEY,   //unique identifier
first_name VARCHAR(256) NOT NULL
last_name VARCHAR(256) NOT NULL
);

INSERT INTO Person (person_id, first_name, last_name)
VALUES(1, 'John', 'Smith');   // we can only have one '1', and all data must have a value


step 8-10: Table Population


step 11: Filtered Results
SELECT column X, column Y
FROM TableName
WHERE columnZ = Value;  // a precise location, targeted result

example:
SELECT first_name, last_name
FROM Person
WHERE person_id = 1 AND last_name = 'Smith';



steps 12-13: Targeted Update
UPDATE TableName 
SET columnX = Value
WHERE columnY = AnotherValue;

example:
UPDATE Person 
Set last_name = 'Glass'
WHERE person_id = 1;



step 14: Targeted Data Removal
DELECT FROM TableName
WHERE column = value;

DELETE FROM Person
WHERE person_id = 2;



step 15: Data Anomalies
multiple insertions of the same data
Data Anomalies: when same data insert over and over again in different rows with different values
Deletion Anomalies: when you have multiple rows you end up deleting the data you are not supposed to delete.

solution - proper design - normalization(week4), proper entity(week2-3)



example:
CREATE TABLE Restaurant (
restaurant_id DECIMAL(12) NOT NULL PRIMARY KEY,
restaurant_name VARCHAR(32) NOT NULL,
open_since DATE NOT NULL);

INSERT INTO Restaurant (restaurant_id, restaurant_name, open_since)
VALUES (101, 'Happy Town', CAST('23-APR-2021' AS DATE));      //'23-APR-2021' is a string literal, CAST it AS DATE. specific format 23-APR-2021 for SQL
INSERT INTO Restaurant (restaurant_id, restaurant_name, open_since)
VALUES (102, 'Fun Town', '13-MAY-2021');    //converted to US format 2021-05-13 but can change, can be without CAST and AS DATE


CREATE TABLE Orders(
order_id DECIMAL(12) NOT NULL PRIMARY KEY,
product_name VARCHAR(64) NOT NULL,
quantity DECIMAL(3) NOT NULL,
price DECIMAL(8,2) NOT NULL,    // 8 to the lest, 2 to the right
business_name VARCHAR(64) NOT NULL);

INSERT INTO Orders(order_id, product_name, quantity, price, business_name)
VALUES(1, 'Widget', 10, 10.99, 'ACME');
VALUES(5, 'Widget', 5, 8.99, 'Amazon');
VALUES(3, 'Pencil', 100, 0.59, 'ACME');

DELETE FROM Orders
WHERE business_name = 'Amazon';   //by doing it, we have no more data related for amazon,  no longer exist in our database
                                  //better to have different tables like product table, business table, price etc


Step 16 – File and Database Table Comparison
- layout in different format and compare them, xml, json, txt

 
