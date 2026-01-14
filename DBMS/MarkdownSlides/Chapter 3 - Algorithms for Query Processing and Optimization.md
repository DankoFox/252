## Chapter 3

Algorithms for Query Processing and Optimization

## Chapter Outline

1. Introduction to Query Processing
2. Translating SQL Queries into Relational Algebra
3. Algorithms for External Sorting
4. Algorithms for SELECT and JOIN Operations
5. Algorithms for PROJECT and SET Operations
6. Implementing Aggregate Operations and Outer Joins
7. Combining Operations using Pipelining
8. Using Heuristics in Query Optimization
9. Using Selectivity and Cost Estimates in Query Optimization
10. Overview of Query Optimization in Oracle
11. Semantic Query Optimization

## 1. Introduction to Query Processing

- ◼ Query optimization : the process of choosing a suitable execution strategy for processing a query.
- ◼ Two internal representations of a query
- ❑ -Query Tree
- ❑ -Query Graph

<!-- image -->

## Code can be:

Executed directly (interpreted mode) Stored and executed later whenever needed (compiled mode)

Typical steps when processing a highlevel query

2. Translating SQL Queries into Relational Algebra (1)
2. ◼ Query block: the basic unit that can be translated into the algebraic operators and optimized.
3. ◼ A query block contains a single SELECT-FROMWHERE expression, as well as GROUP BY and HAVING clause if these are part of the block.
4. ◼ Nested queries within a query are identified as separate query blocks.
5. ◼ Aggregate operators in SQL must be included in the extended algebra.

## Translating SQL Queries into Relational Algebra (2)

<!-- image -->

6

## 3. Algorithms for External Sorting (1)

- ◼ External sorting : refers to sorting algorithms that are suitable for large files of records stored on disk that do not fit entirely in main memory, such as most database files.
- ◼ Sort-Merge strategy :  starts by sorting small subfiles ( runs ) of the main file and then merges the sorted runs, creating larger sorted subfiles that are merged in turn.
- -Sorting phase: n R =  (b/n B )  -Merging phase: d M = Min(n B -1, n R ); n P =  (log dM (n R ) ) 

n R : number of initial runs; b: number of file blocks; n B : available buffer space; d M : degree of merging; n P : number of passes.

## Algorithms for External Sorting (2)

```
set i  1, j  b; /* size of the file in blocks  */ k  n B ; /* size of buffer in blocks */ m  (j/k)  ; /*number of runs */ {Sort phase} while (i<= m) do { read next k blocks of the file into the buffer or if there are less than k blocks remaining, then read in the remaining blocks; sort the records in the buffer and write as a temporary subfile; i  i+1; }
```

```
/*Merge phase: merge subfiles until only 1 remains */ set i  1; p  log k-1m  ;   /* p is the number of passes for the merging phase */ j  m; /* the number of runs */ while (i<= p) do { n  1; q  (j/(k-1)  ; /* the number of runs to write in this pass */ while ( n <= q) do { read next k-1 subfiles or remaining subfiles (from previous pass) one block at a time merge and write as new subfile one block at a time ; n  n+1; } j  q; i  i+1; }
```

## EXAMPLE

- ◼ Memory buffers n B = 5 disk blocks
- ◼ The size of the file b = 1,024 disk blocks
- ◼ Initial runs nR = ⎡ ( b / nB ) ⎤ = 205 initial runs (each of size 5 blocks, except the last run)
- ◼ d M = Min(n B -1, n R ) = 4
- ❑ Pass 1: 205 → 52
- ❑ Pass 2: 52 → 13
- ❑ Pass 3: 13 → 4
- ❑ Pass 4: 4 → 1

## Example of External Sorting (1)

```
1 block = 2 records
```

15 22 2 27 14 6 51 18 35 16 50 36 9 8 32 12 11 33 30 30 23 21 24 29

```
buffer = 3 blocks = 6 records
```

## Sort phase:

Read 3 blocks of the file → sort.

→

run: 3 blocks

## Example of External Sorting (2)

## Sort phase:

<!-- image -->

## Example of External Sorting (3)

## Sort phase

15 22 2 27 14 6 51 18 35 16 50 36 9 8 32 12 11 33 30 30 23 21 24 29

<!-- image -->

<!-- image -->

## Example of External Sorting (4)

| 2 6   | 14 15 22 27   | 16 18 35 36 50 51 8 9 11   | 12 32 33   | 20 21   | 23 24   | 29   | 30   |
|-------|---------------|----------------------------|------------|---------|---------|------|------|

## Merge phase:

## Each step:

- Read 1 block from (n B - 1) runs to buffer
- Merge → temp block
- If temp block full: write to file
- If any empty block: Read next block from corresponding run

<!-- image -->

## Example of External Sorting (5)

## Merge phase: Pass 1

<!-- image -->

## Example of External Sorting (6)

## Merge phase: Pass 1

<!-- image -->

## Example of External Sorting (7)

## Merge phase: Pass 1

<!-- image -->

2

6

14 15

## Example of External Sorting (8)

## Merge phase: Pass 1

<!-- image -->

2

6

14 15 16 18

## Example of External Sorting (9)

## Merge phase: Pass 1

| 2   | 6 14 15 22 27 16   | 18 35 36 50 51 8   | 9 11 12 32 33   | 20 21   | 23 24   | 29 30   |
|-----|--------------------|--------------------|-----------------|---------|---------|---------|

