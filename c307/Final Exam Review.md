
# **Final Exam Review**

## Week 1 - Binary Representation
## Week 2 - Binary Arithmetic
## Week 3 - Digital Logic

## Week 4 - Basic Linked List
## Week 5 - Ordered Linked List
## Week 6 - Remove a Node from Linked List 
## Week 7 - Stack
## Week 8 - Algorithm Complexity Analysis
## Week 9 - Queue
## Week 10 - Tree
## Week 11 - Binary Search Tree
## Week 12 - HashTable

## Week 13 - File Organization
Definition of a File
Properties of a File
- Long-term
- Sharable
- Structure
File Structure
- Field:
- Record:
- File:
- Database:

Data Structure
- Org
- App
File Organization
- Org
- App
- Physical
Databases
- org
- App
- Logical

Storage Hierarchy
- Primary Memory
- Secondary Memory

## Week 14 - Database Organization
Topics
- Definitions of Database
- Characteristics of the Database
- Modeling of Database

Database: a collection of related data
- Data: known facts that can be recorded and have an implicit meaning

Database Management System (DBMS): a general-purpose software package to facilitate the process of Defining, Constructing, Manipulating, and Sharing databases among users and/or applications

Database System: both the DBMS and the data together

Main Characteristics of a Database
1. Self-describing nature
2. Insulation between programs and data, and data abstraction
3. Support of multiple views of the data
4. Sharing of data and multiuser transaction processing

Capabilities of DBMS
- Control redundancy
  - Ex. File processing
  - Data normalization
- Restrict
  - Sharing of data
- Providing Storage Structures
  - Searching the hard disk
  - Query processing and optimization

## Week 15 - Hash Table: Hash Function

## Week 15 - SQL
### Data Manipulation
**SELECT**
**UPDATE**
**DELETE**
**INSERT INTO**
### Data Definition
**CREATE TABLE**
**DROP TABLE**

The SELECT Statement
- Syntax:
```sql
SELECT column_name
FROM table_name
```

- SELECT ALL
  - Syntax:
```sql
SELECT * FROM table_name
```
- SELECT DISTINCT
  - Syntax:
```sql
SELECT DISTINCT column_name(s)
FROM table_name
```
WHERE CLAUSE
- Operators

Using Quotes
The LIKE Condition
- Syntax:
```sql
```
The INSERT INTO Statement
- Syntax:
```sql
INSERT INTO table_name
VALUES (val1, val2,….)

OR

INSERT INTO table_name(column_name1, column_name2,..)
VALUES (val1, val2,….)
```
Insert a New Row
- Syntax:
```sql
```
Insert Data in Specified Columns
- Ex.
```sql
```

The UPDATE Statement
- Syntax:
```sql
UPDATE table_name
SET column_name = new_value
WHERE column_name = some_value
```

Update One Column in a Row
- Ex.
```sql
UPDATE Person SET FirstName='Nina'
WHERE LastName = 'Rasmussen'
```

Update Several Columns in a Row
- Ex.
```sql
UPDATE Person
SET Address='Stein 12', City='Stavanger'
WHERE LastName = 'Rasmussen'
```

The DELETE Statement
- Syntax:
```sql
DELETE FROM table_name
WHERE column_name = some_value
```

DELETE a ROW
Ex.
```sql
DELETE FROM Person WHERE LastName = 'Rasmussen' 
```


DELETE ALL Rows
- Syntax:
```sql
DELETE FROM table_name

OR

DELETE * FROM table_name
```

CREATE TABLE Statement
- Syntax:
```sql
CREATE TABLE table_name
{
    column_name1 data_type,
    column_name2 data_type,
    column_name3 data_type,
    ...
}
```
DROP TABLE Statement
- Syntax
```sql
DROP TABLE table_name
```


## Week 16 - HashTable Collision Resolution
## Week 16 - XML

## Week 17 - JSON
**JSON Syntax**
**Applications of JSON**

## Week 18 - Blockchain / Bitcoin


## Week 19 - Hadoop