-- CREATE, MODIFY, AND DELETE TABLES

-- CREATE TABLE

CREATE TABLE tablecustomer (
	ClientID	integer auto_increment primary key,
    FirstName	varchar(30) ,
    LastName 	varchar(30) not null,
    State		varchar(2)
);

-- VIEW CREATED TABLE

SELECT *
FROM tablecustomer;

-- CHECKING SQL MODE
SELECT @@SESSION.sql_mode;

-- INSERTING NEW RECORD INTO TABLE
INSERT INTO tablecustomer
	(LastName)
VALUES ('Pham');

-- INSERTING NEW RECORD WITHOUT REQUIRED VALUE
INSERT INTO tablecustomer
	(FirstName)
VALUES ('Xuan');


-- CHANGING SQL MODE
set @@session.sql_mode = 'TRADITIONAL';

INSERT INTO tablecustomer
	(FirstName)
VALUES ('Xuan');


-- INSERTING MULTIPLE RECORDS

INSERT INTO tablecustomer
	(LastName, FirstName, State)
VALUES 
	('Pham', 'Xuan', 'MO'),
    ('Lam', 'Dino', 'KS');


INSERT INTO tablecustomer
	(LastName, FirstName)
VALUES
	('Smith', 'Adam'),
    ('Keynes', 'John');


-- CREATING ANOTHER TABLE

CREATE TABLE newcustomer (
	State varchar(2),
    Name1 varchar(30),
    Name2 varchar(30)
);
	
INSERT INTO newcustomer
	(State, Name1, Name2)
VALUES
	('MO', 'Cheryl', 'McConnell'),
    ('MO', 'Laura', 'Fitzpatrick'),
    ('KS', 'David', 'Ricardo');

SELECT *
FROM newcustomer;

INSERT INTO tablecustomer
	(LastName, FirstName, State)
SELECT
Name2,
Name1,
State
FROM newcustomer
WHERE State = 'MO';


-- UPDATING EXISTING RECORD IN SAFE MODE

UPDATE tablecustomer
	SET State = 'MO'
    WHERE ClientID = 2;


-- UPDATING EXISTING RECORD WITHOUT SAFE MODE
SET SQL_SAFE_UPDATES = 0; -- turn safe mode off
UPDATE tablecustomer
	SET FirstName = 'Xuan',
		State = 'MO';
SET SQL_SAFE_UPDATES = 1; -- turn safe mode back on
        

-- DELETE SINGLE RECORD WITHOUT SAFE MODE
DELETE FROM tablecustomer
WHERE ClientID = 2;


-- DELETE MATCHED RECORDS IN SAFE MODE
SET SQL_SAFE_UPDATES = 0; -- turn safe mode off
DELETE FROM tablecustomer
WHERE State = 'KS';
SET SQL_SAFE_UPDATES = 1; -- turn safe mode back on


-- TRUNCATE TABLE (REMOVE RECORDS)
-- Does not log results of transactions for database administrators to recover databases in the event of system crashes & other problems
TRUNCATE TABLE tablecustomer;





