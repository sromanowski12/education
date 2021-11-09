## Exam 2
---

P7

Ch. 3 - 6

7.0.1 - Define (briefly describe) the following terms or processes,

**Referencial Intregrity Constraint**
A statement that limits the values of the foreign key.
- This constraint stipulates that every value of *a* in A must match a value of *a* in B
Ex. SKU in ORDER_ITEM must exist in SKU in SKU_DATA

Ex. SKU in ORDER_ITEM must exist in SKU in SKU_DATA

**Database Normalization**
The process of structuring a database, usually in a relationship database, in accordance with a series of so-called normal forms in order to reduce data redundancy  and improve data integrity.
  


**BCNF (Boyce-Codd Normal Form)**
It is well known from relation database theory that,

R(A,B,C) is in 3NF but it is not in BCNF. As a result, instance of R(A,B,C) have redundancies, but decomposition the schema into BCNF leads to two schemas R_1(A,C) and R_2(B,C) which are free of redundancy but dot not preserve dependency (A, B) --> C

The main task in relational schema normalization is producing such a set of schemas that posses the required form, usually 3NF or BCNF. The normalization process consists in decomposition of a given input schema.

A schema in BCNF if only the first condition of the two above is allowed

1NF, 2NF, 3NF, BCNF, 4NF

**Database Denormalization**
The joining of the data in normalized tables prior to storing the data
- The data is then stored in nonnormalized tables


7.0.2 - Test FD in SQL
In cape_codd.order_item table, can SKU column determine quantity and price?

If the FD is valid n the cape_codd.order_item table, then if two inventory items have the same value for SKU column, they must have the same value for quantity and price.
- To test the validity of the determinant SKU, aggregate the data by SKU and count per group, distinct values over quantity and price.
- If there is no count more than 1, the FD is valid

7.0.3 - (Submit the recording) Normalize the cape_codd.sku_data table to BCNF. Follow the video and do the normalization.

7.0.4 - (Submit SQL statement) Write a SQL JOIN statement which denormalizes the three tables and join the order-relevant data from the following three tables.

7.0.5 - (Submit a paragraph which describes the whole process in the video. Identifying relationship type between FLIGHT and PASSENGER and tranforming the many-to-many relationship to relational mode in BCNF.)