Not have any block=&gt; remove this run from this merge step =&gt; write remain blocks of the others run to file.

<!-- image -->

<!-- image -->

## Example of External Sorting (10)

## Merge phase: Pass 1

| 2   | 6 14 15 22 27   | 16 18 35   | 36 50 51 8 9 11 12 32   | 33 20 21   | 23 24   | 29   | 30   |
|-----|-----------------|------------|-------------------------|------------|---------|------|------|

<!-- image -->

## Example of External Sorting (11)

## Merge phase: Pass 2

<!-- image -->

## Example of External Sorting (12)

## Merge phase: Pass 2

<!-- image -->

2

6

## Example of External Sorting (13)

## Result:

```
2 6 8 9 11 12 14 15 16 18 21 22 23 24 27 29 30 30 32 33 35 36 50 51
```

## 4. Algorithms for SELECT and JOIN

## Operations (1)

## Implementing the SELECT Operation:

## Examples:

- ◼ (OP1):  σ SSN='123456789'(EMPLOYEE)
- ◼ (OP2):  σ DNUMBER&gt;5(DEPARTMENT)
- ◼ (OP3):  σ DNO=5(EMPLOYEE)
- ◼ (OP4):  σ DNO=5 AND SALARY&gt;30000 AND SEX=F(EMPLOYEE)
- ◼ (OP5):  σ ESSN='123456789' AND PNO=10(WORKS\_ON)

## Algorithms for SELECT and JOIN (2)

## Implementing the SELECT Operation (cont.):

## Search Methods for Simple Selection:

- ◼ S1. Linear search (brute force): Retrieve every record in the file, and test whether its attribute values satisfy the selection condition.
- ◼ S2. Binary search : If the selection condition involves an equality comparison on a key attribute on which the file is ordered, binary search (which is more efficient than linear search) can be used. (See OP1).
- ◼ S3. Using a primary index or hash key to retrieve a single record: If the selection condition involves an equality comparison on a key attribute with a primary index (or a hash key), use the primary index (or the hash key) to retrieve the record.

## Algorithms for SELECT and JOIN

## Operations (3)

## Implementing the SELECT Operation (cont.):

## Search Methods for Simple Selection:

- ◼ S4. Using a primary index to retrieve multiple records: If the comparison condition is &gt;, ≥ , &lt;, or  ≤ on a key field with a primary index, use the index to find the record satisfying the corresponding equality condition, then retrieve all subsequent records in the (ordered) file.
- ◼ S5. Using a clustering index to retrieve multiple records: If the selection condition involves an equality comparison on a non-key attribute with a clustering index, use the clustering index to retrieve all the records satisfying the selection condition.

## Algorithms for SELECT and JOIN Operations (4)

## Implementing the SELECT Operation (cont.):

Search Methods for Simple Selection:

- ◼ S6. Using a secondary (B+-tree) index : On an equality comparison, this search method can be used to retrieve a single record if the indexing field has unique values (is a key) or to retrieve multiple records if the indexing field is not a key. In addition, it can be used to retrieve records on conditions involving &gt;,&gt;=, &lt;, or &lt;=. (FOR RANGE QUERIES )

## Algorithms for SELECT and JOIN (5)

## Implementing the SELECT Operation (cont.):

Search Methods for Complex Selection:

- ◼ S7. Conjunctive (AND) selection : If an attribute involved in any single simple condition in the conjunctive condition has an access path that permits the use of one of the methods S2 to S6, use that condition to retrieve the records and then check whether each retrieved record satisfies the remaining simple conditions in the conjunctive condition.
- ◼ S8. Conjunctive selection using a composite index : If two or more attributes are involved in equality conditions in the conjunctive condition and a composite index (or hash structure) exists on the combined field, we can use the index directly.

## Algorithms for SELECT and JOIN (6)

## Implementing the SELECT Operation (cont.):

Search Methods for Complex Selection:

- ◼ S9. Conjunctive selection by intersection of record pointers : This method is possible if:
- ❑ secondary indexes are available on all (or some of) the fields involved in equality comparison conditions in the conjunctive condition and
- ❑ the indexes include record pointers (rather than block pointers).
- ◼ Each index can be used to retrieve the set of record pointers that satisfy the individual condition.
- ◼ The intersection of these sets of record pointers: record pointers that satisfy the conjunctive condition, which are then used to retrieve those records directly.
- ◼ If only some of the conditions have secondary indexes, each retrieved record is further tested to determine whether it satisfies the remaining conditions.

## Algorithms for SELECT and JOIN

## Operations (7)

## Implementing the SELECT Operation (cont.):

- ◼ Whenever a single condition specifies the selection, we can only check whether an access path exists on the attribute involved in that condition. If an access path exists, the method corresponding to that access path is used; otherwise, the 'brute force' linear search approach of method S1 is used. (See OP1, OP2 and OP3)
- ◼ For conjunctive selection conditions , whenever more than one of the attributes involved in the conditions have an access path, query optimization should be done to choose the access path that retrieves the fewest records in the most efficient way.
- ◼ Disjunctive (OR) selection conditions

## Algorithms for SELECT and JOIN Operations (8)

## Implementing the JOIN Operation:

- ◼ Join (EQUIJOIN, NATURAL JOIN)
- ◼ Examples

- two-way join: a join on two files

$$e.g. R $$

- A=B S

- multi-way joins: joins involving more than two files.

$$e.g. R  A=B S  C=D T$$

