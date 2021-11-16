# P8
---

## CREATE TABLE

```sql
CREATE TABLE NewTableName (
    ColumnName DataType OptionalConstraint,
    ColumnName DataType OptionalConstraint,
    ...
    Optional table constraint
    ...
);
```


```sql
CREATE TABLE ARTIST (
    ArtistID Int NOT NULL IDENTITY(1,1),
    LastName Char(25) NOT NULL,
    FirstName Char(25) NOT NULL,
    Nationality Char(30) NULL,
    DateOfBirth Numeric(4,0) NULL,
    DateOfDeceased Numeric(4,0) NULL,
    CONSTRAINT ArtistPK PRIMARY KEY(ArtistID),
    CONSTRAINT ArtistAK1 UNIQUE(LastName,FirstName)
);
```

```sql
CREATE TABLE WORK (
    WorkID Int NOT NULL IDENTITY(500,1),
    Title Char(35) NOT NULL,
    Copy Char(12) NOT NULL,
    Medium Char(35) NULL,
    [Description] Varchar(1000) NULL DEFAULT 'Unknown provenance'
    ArtistID Int NOT NULL,
    CONSTRAINT WorkPK PRIMARY KEY(WorkID),
    CONSTRAINT WorkAK1 UNIQUE(Title,Copy),
    CONSTRAINT ArtistFK FOREIGN KEY(ArtistID)
        REFERENCES ARTIST(ArtistID)
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
);
```

## The SQL ALTER TABLE Statement
Adding & Dropping Columns
ADD Clause
DROP COLUMN Clause

Adding & Dropping Constraints
ADD CONSTRAINT
DROP CONSTRAINT

## The SQL DROP TABLE Statement
DROP TABLE Statement


## The SQL TRUNCATE TABLE Statement


## The SQL CREATE INDEX Statement

## The SQL ALTER INDEX Statement

## The SQL DROP INDEX Statement

DML Statements

## The SQL INSERT Statement
- Using Column Names
- Bulk INSERT


## The SQL UPDATE Statement
- Bulk Updates
- Updating Using Values from Other Tables

## The SQL MERGE Statement

## The SQL DELETE Statement
Ex. Delete the row for a customer with a CustomerID of 1000
```sql
DELETE FROM CUSTOMER
WHERE CustomerID = 1000;
```

## Using SQL Views
CREATE VIEW

Data: recorded facts and numbers

Information is,
- knowledge derived from data
- data presented in a meaningful context
- data processed by summing, ordering, averaging, grouping, comparing, or other similar operations


CREATE VIEW
```sql
CREATE VIEW CustomerNameView AS
    SELECT  LastName AS CustomerLastName
            FirstName AS CustomerFirstName
    FROM CUSTOMER;
```


ALTER VIEW
```sql

```

**Uses of SQL Views**
- Hide columns or rows


UPDATE VIEW


## Embedding SQL in Program Code

## SQL/Persistent Stored Module (SQL/PSM)

## Using SQL User-Defined Functions

CREATE FUNCTION


## Using SQL Triggers
Trigger: 

**Uses of SQL Triggers**


## Using Stored Procedures
Stored Procedure:


Tiggers vs. Stored Procedures


Advantages of Stored Procedures