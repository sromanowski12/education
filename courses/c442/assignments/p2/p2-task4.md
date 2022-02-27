

2.5.3.1: CREATE TABLE airports
```sql
CREATE TABLE airports (
faa TEXT PRIMARY KEY,
name TEXT NOT NULL,
tzone TEXT NOT NULL
)
;
```
2.5.3.2: DROP TABLE
```sql
DROP TABLE if exists table_name
;
```
2.5.3.3: INSERT INTO airports
```sql
INSERT INTO airports
(faa, name)
VALUES
("DFW", "Dallas Fort Worth Intl", "American/Chicago")
;
```
2.5.3.4: List records in airports table
```sql
SELECT * FROM airports
;
```
2.5.3.5: .import csv data to airports
.mode csv
.import airports.csv airports --skip 2
2.5.4: airlines table
2.5.4.1: CREATE TABLE airlines
```sql
CREATE TABLE airlines (
carrier TEXT PRIMARY KEY,
name TEXT NOT NULL
)
;
```
2.5.4.2: import csv data to airlines
.mode csv
.import airlines.csv airlines --skip 1
2.5.5: flights table
2.5.5.1: CREATE TABLE flights
```sql
CREATE TABLE flights (
id INTEGER primary key AUTOINCREEMNT,
origin TEXT not null,
destination TEXT not null,
duration INTEGER default null,
foreign key (origin) references airports (faa),
foreign key (destination) references airports (faa)
)
;
```
2.5.5.2: INSERT INTO flights
Here we can omit the id field in the values because the id column has been set to autoincrement. 
- Typically we set an integer primary key column to autoincrement if we want database system to manage the integer sequence.
```sql
INSERT INTO flights
(origin, destination, duration)
VALUES
("DFW", "ORD", 165)
;
```
2.5.5.3: .import csv data to flights
.mode csv
.import flights.csv flights --skip 1
2.5.6: Inspection
After completing the steps above, you have created the flight.db database and populated it as well.
- Now we need to inspect flight.db and check each table and the records inside as well
2.5.7: autoincrement sequence
2.5.7.1: sqlite_sequence
```sql
select * from sqlite_sequence
;
```
2.5.7.2: Reset a sequence
We can reset a sequence to a specific integer. For example, to set the sequence in flights table to zero,

2.6: Task 4 - Round 2
Before starting the second round, we must frop flight.db which we created in Round 1. To drop a SQLite3 database,
- Remove the file in a command line w/ rm command
- Delete the filw in Windows explorer
For example,
rm flight.db

**Complete sqlite3 Commands - flight.db**
sqlite3 flight.db
CREATE TABLE airports (
    faa text primary key,
    name text not null,
    tzone text not null
)
;
.mode csv
.import airports.csv airports --skip 1
select * from airports
;
CREATE TABLE airlines (
    carrier text primary key,
    name text not null
)
;
.import airlines.csv airlines --skip 1
select * from airlines
;
CREATE TABLE flights (
    id integer primary key autoincrement,
    origin text not null,
    destination text not null,
    duration integer not null,
    foreign key (origin) references airports(faa),
    foreign key (destination) references airports(faa)
)
;
.import flights.csv flights --skip 1
.mode markdown
select * from flights
.table
.exit