(OP6): EMPLOYEE

 DNO=DNUMBERDEPARTMENT

(OP7): DEPARTMENT  MGRSSN=SSNEMPLOYEE

## Algorithms for SELECT and JOIN

## Operations (9)

## Implementing the JOIN Operation (cont.):

## Methods for implementing joins:

- ◼ J1. Nested-loop join (brute force): For each record t in R (outer loop), retrieve every record s from S (inner loop) and test whether the two records satisfy the join condition t [ A ] = s [ B ].
- ◼ J2. Single-loop join (Using an access structure to retrieve the matching records): If an index (or hash key) exists for one of the two join attributes - say, B of S -retrieve each record t in R , one at a time, and then use the access structure to retrieve directly all matching records s from S that satisfy s [ B ] = t [ A ].

## Algorithms for SELECT and JOIN

## Operations (10)

## Implementing the JOIN Operation (cont.):

Methods for implementing joins:

- ◼ J3. Sort-merge join: If the records of R and S are physically sorted (ordered) by value of the join attributes A and B, respectively, we can implement the join in the most efficient way possible. Both files are scanned in order of the join attributes, matching the records that have the same values for A and B. In this method, the records of each file are scanned only once each for matching with the other file-unless both A and B are non-key attributes, in which case the method needs to be modified slightly.

## Algorithms for SELECT and JOIN Operations (12)

```
sort the tuples in R on attribute A;  /* assume R has n tuples  */ sort the tuples in S on attribute B;  /* assume S has m tuples  */ set i  1, j  1; while (i ≤ n) and (j ≤ m) do {  if R(i)[A] > S(j)[B] then set j  j + 1 elseif R(i)[A] < S(j)[B] then set i  i + 1 else { /* output a matched tuple  */ output the combined tupe <R(i), S(j)> to T; /* output other tuples that match R(i), if any */ set l  j + 1 ; while ( l ≤ m) and (R(i)[A] = S(l)[B]) do { output the combined tuple <R(i), S(l)> to T; set l  l + 1 } /* output other tuples that match S(j), if any */ set k  i+1 while ( k ≤ n) and (R(k)[A] = S(j)[B]) do { output the combined tuple <R(k), S(j)> to T; set k  k + 1 } set i  i+1, j  j+1; } }
```

<!-- image -->

Assume that A is a key of R. Initially, two pointers are used to point to the two tuples of the two relations that have the smallest values of the two joining attributes.

<!-- image -->

## R(i)[A] &gt; S(j)[B]

<!-- image -->

## R(i)[A] &lt; S(j)[B]

<!-- image -->

R(i)[A] = S(j)[B] → R(2), S(2)

<!-- image -->

R(i)[A] = S(j)[B] → R(2), S(3)

<!-- image -->

## R(i)[A] &lt; S(j)[B]

<!-- image -->

## R(i)[A] &lt; S(j)[B]

<!-- image -->

R(i)[A] = S(j)[B] → R(4), S(4)

<!-- image -->

## R(i)[A] &lt; S(j)[B]

<!-- image -->

R(i)[A] = S(j)[B] → R(5), S(5)

<!-- image -->

## R(i)[A] &lt; S(j)[B]

<!-- image -->

## R(i)[A] &gt; S(j)[B]

<!-- image -->

Implementing Sort-Merge Join (J3): T  R  A=B S

## Result:

| C   |   A |   B | D   |
|-----|-----|-----|-----|
|     |   6 |   6 |     |
|     |   6 |   6 |     |
|     |  10 |  10 |     |
|     |  17 |  17 |     |

R(2), S(2)

R(2), S(3)

R(4), S(4)

R(5), S(5)

## j &gt; m → end.

## Algorithms for SELECT and JOIN Operations (11)

## Implementing the JOIN Operation (cont.):

Methods for implementing joins:

- ◼ J4. Hash-join: The records of files R and S are both hashed to the same hash file, using the same hashing function on the join attributes A of R and B of S as hash keys. A single pass through the file with fewer records (say, R) hashes its records to the hash file buckets. A single pass through the other file (S) then hashes each of its records to the appropriate bucket, where the record is combined with all matching records from R.

## 5. Algorithms for PROJECT and SET

## Operations (1)

- ◼ Algorithm for PROJECT operations π &lt;attribute list&gt; (Figure 19.3b)
- (R)
- ◼ If &lt;attribute list&gt; has a key of relation R, extract all tuples from R with only the values for the attributes in &lt;attribute list&gt;.
- ◼ If &lt;attribute list&gt; does NOT include a key of relation R, duplicated tuples must be removed from the results.
- ◼ Methods to remove duplicate tuples:
- ◼ 1. Sorting
- ◼ 2. Hashing

## Implementing T  ∏ &lt;attribute list&gt; (R)

```
create a tuple t[<attribute list>] in T' for each tuple t in R; /* T' contains the projection result before duplicate elimination */ if <attribute list> includes a key of R then T  T' else  { sort the tuples in T'; set i  1, j  2; while i ≤ n do { output the tuple T'[i] to T; while T'[i] = T'[j] and j ≤ n do j  j+1; set i  j, j  i+1; } }
```

/* T contains the projection result after duplicate elimination */

Implementing T  ∏&lt;attribute list&gt; (R)

## Algorithms for PROJECT and SET Operations (2)

## Algorithm for SET operations

