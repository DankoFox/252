## DATABASE MANAGEMENT SYSTEMS

<!-- image -->

## AN OVERVIEW OF DBMS

Trong Nhan Phan, PhD

<!-- image -->

## DATABASE SYSTEMS REMARKS

- n Key concepts
- n Database design process
- n DBMS
- n SQL
- n Relational algebra

<!-- image -->

## KEY CONCEPTS

1. Data
2. Information
3. Metadata
4. Database (DB)
5. Database Management System( DBMS)
6. Database System (DBS)
7. Data Model
1. Database Schema
2. Database State
3. Relation
4. Relation Cardinality
5. Relation Degree
6. Database Normalization
7. Primary key, candidate key, superkey, foreign k e y ,   p a r t i a l   k e y , surrogate key

<!-- image -->

<!-- image -->

<!-- image -->

PropertyForRent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo)

PrivateOwner (ownerNo, fName, IName, address, telNo)

Client (clientNo, fName, IName, address, telNo, prefType, maxRent)

Lease (leaseNo, propertyNo, clientNo, paymentMethod, deposit, paid, rentStart, rentF nish)

<!-- image -->

## WHAT IS A DBMS?

- n D ata B ase M anagement S ystem (DBMS): a general-purpose software system that facilitates t h e   p r o c e s s e s   o f   d e f i n i n g ,   c o n s t r u c t i n g , manipulating, and sharing databases among various users and applications (or a software system that enables users to define, create, maintain, and control access to the database)
- n A DBMS is a powerful tool for creating and managing large amount of data efficiently and allowing it to persist over long periods of time safely.

<!-- image -->

## DBMS CAPABILITIES

The capabilities that a DBMS provides the user are:

- n Persistent Storage . A DBMS supports the storage of very large amounts of data that exists independently of any processes that are using the data.
- n Programming Interface . A DBMS allows the user to access and modify data through a powerful query language.
- n Transaction management . A DBMS supports concurrent access to data, i.e., simultaneously access by many distinct processes (called transaction) at once. To avoid some of the undesirable consequences of simultaneous access, the DBMS supports:
- q isolation
- q atomicity
- q resiliency
- n And much more!

<!-- image -->

## HISTORY OF DATABASE SYSTEMS AND DBMS

<!-- image -->

1980s: ObjectOriented, Distributed DBMS

1990s: Objectrelational model) ORDBMS, OLAP, data mining, data warehouse, multimedia DB

2000s: XML DB, bioinformati on, data stream, sensor network, NoSQL

<!-- image -->

1960s: Flat-File, Hierarch ical, Network Databas es.

1970s: Relational DBMS - RDBMS)

## EXAMPLE OF NETWORK MODEL SCHEMA

<!-- image -->

<!-- image -->

## EXAMPLE OF RELATIONAL MODEL SCHEMA

Figure 1.2 A database thatstores student and course information.

## COURSE

| Course_name               | Course_number   |   Credit_hours | Department   |
|---------------------------|-----------------|----------------|--------------|
| Intro to Computer Science | CS1310          |              4 | CS           |
| Data Structures           | CS3320          |              4 | CS           |
| Discrete Mathematics      | MATH2410        |              3 | MATH         |
| Database                  | CS3380          |              3 | SO           |

## SECTION

|   Section_identifier | Course_number   | Semester   |   Year | Instructor   |
|----------------------|-----------------|------------|--------|--------------|
|                   85 | MATH2410        | Fall       |     04 | King         |
|                   92 | CS1310          | Fall       |     04 | Anderson     |
|                  102 | CS3320          | Spring     |     05 | Knuth        |
|                  112 | MATH2410        | Fall       |     05 | Chang        |
|                  119 | CS1310          | Fall       |     05 | Anderson     |
|                  135 | CS3380          | Fall       |     05 | Stone        |

## GRADE\_REPORT

|   Student_number |   Section_identifier | Grade   |
|------------------|----------------------|---------|
|               17 |                  112 | B       |
|               17 |                  119 | C       |
|                8 |                   85 | A       |
|                8 |                   92 | A       |
|                8 |                  102 | B       |
|                8 |                  135 | A       |

## PREREQUISITE

| Course_number   | Prerequisite_number   |
|-----------------|-----------------------|
| CS3380          | CS3320                |
| CS3380          | MATH2410              |
| CS3320          | CS1310                |

<!-- image -->

## DATABASE APPROACH CHARACTERISTICS

- n Self-describing nature of a database system
- n Insulation between programs and data, and data abstraction
- q
- Program-data independence + Program-operation independence = Data abstraction
- q A data model is a type of data abstraction
- n Support of multiple views of the data
- n Sharing of data and multi-user transaction processing
- n Restricting redundancy, unauthorized access
- n Support efficient query processing, backup and recovery, multiple user interfaces, integrity constraints
- n Other advantages of using the DBMS approach: see [1]1.6

