# Exam 3

[Discussion: GROUP BY vs DISTINCT IN vs. EXISTS, NULLABLE](https://iu.instructure.com/courses/2018740/modules/items/25527026)


**Exam 3 - Notes**

- No time limit
- Covers the content after Exam 2

P8 - Implementation, Ch. 7
P9 - 
P10 - Vulnerability, Ch. 9


**Task 25 - SQL Triggers**


**25.0.1 - Use**`
1. A **trigger** is attached to a table or a view
2. When a trigger is fired, the DBMS supplies:
   1. Old and New values for update
   2. New values for insert
   3. Old valyes for delete
3. The way the values are supplied depends on the DBMS
   1. MySQL - The old values are supplied by prefixinfg a column name with the expression old or new.
4. Trigger applications include:
   1. Provisioning default values
   2. Enforcing data constraints
   3. Updating views
   4. Performing  referencial integrity actions

**25.0.2 - Syntax**

```sql
-- MySQL trigger syntax
CREATE TRIGGER trigger_name
    [trigger_time] [trigger_event]
    ON table_name FOR EACH ROW
    [trigger_order]
    trigger_body
```

**25.0.3 - Prefixing**
(Oracle & MySQL)

**25.1 - List Triggers**

```sql
-- MySQL: list triggers in a schema
select trigger_schema, trigger_name, action_statement 
from   information_schema.triggers
WHERE  trigger_schema like 'vrg'
;
```

**25.2 - Write Trigger**

**25.2.1 - Pipeline**

For each new trigger, it should be tested before putting it to use. Here we follow a pipeline of editing and testing a trigger.

**25.2 - Provide default value**

There are several ways of defining default for a table column. In CREATE TABLE, we can define the DEFAULT constraint in the column definition. In ALTER TABLE, we can add the DEFAULT constraint to the column. A trigger is more flexible. Setting default value can be programmed in a BEFORE INSERT trigger.

**25.2.2.1 - set_artist_sex**

Before creating a new trigger, let’s have a look of vrg.ARTIST table. There is no gender data. We will add a new column sex to the table by running the following statement:

```sql
-- delete the column if exists
ALTER TABLE artist 
  DROP COLUMN IF EXISTS sex
;
```

```sql
-- insert new column sex after firstname
ALTER TABLE artist 
    ADD COLUMN sex CHAR(6) NULL AFTER firstname
;
```

After adding the sex column, write a BEFORE INSERT trigger, set_artist_sex, which assigns default male to sex in every new INSERT. Combine all the statements in the pipeline as listed in the following script:

```sql
-- 1
DROP TRIGGER IF EXISTS set_artist_sex;
-- 2
CREATE TRIGGER set_artist_sex
  BEFORE INSERT ON vrg.ARTIST
    FOR EACH ROW 
      SET NEW.sex='male';
-- Test the trigger 
-- 3
DELETE FROM vrg.artist WHERE artistid = 20;
-- 4
INSERT INTO vrg.artist 
  (ArtistID, lastname, firstname) 
VALUES
  (20,'yourlastname','yourfirstname')
;
-- 5
SELECT * FROM vrg.artist WHERE artistid = 20;
```


[25.2.2.2 - set_trans_DateAcquired](https://www.youtube.com/watch?v=YSNW4JeCwEc&feature=emb_imp_woyt)

Create a BEFORE INSERT trigger on vrg.TRANS table. For each insert, the trigger set DateAcquired to the current date.

```sql
select trigger_schema, trigger_name, action_statement
from information_schema.triggers
where trigger_schema like 'vrg'
```

[25.2.2.3 - set_trans_askingPrice](https://www.youtube.com/watch?v=G54Cg4K4b4c)

In the trans table, there are two columns: AcquisitionPrice and AskingPrice. AcquisitionPrice is required with the NOT NULL constraint. AskingPrice is optional with NULL constraint.

Write a BEFORE trigger for INSERT events, set_trans_askingPrice, which sets AskingPrice to equal to one of the following values:

- twice the AcquisitionPrice (The expression is NEW.AcquisitionPrice * 2.)
- the AcquisitioPrice plus the average net gain in the past.

```sql
-- Set NEW.AskingPrice to NEW.AcquisitionPrice * 2
DROP TRIGGER IF EXISTS set_trans_askingPrice;

CREATE TRIGGER set_trans_askingPrice
  BEFORE INSERT ON trans
    FOR EACH ROW 
      SET NEW.AskingPrice = NEW.AcquisitionPrice * 2;
```


[25.2.3 - set_trans_date](https://www.youtube.com/watch?v=tpNqZ-6vJk0)



[25.2.3 - Multiple Statements ](https://cisjw.sitehost.iu.edu/dbsguide/sql-trigger.html#multiple-statements)

We can combine the previous two triggers in a single one. To take multiple actions in a trigger, we need to redefine statement delimiter and use BEGIN END syntax.

```aql
-- pipeline 
-- drop the two previous triggers
drop trigger set_trans_askingprice;
drop trigger set_trans_dateacquired;

-- redefine statement delimiter so that 
-- we can use the ; statement delimiter within the trigger body 
delimiter //
-- define trigger
-- use BEGIN...END block
CREATE TRIGGER set_trans_dateacquired_askingPrice
  BEFORE INSERT ON trans
    FOR EACH ROW 
    BEGIN
            SET NEW.dateAcquired = NOW();
        SET NEW.AskingPrice = NEW.AcquisitionPrice * 2;
      END //
delimiter ;

-- TEST 
-- delete trans record
DELETE FROM trans WHERE TransactionID = 300;
-- insert new
INSERT INTO `vrg`.`trans`
(`TransactionID`,
`AcquisitionPrice`,
`WorkID`)
VALUES (300, 250, 596);
-- list the record
SELECT * FROM trans WHERE TransactionID = 300;
```

**25.2.4 - Conditional Trigger**

The previous trigger set_artist_sex sets sex to male for every artist regardless. The action does not seem soundable. The following version performs a test and choose one action.

The trigger has multiple statements and they must be enclosed in a BEGIN END block. The test requires conditional structure. In MySQL, we have both IF-THEN-ELSEIF-ELSE-ENDIF statement and ternary function/expression.

**25.2.4.1 - IF Statement**

```sql
-- IF statement
IF test_1 THEN action_set_1
    [ELSEIF test_2 THEN action_set_2] ...
    [ELSE action_set_3]
END IF
```

**25.2.4.2 - Ternary expression**

IF function takes three arguments and returns a value; value_1 if test is TRUE and value_2 otherwise.

```sql
IF(test, value_1, value_2)
```

**25.2.4.3 - The pipeline**

```sql
-- Set sex to male if sex value is not given in INSERT
DROP TRIGGER IF EXISTS set_artist_sex;
--
delimiter //
--
CREATE TRIGGER set_artist_sex
BEFORE INSERT ON vrg.ARTIST
FOR EACH ROW 
BEGIN
    SET @sex = IF(NEW.sex IS NOT NULL, NEW.sex, 'male');
    SET NEW.sex = @sex;
END //
--
delimiter ;
```

**TEST 1 - INSERT INTO - w/out sex value**

```sql
-- TEST 1 `INSERT INTO` without sex value
--
DELETE FROM artist WHERE artistid=20;
-- insert no sex value
INSERT INTO artist 
  (ArtistID, lastname, firstname) 
VALUES
  (20,'yourlastname','yourfirstname')
;
--
SELECT * FROM artist WHERE artistid=20;
```

**TEST 2 - INSERT INTO - w/out sex value**

```sql
-- TEST 2 `INSERT INTO` with sex being `female`
--
DELETE FROM artist WHERE artistid=20;
-- insert with sex value
INSERT INTO artist 
  (ArtistID, lastname, firstname, sex) 
VALUES
  (20,'yourlastname','yourfirstname', 'female')
;
--
SELECT * FROM artist WHERE artistid=20;
```

**25.3 - Submission**

Use the pipeline script as a reference. Edit and test a BEFORE INSERT trigger set_customer_country on vrg.CUSTOMER table. The trigger should do the following:

- If no country value is given in INSERT, the trigger should set NEW.country to USA.
- If the country value is given in INSERT, no action should be taken.

Submit the pipeline SQL script.