- ◼ Set operations : UNION, INTERSECTION, SET DIFFERENCE and CARTESIAN PRODUCT.
- ◼ CARTESIAN PRODUCT of relations R and S includes all possible combinations of  records from R and S. The attributes of the result include all attributes of R and S.
- ◼ Cost analysis of CARTESIAN PRODUCT If R has n records and j attributes and S has m records and k attributes, the result relation will have n*m records and j+k attributes.
- ◼ CARTESIAN PRODUCT operation is very expensive and should be avoided if possible.

## Algorithms for PROJECT and SET

## Operations (3)

- ◼ Algorithm for SET operations (Cont.)

## ◼ UNION

- ❑ 1. Sort the two relations on the same attributes.
- ❑ 2. Scan and merge both sorted files concurrently, whenever the same tuple exists in both relations, only one is kept in the merged results.

## ◼ INTERSECTION

- ❑ 1. Sort the two relations on the same attributes.
- ❑ 2. Scan and merge both sorted files concurrently, keep in the merged results only those tuples that appear in both relations.

## ◼ SET DIFFERENCE R-S

- ❑ 1. Sort the two relations on the same attributes.
- ❑ 2. Keep in the merged results only those tuples that appear in relation R but not in relation S.

## Union:  T  R  S

```
sort the tuples in R and S using the same unique sort attributes; set i  1, j  1; while (i ≤ n) and (j ≤ m) do { if R(i) > S(j) then {   output S(j) to T; set j  j+1 } else if R(i) < S(j) then {    output R(i) to T; set i  i+1 } else set j  j+1  /* R(i) = S(j), so we skip one of the duplicate tuples  */ } if (i ≤ n) then add tuples R(i) to R(n) to T; if (j ≤ m) then add tuples S(j) to S(m) to T;
```

## Intersection T  R  S

```
sort the tuples in R and S using the same unique sort attributes; set i  1, j  1; while (i ≤ n) and (j ≤ m) do { if R(i) > S(j) then set j  j+1 else if R(i) < S(j) then set i  i+1 else {  output R(i) to T;  /* R(i) = S(j), so we output the tuple  */ set  i  i+1, j  j+1 } }
```

## Difference T  R -S

```
sort the tuples in R and S using the same unique sort attributes; set i  1, j  1; while (i ≤ n) and (j ≤ m) do { if R(i) > S(j) then set j  j+1 else if R(i) < S(j) then {  output R(i) to T;  /* R(i) has no matching S(j), so output R(i)  */ set i  i+1 } else set  i  i+1, j  j+1 } if (i ≤ n) then add tuples R(i) to R(n) to T;
```

## 6. Implementing Aggregate Operations and Outer Joins (1)

## Implementing Aggregate Operations:

- ◼ Aggregate operators : MIN, MAX, SUM, COUNT and AVG
- ◼ Options to implement aggregate operators:
- ❑ Table Scan
- ❑ Index
- ◼ Example

## SELECT MAX(SALARY) FROM EMPLOYEE;

- ◼ If an (ascending) index on SALARY exists for the employee relation, then the optimizer could decide on traversing the index for the largest value, which would entail following the right most pointer in each index node from the root to a leaf.

## Implementing Aggregate Operations and Outer Joins (2)

- ◼ Implementing Aggregate Operations (cont.):
- ◼ SUM, COUNT and AVG
- ❑ 1.For a dense index (each record has one index entry): apply the associated computation to the values in the index.
- ❑ 2.For a non-dense index : actual number of records associated with each index entry must be accounted for
- ◼ With GROUP BY: the aggregate operator must be applied separately to each group of tuples.
- ❑ 1.Use sorting or hashing on the group attributes to partition the file into the appropriate groups;
- ❑ 2.Compute the aggregate function for the tuples in each group.
- ◼ What if we have Clustering index on the grouping attributes?

## Implementing Aggregate Operations and Outer Joins (3)

- ◼ Implementing Outer Join:
- ◼ Outer Join Operators : LEFT OUTER JOIN, RIGHT OUTER JOIN and FULL OUTER JOIN.
- ◼ The full outer join produces a result which is equivalent to the union of the results of the left and right outer joins.

◼ Example: SELECT FNAME, DNAME FROM ( EMPLOYEE LEFT OUTER JOIN DEPARTMENT ON DNO = DNUMBER);

- ◼ Note: The result of this query is a table of employee names and their associated departments.  It is similar to a regular join result, with the exception that if an employee does  not have an associated department, the employee's name will still appear in the resulting table, although the department name would be indicated as null.

## Implementing Aggregate Operations and Outer Joins (4)

- ◼ Implementing Outer Join (cont.):
- ◼ Modifying Join Algorithms:

Nested Loop or Sort-Merge joins can be modified to implement outer join. e.g., for left outer join, use the left relation as outer loop and construct result from every tuple in the left relation. If there is a match, the concatenated tuple is saved in  the result. However, if an outer tuple does not match, then the tuple is still included in the result but is padded with a null value(s).

## Implementing Aggregate Operations and Outer Joins (5)

- ◼ Implementing Outer Join (cont.):

Executing  a  combination of   relational algebra operators.

Implement the previous left outer join example