## DATABASE CONSTRAINTS

- n Key constraint
- n Entity integrity constraint
- n Reference integrity constraint
- n Semantic constraint

<!-- image -->

## THE DATABASE SYSTEM ENVIRONMENT (1/2)

- n DBMS component modules
- q Buffer management
- q Stored data manager
- q DDL compiler
- q Interactive query interface
- Query compiler
- Query optimizer
- q Precompiler

<!-- image -->

## THE DATABASE SYSTEM ENVIRONMENT (2/2)

- n DBMS component modules
- q Runtime database processor
- q System catalog
- q Concurrency control system
- q Backup and recovery system

<!-- image -->

<!-- image -->

Figure 2.3 Component modules of a DBMS and their interactions.

<!-- image -->

## QUERY LANGUAGE

- n Data Definition Language (DDL)
- q Permits specification of data types, structures and any data constraints to be stored in the database
- q All specifications are stored in the database
- n Data Manipulation Language (DML).
- q Query language: retrieve (query), update (insert, delete, modify)
- n Data Control Language (DCL)
- q Used to control access to data in a database (Commit, Rollback, Grant, Revoke)

## ROLES IN THE DATABASE ENVIRONMENT

- n Database Administrator (DBA), responsible for
- q authorizing access to DB
- q coordinating &amp; monitoring its use
- q acquiring software and hardware resources
- q security breach, poor response time
- n Database Designers, responsible for:
- q identifying the data to be stored in DB
- q choosing appropriate structures to represent and store this data
- n Application Programmers
- n End Users
- n More details: see [1]-chapter 1

## (RELATIONAL) DBMSs IN PRACTICE

- n MySQL
- n Oracle
- n MS SQL Server
- n IBM DB2
- n PostgreSQL

n

…

<!-- image -->

<!-- image -->

## ORACL E ?

<!-- image -->

<!-- image -->

<!-- image -->

## DISCUSSION

## WHAT'S MORE?

<!-- image -->

<!-- image -->

<!-- image -->

## MICROSOFT SQL SERVER ARCHITECTURE

<!-- image -->

https://learn.microsoft.com/en-us/answers/questions/279400/looking-for-sql-server-2019-architecture-diagram

## POSTGRESQL ARCHITECTURE

<!-- image -->

Krishnamurthy, Sailesh &amp; Chandrasekaran, Sirish &amp; Cooper, Owen &amp; Deshpande, Amol &amp; Franklin, Michael &amp; Hellerstein, Joseph &amp; Hong, Wei &amp; Madden, Samuel &amp; Reiss, Frederick &amp; Shah, Mehul. (2003). TelegraphCQ: An Architectural Status Report. IEEE Data Eng. Bull.. 26. 11-18.

## MYSQL ARCHITECTURE

<!-- image -->

https://www.geeksforgeeks.org/mysql/architecture-of-mysql/

## MONGODB

https://www.quickprogrammingtips.com/mongodb/mongodb-history.html

<!-- image -->

<!-- image -->

Composite indexes speed query performance Native Label index

<!-- image -->

Query depth optimizatio n for DISTINCT New JavaScript framework

He, Z., Yu, J., &amp; Guo, B. (2022). Execution Time Prediction for Cypher Queries in the Neo4j Database Using a Learning Approach. Symmetry, 14(1), 55. https://doi.org/10.3390/sym14010055; https://neo4j.com/blog/news/neo4j-3-2-ga-release/

<!-- image -->

## DISCUSSION

<!-- image -->

## TOP DBMSs TODAY?

<!-- image -->

<!-- image -->

## SQL

- n SQL review
- n Relational Algebra

<!-- image -->

## COMPANY Relational Database Schema

<!-- image -->

<!-- image -->

## REFERENCES

1. R. Elmasri &amp; S.B. Navathe, AddisonWesley, Fundamentals of Database Systems, 7th Edition, 2016.
2. H. G. Molina, J. D. Ullman, J. Widom, Database System Implementation, Prentice-Hall, 2000.
3. A. Silberschatz, H.F. Korth &amp; S. Sudarshan, Database Systems Concepts, 6th Edition, McGraw-Hill, 2006.
4. H.G. Molina, J.D. Ullman &amp; J. Widom, Database Systems - The Complete Book, PrenticeHall, 2002.
5. T. Connolly &amp; C. Begg, Database Systems - A Practical Approach to Design, Implementation, and Management, 6 th  Edition, Addison-Wesley, 2015.

<!-- image -->

## QUESTIONS AND ANSWERS

<!-- image -->

Picture from: http://philadelphiasculpturegym.blogspot.com/2013/09/save-date-free-talk-and-q-on-affordable.html