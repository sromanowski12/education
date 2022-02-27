
Referencial Intregrity Constraint
A statement that limits the values of the foreign key.
- This constraint stipulates that every value of *a* in A must match a value of *a* in B
Ex. SKU in ORDER_ITEM must exist in SKU in SKU_DATA

Database Normalization
The process of structuring a database, usually in a relationship database, in accordance with a series of so-called normal forms in order to reduce data redundancy  and improve data integrity.

Database Denormalization
The joining of the data in normalized tables prior to storing the data
- The data is then stored in nonnormalized tables

BCNF (Boyce-Codd Normal Form)
It is well known from relation database theory that,

R(A,B,C) is in 3NF but it is not in BCNF. As a result, instance of R(A,B,C) have redundancies, but decomposition the schema into BCNF leads to two schemas R_1(A,C) and R_2(B,C) which are free of redundancy but dot not preserve dependency (A, B) --> C

The main task in relational schema normalization is producing such a set of schemas that posses the required form, usually 3NF or BCNF. The normalization process consists in decomposition of a given input schema.

A schema in BCNF if only the first condition of the two above is allowed