1.     {Compute the JOIN of the EMPLOYEE and DEPARTMENT tables}
2. TEMP1  FNAME,DNAME(EMPLOYEE  DNO=DNUMBER DEPARTMENT)
2.     {Find the EMPLOYEEs that do not appear in the JOIN}
4. TEMP2  FNAME (EMPLOYEE)  - FNAME (Temp1)
3.    {Pad each tuple in TEMP2 with a null DNAME field} TEMP2  TEMP2  x   'null'
4.    {UNION  the temporary tables to produce the LEFT OUTER JOIN result} RESULT  TEMP1  TEMP2

The cost of the outer join, as computed above,  would  include the cost of the associated steps (i.e., join, projections, set difference  and union).

## 7. Combining Operations using Pipelining (1)

## ◼ Motivation

- ❑ A query is mapped into a sequence of operations.
- ❑ Each execution of an operation produces a temporary result.
- ❑ Generating and saving temporary files on disk is time consuming and expensive.

## ◼ Alternative:

- ❑ Avoid constructing temporary results as much as possible.
- ❑ Pipeline the data through multiple operations - pass the result of a previous operator to the next without waiting to complete the previous operation.

## Combining Operations using Pipelining (2)

- ◼ Example: 2-way join, 2 selections on the input files and one final projection on the resulting file.
- ◼ Dynamic generation of code to allow for multiple operations to be pipelined.
- ◼ Results of a select operation are fed in a
- " Pipeline " to the join algorithm.
- ◼ Also known as stream-based processing .

## 8. Using Heuristics in Query Optimization(1)

## Process for heuristics optimization

- ◼ 1. The parser of a high-level query generates an initial internal representation ;
- ◼ 2. Apply heuristics rules to optimize the internal representation.
- ◼ 3. A query execution plan is generated to execute groups of operations based on the access paths available on the files involved in the query.
- ◼ The main heuristic is to apply first the operations that reduce the size of intermediate results.
- E.g., Apply  SELECT and PROJECT operations before applying the JOIN or other binary operations.

## Using Heuristics in Query Optimization (2)

- ◼ Query tree : a tree data structure that corresponds to a relational algebra expression. It represents the input relations of the query as leaf nodes of the tree, and represents the relational algebra operations as internal nodes .
- ◼ An execution of the query tree consists of executing an internal node operation whenever its operands are available and then replacing that internal node by the relation that results from executing the operation.
- ◼ Query graph : a graph data structure that corresponds to a relational calculus expression. It does not indicate an order on which operations to perform first. There is only a single graph corresponding to each query.

## Using Heuristics in Query Optimization (3)

## ◼ Example:

For every project located in 'Stafford', retrieve the project number, the controlling department number and the department manager's last name, address and birthdate.

