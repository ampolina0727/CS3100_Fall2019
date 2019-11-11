CREATE SCHEMA myfirstdb;

SHOW SCHEMAS;

USE myfirstdb;

CREATE TABLE Students (
    StudentID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    CONSTRAINT PK_Person PRIMARY KEY (StudentID,LastName)
);

Describe Students;


INSERT INTO Students (StudentID, LastName, FirstName)
VALUES (1, 'Smith', 'John'),
		(2, 'Jones', 'Samantha');
        
SELECT *
FROM Students;


CREATE TABLE Classes (
    ClassID int NOT NULL,
    ClassName VARCHAR(255) NOT NULL,
    StudentID int,
    PRIMARY KEY (ClassID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


Describe Classes;

INSERT INTO Classes (ClassID, ClassName, StudentID)
VALUES (123, 'Principles of Database Design and Programming', 1),
       (456, 'Fundamentals of Data Mining', 2);
       
SELECT *
FROM Classes;

SELECT *
FROM Students
LEFT JOIN Classes
ON Students.StudentID = Classes.StudentID;