## ◼ Relation algebra :

 PNUMBER, DNUM, LNAME, ADDRESS, BDATE (((σ PLOCATION='STAFFORD' (PROJECT))

```
  DNUM=DNUMBER (DEPARTMENT))  MGRSSN=SSN (EMPLOYEE))
```

## ◼ SQL query :

Q2: SELECT  P.NUMBER, P.DNUM,E.LNAME, E.ADDRESS, E.BDATE

FROM PROJECT AS P, DEPARTMENT AS D, EMPLOYEE AS E

WHERE  P.DNUM=D.DNUMBER AND D.MGRSSN=E.SSN AND P.PLOCATION='STAFFORD';

## Two query trees for the query Q2

<!-- image -->

<!-- image -->

## Query graph for Q2

<!-- image -->

## Using Heuristics in Query Optimization (6)

## Heuristic Optimization of Query Trees:

- ◼ The same query could correspond to many different relational algebra expressions - and hence many different query trees.
- ◼ The task of heuristic optimization of query trees is to find a final query tree that is efficient to execute.
- ◼ Example :

Q: SELECT LNAME

FROM EMPLOYEE, WORKS\_ON,PROJECT

WHERE  PNAME = 'AQUARIUS' AND PNMUBER=PNO

AND ESSN=SSN AND BDATE &gt; '1957-12-31';

## Step in converting a query during heuristic optimization.

Step 1: Initial (canonical) query tree for SQL query Q.

<!-- image -->

Step 2: Moving SELECT operations down the query tree.

<!-- image -->

## Step 3: Apply more restrictive SELECT operation first

<!-- image -->

Step 4: Replacing Cartesian Product and Select with Join operation.

<!-- image -->

## Step 5: Moving Project operations down the query tree

<!-- image -->

## Using Heuristics in Query Optimization (10)

## General Transformation Rules for Relational Algebra Operations:

- ◼ 1. Cascade of σ : A conjunctive selection condition can be broken up into a cascade (sequence) of individual selection operations:

<!-- formula-not-decoded -->

- ◼ 2.Commutativity of σ : The σ operation is commutative:

<!-- formula-not-decoded -->

- ◼ 3. Cascade of π : In a cascade (sequence) of  π operations, all but the last one can be ignored:

<!-- formula-not-decoded -->

- ◼ 4. Commuting σ with π : If the selection condition c involves only the attributes A1, ..., An in the projection list, the two operations can be commuted:

<!-- formula-not-decoded -->

## Using Heuristics in Query Optimization (11)

## General Transformation Rules for Relational Algebra Operations: (cont.):

- ◼ 5.Commutativity of  ( and  ): The  operation is commutative as the  operation: R  S = S  R;  R  S = S  R
- ◼ 6. Commuting σ with  (or  ): If all the attributes in the selection condition c involve only the attributes of one of the relations being joined - say, R - the two operations can be commuted as follows :

<!-- formula-not-decoded -->

- ◼ Alternatively, if the selection condition c can be written as  ( c1 and c2 ), where condition c1 involves only the attributes of R and condition c2 involves only the attributes of S , the operations commute as follows:

<!-- formula-not-decoded -->

## Using Heuristics in Query Optimization (12)

## General Transformation Rules for Relational Algebra Operations (cont.):

- ◼ 7. Commuting π with  (or  ): Suppose that the projection list is L = {A1, ..., An, B1, ..., Bm}, where A1, ..., An are attributes of R and B1, ..., Bm are attributes of S. If the join condition c involves only attributes in L , the two operations can be commuted as follows:

<!-- formula-not-decoded -->

- ◼ If the join condition c contains additional attributes not in L , these must be added to the projection list, and a final operation is needed.

## Using Heuristics in Query Optimization (13)

## General Transformation Rules for Relational Algebra Operations (cont.):

- ◼ 8. Commutativity of set operations: The set operations  and ∩ are commutative but - is not.
- ◼ 9. Associativity of  , x,  , and ∩ : These four operations are individually associative; that is, if q stands for any one of these four operations (throughout the expression), we have ( R q S ) q T = R q ( S q T )
- ◼ 10. Commuting  with set operations: The  operation commutes with  , ∩ , and -. If q stands for any one of these three operations, we have

<!-- formula-not-decoded -->

## Using Heuristics in Query Optimization (14)

## General Transformation Rules for Relational Algebra Operations (cont.):

- ◼ 11. The  π operation commutes with  .

<!-- formula-not-decoded -->

- ◼ 12. Converting a (σ,  ) sequence into  : If the condition c of a σ that follows a  corresponds to a join condition, convert the (σ,  ) sequence into a  as follows:

<!-- formula-not-decoded -->

- ◼ 13. Other transformations

## Using Heuristics in Query Optimization (15)

## Outline of a Heuristic Algebraic Optimization Algorithm

- ◼ 1. Using rule 1, break up any select operations with conjunctive conditions into a cascade of select operations.
- ◼ 2. Using rules 2, 4, 6, and 10 concerning the commutativity of select with other operations, move each select operation as far down the query tree as is permitted by the attributes involved in the select condition.
- ◼ 3. Using rule 9 concerning associativity of binary operations, rearrange the leaf nodes of the tree so that the leaf node relations with the most restrictive select operations are executed first in the query tree representation.
- ◼ 4.     Using Rule 12, combine a cartesian product operation with a subsequent select operation in the tree into a join operation.

## Using Heuristics in Query Optimization (16)

## Outline of a Heuristic Algebraic Optimization Algorithm (cont.)

- ◼ 5. Using rules 3, 4, 7, and 11 concerning the cascading of project and the commuting of project with other operations, break down and move lists of projection attributes down the tree as far as possible by creating new project operations as needed.
- ◼ 6. Identify subtrees that represent groups of operations that can be executed by a single algorithm.

## Using Heuristics in Query Optimization (17)

## Summary of Heuristics for Algebraic Optimization:

- ◼ 1.The main heuristic is to apply first the operations that reduce the size of intermediate results.
- ◼ 2. Perform select operations as early as possible to reduce the number of tuples and perform project operations as early as possible to reduce the number of attributes. (This is done by moving select and project operations as far down the tree as possible.)
- ◼ 3. The select and join operations that are most restrictive should be executed before other similar operations. (This is done by reordering the leaf nodes of the tree among themselves and adjusting the rest of the tree appropriately.)

## Using Heuristics in Query Optimization (17)

## Query Execution Plans

- ◼ An execution plan for a relational algebra query consists of a combination of the relational algebra query tree and information about the access methods  to be used for each relation as well as the methods to be used in computing the relational operators stored in the tree.
- ◼ Materialized evaluation: The result of an operation is stored as a temporary relation.
- ◼ Pipelined evaluation: as the result of an operator is produced, it is forwarded to the next operator in sequence.

9. Using Selectivity and Cost Estimates in Query Optimization (1)
2. ◼ Cost-based query optimization: Estimate and compare the costs of executing a query using different execution strategies and choose the strategy with the lowest cost estimate.
3. ◼ Issues
4. ❑ Cost function
5. ❑ Number of execution strategies to be considered

## Using Selectivity and Cost Estimates in Query Optimization (2)

## Cost Components for Query Execution

- ◼ 1. Access cost to secondary storage
- ◼ 2. Storage cost
- ◼ 3. Computation cost
- ◼ 4. Memory usage cost
- ◼ 5. Communication cost

Note: Different database systems may focus on different cost components.

## Using Selectivity and Cost Estimates in Query Optimization (3)

## Catalog Information Used in Cost Functions

- ◼ Information about the size of a file
- ❑ number of records (tuples) (r),
- ❑ record size (R),
- ❑ number of blocks (b)
- ❑ blocking factor (bfr)
- ◼ Information about indexes and indexing attributes of a file
- ❑ Number of levels (x) of each multilevel index
- ❑ Number of first-level index blocks (b I1 )
- ❑ Number of distinct values (d) of an attribute
- ❑ Selectivity (sl) of an attribute
- ❑ Selection cardinality (s) of an attribute. (s = sl * r)

## Using Selectivity and Cost Estimates in Query Optimization (4)

## Examples of Cost Functions for SELECT

- ◼ S1. Linear search (brute force) approach

<!-- formula-not-decoded -->

For an equality condition on a key, C S1b = (b/2) if the record is found; otherwise C S1a = b.

- ◼ S2. Binary search :

<!-- formula-not-decoded -->

<!-- formula-not-decoded -->

- ◼ S3. Using a primary index (S3a) or hash key (S3b) to retrieve a single record

CS3a = x + 1;  C S3b = 1 for static or linear hashing;

CS3b = 2 for extendible hashing;

## Using Selectivity and Cost Estimates in Query Optimization (5)

## Examples of Cost Functions for SELECT (cont.)

- ◼ S4. Using an ordering index to retrieve multiple records:

For the comparison condition on a key field with an ordering index, CS4 = x + (b/2)

- ◼ S5. Using a clustering index to retrieve multiple records for an equality condition :

<!-- formula-not-decoded -->

- ◼ S6. Using a secondary (B + -tree) index:

For an equality comparison, C S6a = x + s (option 1 &amp; 2); CS6a = x + s + 1 (option 3);

For a comparison condition such as &gt;, &lt;, &gt;=, or &lt;=,

<!-- formula-not-decoded -->

## Using Selectivity and Cost Estimates in Query Optimization (6)

## Examples of Cost Functions for SELECT (cont.)

## ◼ S7. Conjunctive selection:

Use either S1 or one of the methods S2 to S6 to solve.

For the latter case, use one condition to retrieve the records and then check in the memory buffer whether each retrieved record satisfies the remaining conditions in the conjunction.

## ◼ S8. Conjunctive selection using a composite index :

Same as S3a, S5 or S6a, depending on the type of index.

## Example

- ◼ r E = 10,000 , b E = 2000 , bfr E = 5

## ◼ Access paths:

- ❑ 1. A clustering index on SALARY, with levels x SALARY = 3 and average selection cardinality S SALARY = 20.
- ❑ 2. A secondary index on the key attribute SSN, with x SSN = 4 (S SSN = 1).
- ❑ 3. A secondary index on the nonkey attribute DNO, with x DNO = 2 and first-level index blocks b I1DNO = 4. There are d DNO = 125 distinct values for DNO, so the selection cardinality of DNO is SDNO = (r/d DNO ) = 80.
- ❑ 4. A secondary index on SEX, with x SEX = 1. There are d SEX = 2 values for the sex attribute, so the average selection cardinality is SSEX = (r/d SEX ) = 5000.

## Example

- ◼ (op1): σ SSN='123456789' (EMPLOYEE)
- ❑ CS1b = 1000
- ❑ CS6a = x SSN + 1 = 4+1 = 5
- ◼ (op2): σ DNO&gt;5 (EMPLOYEE)
- ❑ CS1a = 2000
- ❑ CS6b = x DNO + (b l1DNO /2) + (r/2) = 2 + 4/2 + 10000/2 = 5004

## Example

- ◼ (op3): σ DNO=5 (EMPLOYEE)
- ❑ CS1a = 2000
- ❑ CS6a = x DNO + s DNO = 2 + 80 = 82
- ◼ (op4): σ DNO=5 AND SALARY&gt;30000 AND SEX='F' (EMPLOYEE)
- ❑
- ❑ = x + (b/2) = 3 + 2000/2 = 1003
- ❑ CS6a-SEX = x SEX + s SEX

<!-- formula-not-decoded -->

- ❑ =&gt; chose DNO=5 first and check the other conditions

## Using Selectivity and Cost Estimates in Query Optimization (7)

## Examples of Cost Functions for JOIN

- ◼ Join selectivity (js)

<!-- formula-not-decoded -->

If condition C does not exist, js = 1;

If no tuples from the relations satisfy condition C, js = 0;

Usually, 0 &lt;= js &lt;= 1 ;

## Size of the result file after join operation

<!-- formula-not-decoded -->

## Using Selectivity and Cost Estimates in Query Optimization (8)

## Examples of Cost Functions for JOIN (cont.)

- ◼ J1. Nested-loop join:

CJ1 = b R + (b R *b S ) + ((js* |R|* |S|)/bfr RS ) (Use R for outer loop)

- ◼ J2. Single-loop join (using an access structure to retrieve the matching record(s))

If  an index exists for the join attribute B of S with index levels x B , we can retrieve each record s in R t from S that satisfy t[B] = s[A].

and then use the index to retrieve all the matching records The cost depends on the type of index.

## Using Selectivity and Cost Estimates in Query Optimization (9)

## Examples of Cost Functions for JOIN (cont.)

- ◼ J2. Single-loop join (cont.)

<!-- formula-not-decoded -->

h: the average number of block accesses to retrieve a record, given its hash key value, h&gt;=1

- ◼ J3. Sort-merge join:

<!-- formula-not-decoded -->

## Example

- ◼ Suppose that we have the EMPLOYEE file described in the previous example
- ◼ Assume that the DEPARTMENT file of r D = 125 and b D = 13 , x DNUMBER = 1, secondary index on MGRSSN of DEPARTMENT, sMGRSSN = 1, x MGRSSN = 2, js OP6 = (1/IDEPARTMENTI ) = 1/125 , bfr ED = 4
- ◼ (op6): EMPLOYEE  DNO=DNUMBER DEPARTMENT
- ◼ (op7): DEPARTMENT  MGRSSN=SSNEMPLOYEE

Example DEPARTMENT:  r D = 125 and b D = 13 , x DNUMBER = 1, primary index on DNUMBER of DEPARTMENT, xDNUMBER = 1, js OP6 = (1/IDEPARTMENTI ) = 1/r D = 1/125 , bfr ED = 4 EMPLOYEE : r E = 10000, b E = 2000, secondary index on the nonkey attribute DNO, x DNO = 2, S DNO = 80).

- ◼ (op6): EMPLOYEE  DNO=DNUMBER DEPARTMENT
- ❑ Method J1 with Employee as outer:
- ◼ CJ1 = b E + (b E * b D ) + ((js OP6 * r E * r D )/bfr ED )
- ◼ = 2000 + (2000 * 13) + (((1/125) * 10,000 * 125)/4) =30,500
- ❑ Method J1 with Department as outer:
- ◼ CJ1 = b D + (b E * b D ) + (((js OP6 * r E * r D )/bfr ED )
- ◼ = 13 + (13 * 2000) + (((1/125) * 10,000 * 125/4) = 28,513
- ❑ Method J2 with EMPLOYEE as outer loop:
- ◼ CJ2c = b E + (r E * (x DNUMBER + 1)) + ((js OP6 * r E * r D )/bfr ED
- ◼ = 2000 + (10,000 * 2) + (((1/125) * 10,000 * 125/4) = 24,500
- ❑ Method J2 with DEPARTMENT as outer loop:
- ◼ CJ2a = b D + (r D * (x DNO + s DNO )) + ((js OP6 * r E * r D )/bfr ED )
- ◼ = 13 + (125 * (2 + 80)) + (((1/125) * 10,000 * 125/4) = 12,763

Example DEPARTMENT: rD = 125 and b D = 13 , x DNUMBER = 1, secondary index on MGRSSN of DEPARTMENT, sMGRSSN = 1, x MGRSSN = 2, js OP7 = (1/IEMPLOYEEI ) = 1/r E = 1/10,000 , bfr = 4

ED

EMPLOYEE : : r E = 10000, b E = 2000, secondary index on the key attribute SSN, with x SSN = 4 (S SSN = 1).

- ◼ (op7): DEPARTMENT  MGRSSN=SSNEMPLOYEE
- ❑ Method J1 with Employee as outer:
- ◼ CJ1 = b E + (b E * b D ) + ((js OP7 * r E * r D )/bfr ED )
- ◼ = 2000 + (2000 * 13) + (((1/10,000) * 10,000 * 125)/4) = ┌28,031.25┐ = 28,032
- ❑ Method J1 with Department as outer:
- ◼ CJ1 = b D + (b E * b D ) + (((js OP7 * r E * r D )/bfr ED )
- ◼ = 13 + (13 * 2000) + (((1/10,000) * 10,000 * 125/4) = ┌ 26,044.25 ┐ = 26,045
- ❑ Method J2 with EMPLOYEE as outer loop:
- ◼ CJ2c = b E + (r E * (x MGRSSN + s MGRSSN )) + ((js OP7 * r E * r D )/bfr ED
- ◼ = 2000 + (10,000 * (2+1)) + (((1/10,000) * 10,000 * 125/4) = ┌ 32,031.25 ┐ = 32,032
- ❑ Method J2 with DEPARTMENT as outer loop:
- ◼ CJ2a = b D + (r D * (x SSN + s SSN )) + ((js OP7 * r E * r D )/bfr ED )
- ◼ = 13 + (125 * (4 + 1)) + (((1/10,000) * 10,000 * 125/4) = ┌ 669.25 ┐ = 670

## Using Selectivity and Cost Estimates in Query Optimization (10)

## Multiple Relation Queries and Join Ordering

- ◼ A query joining n relations will have n-1 join operations, and hence can have a large number of different join orders when we apply the algebraic transformation rules.
- ◼ Current query optimizers typically limit the structure of a (join) query tree to that of left-deep (or rightdeep) trees.
- ◼ Left-deep tree : a binary tree where the right child of each non-leaf node is always a base relation.
- ❑ Amenable to pipelining
- ❑ Could utilize any access paths on the base relation (the right child) when executing the join.

## Using Selectivity and Cost Estimates in Query Optimization (11)

- ◼ Example: 2 left-deep trees

<!-- image -->

## 10. Overview of Query Optimization in Oracle

- ◼ Oracle DBMS V8
- ❑ Rule-based query optimization : the optimizer chooses execution plans based on heuristically ranked operations.
- ◼ (Currently it is being phased out)
- ❑ Cost-based query optimization : the optimizer examines alternative access paths and operator algorithms and chooses the execution plan with lowest estimate cost.
- ◼ The query cost is calculated based on the estimated usage of resources such as I/O, CPU and memory needed.
- ❑ Application developers could specify hints to the ORACLE query optimizer.
- ❑ The idea is that an application developer might know more information about the data.

## 11. Semantic Query Optimization

## ◼ Semantic Query Optimization :

- ❑ Uses constraints specified on the database schema in order to modify one query into another query that is more efficient to execute.
- ◼ Consider the following SQL query,

SELECT

E.LNAME, M.LNAME

FROM

EMPLOYEE E M

WHERE

E.SUPERSSN=M.SSN AND E.SALARY&gt;M.SALARY

## ◼ Explanation:

- ❑ Suppose that we had a constraint on the database schema that stated that no employee can earn more than his or her direct supervisor. If the semantic query optimizer checks for the existence of this constraint, it need not execute the query at all because it knows that the result of the query will be empty. Techniques known as theorem proving can be used for this purpose.