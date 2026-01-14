## Chapter 2

## Indexing Structures for Files

Adapted from the slides of 'Fundamentals of Database Systems' (Elmasri et al., 2011)

## Chapter outline

- ◼ Data storage
- ◼ Types of Single-level Ordered Indexes
- ❑ Primary Indexes
- ❑ Clustering Indexes
- ❑ Secondary Indexes
- ◼ Multilevel Indexes
- ◼ Dynamic Multilevel Indexes Using B-Trees and B + -Trees
- ◼ Indexes in Oracle

## Disk Storage Devices

- ◼ Preferred secondary storage device for high storage capacity and low cost.
- ◼ Data stored as magnetized areas on magnetic disk surfaces.
- ◼ A disk pack contains several magnetic disks connected to a rotating spindle.
- ◼ Disks are divided into concentric circular tracks on each disk surface .
- ❑ Track capacities vary typically from 4 to 50 Kbytes.

## Disk Storage Devices (cont.)

<!-- image -->

## Disk Storage Devices (cont.)

<!-- image -->

## Disk Storage Devices (cont.)

- ◼ A track is divided into smaller blocks or sectors.
- ❑ because a track usually contains a large amount of information .
- ◼ A track is divided into blocks .
- ❑ The block size B is fixed for each system.
- ◼ Typical block sizes range from B=512 bytes to B=4096 bytes.
- ❑ Whole blocks are transferred between disk and main memory for processing.

## Disk Storage Devices (cont.)

- ◼ A read-write head moves to the track that contains the block to be transferred.
- ❑ Disk rotation moves the block under the read-write head for reading or writing.
- ◼ A physical disk block (hardware) address consists of:
- ❑ a cylinder number (imaginary collection of tracks of same radius from all recorded surfaces)
- ❑ the track number or surface number (within the cylinder)
- ❑ and block number (within track).
- ◼ Reading or writing a disk block is time consuming because of the seek time s and rotational delay (latency) rd .
- ◼ Double buffering can be used to speed up the transfer of contiguous disk blocks.

<!-- image -->

8

## Records

- ◼ Fixed and variable length records.
- ◼ Records contain fields which have values of a particular type.
- ❑ E.g., amount, date, time, age.
- ◼ Fields themselves may be fixed length or variable length.
- ◼ Variable length fields can be mixed into one record:
- ❑ Separator characters or length fields are needed so that the record can be 'parsed'.

## Records (cont.)

<!-- image -->

| Name        |       Ssn | Salary   | Job_code   | Department   |
|-------------|-----------|----------|------------|--------------|
| Smith, John | 123456789 | XXXX     | XXXX       | Computer     |

## Blocking

- ◼ Blocking: refers to storing a number of records in one block on the disk.
- ◼ Blocking factor ( bfr ): refers to the number of records per block.
- ◼ There may be empty space in a block if an integral number of records do not fit in one block.
- ◼ Spanned Records: refer to records that exceed the size of one or more blocks and hence span a number of blocks.

## Blocking (cont.)

<!-- image -->

## Files of Records

- ◼ A file is a sequence of records, where each record is a collection of data values (or data items).
- ◼ A file descriptor (or file header ) includes information that describes the file, such as the field names and their data types , and the addresses of the file blocks on disk.
- ◼ Records are stored on disk blocks.
- ◼ The blocking factor bfr for a file is the (average) number of file records stored in a disk block.
- ◼ A file can have fixed-length records or variablelength records.

## Files of Records (cont.)

- ◼ File records can be unspanned or spanned :
- ❑ Unspanned : no record can span two blocks
- ❑ Spanned : a record can be stored in more than one block
- ◼ The physical disk blocks that are allocated to hold the records of a file can be contiguous, linked, or indexed .
- ◼ In a file of fixed-length records, all records have the same format. Usually, unspanned blocking is used with such files.
- ◼ Files of variable-length records require additional information to be stored in each record, such as separator characters and field types .
- ❑ Usually spanned blocking is used with such files.

## Operation on Files

## Typical file operations include:

- ◼ OPEN: Reads the file for access, and associates a pointer that will refer to a current file record at each point in time.
- ◼ FIND: Searches for the first file record that satisfies a certain condition, and makes it the current file record.
- ◼ FINDNEXT: Searches for the next file record (from the current record) that satisfies a certain condition, and makes it the current file record.
- ◼ READ: Reads the current file record into a program variable.
- ◼ INSERT: Inserts a new record into the file, and makes it the current file record.

## Operation on Files (cont.)

- ◼ DELETE: Removes the current file record from the file, usually by marking the record to indicate that it is no longer valid.
- ◼ MODIFY: Changes the values of some fields of the current file record.
- ◼ CLOSE: Terminates access to the file.
- ◼ REORGANIZE: Reorganizes the file records. For example, the records marked deleted are physically removed from the file or a new organization of the file records is created.
- ◼ READ\_ORDERED: Read the file blocks in order of a specific field of the file.

## Unordered Files

- ◼ Also called a heap or a pile file.
- ◼ New records are inserted at the end of the file.
- ◼ A linear search through the file records is necessary to search for a record.
- ❑ This requires reading and searching half the file blocks on the average, and is hence quite expensive.
- ◼ Record insertion is quite efficient.
- ◼ Reading the records in order of a particular field requires sorting the file records.

## Ordered Files

- ◼ Also called a sequential file.
- ◼ File records are kept sorted by the values of an ordering field .
- ◼ Insertion is expensive: records must be inserted in the correct order.
- ❑ It is common to keep a separate unordered overflow (or transaction ) file for new records to improve insertion efficiency; this is periodically merged with the main ordered file.
- ◼ A binary search can be used to search for a record on its ordering field value.
- ❑ This requires reading and searching log 2 of the file blocks on the average, an improvement over linear search.
- ◼ Reading the records in order of the ordering field is quite efficient.

block 1

block 2

block 3

## Ordered Files (cont.)

block n -1

block n

| NAME          | SSN   | BIRTHDATE   | 冏JOB   | SALARY   | SEX   |
|---------------|-------|-------------|--------|----------|-------|
| Aaron, Ed     |       |             |        |          |       |
| Abbott, Diane |       |             |        |          |       |
| Acosta, Marc  |       |             |        |          |       |

| Adams, John   |
|---------------|
| Adams, Robin  |
| Akers, Jan    |

| Alexander, Ed   |
|-----------------|
| Alfred, Bob     |
| Allen, Sam      |

| Wong, James   |
|---------------|
| Wood, Donald  |
| Woods, Manny  |

| Wright, Pam   |
|---------------|
| Wyatt, Chares |
| Zimmer, Byron |

19

## Average Access Times

- ◼ The following table shows the average access time to access a specific record for a given type of file:

Table 17.2 Average Access Times for a File of b Blocks under Basic File Organizations

| Typeof Organization   | Access/SearchMethod             | AverageBlocks to Access a Specific Record   |
|-----------------------|---------------------------------|---------------------------------------------|
| Heap (unordered)      | Sequential scan (linear search) | b/2                                         |
| Ordered               | Sequential scan                 | b/2                                         |
| Ordered               | Binary search                   | l0g2                                        |

## Hashed Files

- ◼ Hashing for disk files is called External Hashing.
- ◼ The file blocks are divided into M equal-sized buckets , numbered bucket 0 , bucket 1 , ..., bucket M-1 .
- ❑ Typically, a bucket corresponds to one (or a fixed number of) disk block.
- ◼ One of the file fields is designated to be the hash key of the file.
- ◼ The record with hash key value K is stored in bucket i, where i=h(K), and h is the hashing function .
- ◼ Search is very efficient on the hash key.
- ◼ Collisions occur when a new record hashes to a bucket that is already full.
- ❑ An overflow file is kept for storing such records.
- ❑ Overflow records that hash to each bucket can be linked together

## Hashed Files (cont.)

<!-- image -->

## Hashed Files (cont.)

- ◼ There are numerous methods for collision resolution, including the following:
- ❑ Open addressing: Proceeding from the occupied position specified by the hash address, the program checks the subsequent positions in order until an unused (empty) position is found.
- ❑ h(K) = K mod 7
- ❑ Insert 8
- ❑ Insert 15
- ❑ Insert 13

<!-- image -->

1

1

1

8

8

8

3

3

3

11

11

11

6

6

6

13

15

15

## Hashed Files (cont.)

- ◼ There are numerous methods for collision resolution, including the following:

## ❑ Chaining:

- ◼ Various overflow locations are kept: extending the array with a number of overflow positions.
- ◼ A pointer field is added to each record location.
- ◼ A collision is resolved by placing the new record in an unused overflow location and setting the pointer of the occupied hash address location to the address of that overflow location.

## ❑ Multiple hashing:

- ◼ The program applies a second hash function if the first results in a collision.
- ◼ If another collision results, the program uses open addressing or applies a third hash function and then uses open addressing if necessary.

## Hashed Files (cont.) - Overflow handling

## Main buckets

<!-- image -->

## Hashed Files (cont.)

- ◼ To reduce overflow records, a hash file is typically kept 70-80% full.
- ◼ The hash function h should distribute the records uniformly among the buckets; otherwise, search time will be increased because many overflow records will exist.
- ◼ Main disadvantages of static external hashing:
- ❑ Fixed number of buckets M is a problem if the number of records in the file grows or shrinks.
- ❑ Ordered access on the hash key is quite inefficient (requires  sorting the records).

## Indexes as Access Paths

- ◼ A single-level index is an auxiliary file that makes it more efficient to search for a record in the data file.
- ◼ The index is usually specified on one field of the file (although it could be specified on several fields)
- ◼ One form of an index is a file of entries &lt; field value, pointer to record&gt; , which is ordered by field value
- ◼ The index is called an access path on the field.

## Indexes as Access Paths (cont.)

- ◼ The index file usually occupies considerably less disk blocks than the data file because its entries are much smaller.
- ◼ A binary search on the index yields a pointer to the file record.
- ◼ Indexes can also be characterized as dense or sparse:
- ❑ A dense index has an index entry for every search key value (and hence every record) in the data file.
- ❑ A sparse (or nondense) index , on the other hand, has index entries for only some of the search values

## Types of Single-level Ordered Indexes

- ◼ Primary Indexes
- ◼ Clustering Indexes
- ◼ Secondary Indexes

## Primary Index

- ◼ Defined on an ordered data file.
- ❑ The data file is ordered on a key field .
- ◼ One index entry for each block in the data file
- ❑ First record in the block, which is called the block anchor
- ◼ A similar scheme can use the last record in a block.

|   Primary key value | Block pointer   |
|---------------------|-----------------|
|                   1 |                 |
|                   4 |                 |
|                   8 |                 |
|                  12 |                 |

## Primary key field

|   ID | Name   | DoB   | Salary   | Sex   |
|------|--------|-------|----------|-------|
|    1 |        |       |          |       |
|    2 |        |       |          |       |
|    3 |        |       |          |       |
|    4 |        |       |          |       |
|    6 |        |       |          |       |
|    7 |        |       |          |       |
|    8 |        |       |          |       |
|    9 |        |       |          |       |
|   10 |        |       |          |       |
|   12 |        |       |          |       |
|   13 |        |       |          |       |
|   15 |        |       |          |       |

<!-- image -->

## Primary Index

- ◼ Number of index entries?
- ❑ Number of blocks in data file.
- ◼ Dense or Nondense?
- ❑ Nondense
- ◼ Search/ Insert/ Update/ Delete?

## EXAMPLE 1 (1/2)

- ◼ An ordered file with r = 300,000 records
- ◼ A disk with block size B = 4,096 bytes
- ◼ File records are of fixed size and are unspanned, with record length R = 100 bytes
- ◼ bfr = ⎣ ( B / R ) ⎦ = ⎣ (4,096/100) ⎦ = 40 records per block
- ◼ b = ⎡ ( r / bfr ) ⎤ = ⎡ (300,000/40) ⎤ = 7,500 blocks
- ◼ A binary search on the data file would need approximately ⎡ log2 b ⎤ = ⎡ (log2 7,500) ⎤ = 13 block accesses

## EXAMPLE 1 (2/2)

- ◼ Suppose that
- ❑ The ordering key field of the file is V = 9 bytes long
- ❑ A block pointer is P = 6 bytes long
- ◼ Construct a primary index
- ❑ The size of each index entry is Ri = (9 + 6) = 15 bytes
- ❑ The blocking factor for the index is bfr i = ⎣ ( B / Ri ) ⎦ = ⎣ (4,096/15) ⎦ = 273 entries per block
- ❑ The total number of index entries r i is equal to the number of blocks in the data fle, which is 7,500
- ❑ The number of index blocks is hence b i = ⎡ ( r i / bfr i ) ⎤ = ⎡ (7,500/273) ⎤ = 28 blocks

## ◼ Searching

- ❑ Binary search on the index file would need ⎡ (log 2 b i ) ⎤ = ⎡ (log 2 28) ⎤ = 5 block accesses
- ❑ A total of 5 + 1 = 6 block accesses

## Clustering Index

- ◼ Defined on an ordered data file.
- ❑ The data file is ordered on a non-key field.
- ◼ One index entry each distinct value of the field.
- ❑ The index entry points to the first data block that contains records with that field value

|   Clustering field value | Block pointer   |
|--------------------------|-----------------|
|                        1 |                 |
|                        2 |                 |
|                        3 |                 |
|                        4 |                 |
|                        5 |                 |

|   Dept_No | Name   | DoB   | Salary   | Sex   |
|-----------|--------|-------|----------|-------|
|         1 |        |       |          |       |
|         1 |        |       |          |       |
|         2 |        |       |          |       |
|         2 |        |       |          |       |
|         2 |        |       |          |       |
|         2 |        |       |          |       |
|         2 |        |       |          |       |
|         3 |        |       |          |       |
|         3 |        |       |          |       |
|         4 |        |       |          |       |
|         4 |        |       |          |       |
|         5 |        |       |          |       |

<!-- image -->

(

Index file

&lt;K(i), P(i)&gt;

entries)

Clustering field value

1

2

3

4

5

Block pointer

Clustering field

→

<!-- image -->

## Clustering Index

- ◼ Number of index entries?
- ❑ Number of distinct indexing field values in data file.
- ◼ Dense or Nondense?
- ❑ Nondense
- ◼ Search/ Insert/ Update/ Delete?
- ◼ At most one primary index or one clustering index but not both.

## EXAMPLE 2

- ◼ r = 300,000 records, B = 4,096 bytes
- ◼ The file is ordered by the attribute Zipcode and there are 1,000 zip codes in the file
- ◼ Ri = 5-byte Zipcode and 6-byte block pointer
- ◼ bfr i = ⎣ ( B / Ri ) ⎦ = ⎣ (4,096/11) ⎦ = 372 index entries per block
- ◼ r i = 1000 index entries of the clustering index
- ◼ b i = ⎡ ( r i / bfr i ) ⎤ = ⎡ (1,000/372) ⎤ = 3 blocks
- ◼ A binary search on the index file would need ⎡ (log 2 b i ) ⎤ = ⎡ (log 2 3) ⎤ = 2 block accesses

## Secondary index

- ◼ A secondary index provides a secondary means of accessing a file .
- ❑ The data file is unordered on indexing field .
- ◼ Indexing field:
- ❑ secondary key (unique value)
- ❑ nonkey (duplicate values)
- ◼ The index is an ordered file with two fields:
- ❑ The first field: indexing field.
- ❑ The second field: block pointer or record pointer.
- ◼ There can be many secondary indexes for the same file.

<!-- image -->

| Index file ( <K(i), P(i)> entries)   | Index file ( <K(i), P(i)> entries)   | Secondary key field   | Secondary key field   | Secondary key field   | Secondary key field   |
|--------------------------------------|--------------------------------------|-----------------------|-----------------------|-----------------------|-----------------------|
| Index field value                    | Block pointer                        |                       | 5                     |                       |                       |
| 3                                    |                                      |                       | 13                    |                       |                       |
| 4                                    |                                      |                       | 8                     |                       |                       |
| 5                                    |                                      |                       | 6                     |                       |                       |
| 6                                    |                                      |                       | 15                    |                       |                       |
| 8                                    |                                      |                       | 3                     |                       |                       |
| 9                                    |                                      |                       | 9                     |                       |                       |
| 11                                   |                                      |                       | 21                    |                       |                       |
| 13                                   | …                                    |                       | 11                    |                       |                       |
| 15                                   |                                      |                       |                       |                       |                       |
| 18                                   |                                      |                       | 4                     |                       |                       |
| 21                                   |                                      |                       | 23                    |                       |                       |
| 23                                   |                                      |                       | 18                    |                       |                       |

## Secondary index on key field

- ◼ Number of index entries?
- ❑ Number of record in data file
- ◼ Dense or Nondense?
- ❑ Dense
- ◼ Search/ Insert/ Update/ Delete?

## Secondary index on non-key field

- ◼ Discussion: Structure of Secondary index on nonkey field?
- ◼ Option 1: include duplicate index entries with the same K ( i ) value - one for each record.
- ◼ Option 2: keep a list of pointers &lt; P ( i , 1), ..., P ( i , k )&gt; in the index entry for K ( i ).
- ◼ Option 3:
- ❑ more commonly used.
- ❑ one entry for each distinct index field value + an extra level of indirection to handle the multiple pointers.

- ◼
- Secondary Index on non-key field: option 3

<!-- image -->

## Secondary index on nonkey field

- ◼ Number of index entries?
- ❑ Number of records in data file
- ❑ Number of distinct index field values
- ◼ Dense or Nondense?
- ❑ Dense/ nondense
- ◼ Search/ Insert/ Update/ Delete?

## EXAMPLE 3

- ◼ r = 300,000, R = 100 bytes, B = 4,096 bytes, b = 7,500 blocks
- ◼ A non-ordering key field of the file that is V = 9 bytes long
- ◼ A linear search on the file would require b /2 = 7,500/2 = 3,750 block accesses on the average
- ◼ A secondary index
- ❑ A block pointer is P = 6 bytes long, so each index entry is Ri = (9 + 6) = 15 bytes
- ❑ bfr i = ⎣ ( B / Ri ) ⎦ = ⎣ (4,096/15) ⎦ = 273 index entries per block
- ❑ b i = ⎡ ( r / bfr i ) ⎤ = ⎡ (300,000/273) ⎤ = 1,099 blocks
- ❑ A binary search on this secondary index needs ⎡ (log 2 b i ) ⎤ = ⎡ (log 2 1,099) ⎤ = 11 block accesses
- ❑ Total block accesses: 11 + 1 = 12

## Summary of Single-level indexes

- ◼ Ordered file on indexing field?
- ❑ Primary index
- ❑ Clustering index
- ◼ Indexing field is Key?
- ❑ Primary index
- ❑ Secondary index
- ◼ Indexing field is not Key?
- ❑ Clustering index
- ❑ Secondary index

## Summary of Single-level indexes

- ◼ Dense index?
- ❑ Secondary index
- ◼ Nondense index?
- ❑ Primary index
- ❑ Clustering index
- ❑ Secondary index

## Summary of Single-level indexes

Table 18.2 Properties of Index Types

| Type of Index      | Number of (First-level) Index Entries                        | Dense or Nondense (Sparse)   | Block Anchoring on the Data File   |
|--------------------|--------------------------------------------------------------|------------------------------|------------------------------------|
| Primary            | Number of blocks in data file                                | Nondense                     | Yes                                |
| Clustering         | Number of distinct index field values                        | Nondense                     | Yes/noa                            |
| Secondary (key)    | Number of records in data file                               | Dense                        | No                                 |
| Secondary (nonkey) | Number of recordsb or number of distinct index field valuesc | Dense or Nondense            | No                                 |

## Chapter outline

- ◼ Types of Single-level Ordered Indexes
- ❑ Primary Indexes
- ❑ Clustering Indexes
- ❑ Secondary Indexes
- ◼ Multilevel Indexes
- ◼ Dynamic Multilevel Indexes Using B-Trees and B + -Trees
- ◼ Indexes in Oracle

## Multi-Level Indexes

- ◼ Because a single-level index is an ordered file, we can create a primary index to the index itself .
- ❑ The original index file is called the first-level index and the index to the index is called the second-level index.
- ◼ We can repeat the process, creating a third, fourth, ..., top level until all entries of the top level fit in one disk block.
- ◼ A multi-level index can be created for any type of first-level index (primary, secondary, clustering) as long as the first-level index consists of more than one disk block.

<!-- image -->

A two-level primary index resembling ISAM (Indexed Sequential Access Method) organization.

## EXAMPLE 4

- ◼ From example 3: bfr i = 273 index entries per block (fo) and b 1 = 1,099 blocks ❑ b 2 = ⎡ ( b 1 / fo ) ⎤ = ⎡ (1,099/273) ⎤ = 5 blocks
- ❑ b 3 = ⎡ ( b 2 / fo ) ⎤ = ⎡ (5/273) ⎤ = 1 block
- ◼ Top level of the index: t = 3
- ◼ Total block accesses : t + 1 = 3 + 1 = 4 block accesses

## Multi-Level Indexes

- ◼ Such a multi-level index is a form of search tree .
- ◼ However, insertion and deletion of new index entries is a severe problem because every level of the index is an ordered file.

## A Node in a Search Tree with Pointers to Subtrees below It

<!-- image -->

## A search tree of order p = 3

<!-- image -->

## Chapter outline

- ◼ Types of Single-level Ordered Indexes
- ❑ Primary Indexes
- ❑ Clustering Indexes
- ❑ Secondary Indexes
- ◼ Multilevel Indexes
- ◼ Dynamic Multilevel Indexes Using B-Trees and B + -Trees
- ◼ Indexes in Oracle

## Dynamic Multilevel Indexes Using BTrees and B + -Trees

- ◼ Most multi-level indexes use B-tree or B + -tree data structures because of the insertion and deletion problem.
- ❑ This leaves space in each tree node (disk block) to allow for new index entries
- ◼ These data structures are variations of search trees that allow efficient insertion and deletion of new search values.
- ◼ In B-Tree and B + -Tree data structures, each node corresponds to a disk block.
- ◼ Each node is kept between half-full and completely full.

## Dynamic Multilevel Indexes Using BTrees and B + -Trees (cont.)

- ◼ An insertion into a node that is not full is quite efficient.
- ❑ If a node is full, the insertion causes a split into two nodes.
- ◼ Splitting may propagate to other tree levels.
- ◼ A deletion is quite efficient if a node does not become less than half full.
- ◼ If a deletion causes a node to become less than half full, it must be merged with neighboring nodes.

## Difference between B-tree and B + -tree

- ◼ In a B-Tree, pointers to data records exist at all levels of the tree.
- ◼ In a B + -Tree, all pointers to data records exist at the leaf-level nodes.
- ◼ A B + -Tree can have less levels (or higher capacity of search values) than the corresponding B-tree.

## B-tree Structures

<!-- image -->

(b)

## Figure 18.10

B-tree structures. (a) A node in a B-tree with q - 1 search values. (b) A B-tree of order p = 3.The values were inserted in the order 8, 5, 1, 7, 3, 12, 9, 6.

5

6

0

0

8

Treenodepointer

Data pointer

Null tree pointer

0

3

9

12

61

## The Nodes of a B + -Tree

<!-- image -->

## The Nodes of a B + -Tree (cont.)

- ◼ A B+-Tree of order p and pleaf:
- Each internal node:
- Has at most p tree pointers.
- Except the root, has at least I(?/2)l tree pointer.
- An Internal node with q pointers , q ≤ p, has q - 1 search values.
- Each leaf node:
- Has at most pleaf f data pointers.
- [(Pleaf /2)] has at least

EXAMPLE 5 : Suppose the search field is V = 9 bytes long, the disk block size is B = 512 bytes, a record (data) pointer is Pt = 7 bytes, and a block pointer is P = 6 bytes. Each Btree node can have at most p tree pointers, p - 1 data pointers, and p - 1 search key field values. These must fit into a single disk block if each B-tree node is to correspond to a disk block. Hence, we must have:

<!-- formula-not-decoded -->

We can choose to be a large value that satisfies the above inequality, which gives p = 23 (p = 24 is not chosen because of additional information).

EXAMPLE 6 : Suppose that search field of Example 2 is a non-ordering key field, and we construct a B-Tree on this field. Assume that each node of the B-tree is 69 percent full. Each node, on the average, will have:

<!-- formula-not-decoded -->

Or approximately 16 pointers and, hence, 15 search key field values. The average fan-out fo = 16. We can start at the root and see how many values and pointers can exist, on the average, at each subsequent level:

Level

Nodes

Index entries

Pointers

Root :

1 node

15 entries

16 pointers

Level 1 :

16 nodes

240 entries

256 pointers

Level 2 :

256 nodes

3840 entries

4096 pointers

Level 3 :

4096 nodes

61,440 entries

At each level, we calculated the number of entries by multiplying the total number of pointers at the previous level by 15, the average number of entries in each node. Hence, for the given block size, pointer size, and search key field size, a two-level B-tree holds 3840+240+15= 4095 entries on the average; a three-level B-tree holds 65,535 entries on the average.

- ◼ EXAMPLE 7 : Calculate the order of a B + -tree.
- ◼ Suppose that the search key field is V=9 bytes long, the block size is B=512bytes , a record pointer is Pr =7bytes , and a block pointer is P=6byte s, as in Example 3. An internal node of the B + -tree can have up to p tree pointers and p-1 search field values; these must fit into a single block. Hence, we have:

<!-- formula-not-decoded -->

- ◼ We can choose p to be the largest value satisfying the above inequality, which give p = 34 .
- ◼ This is larger than the value of 23 for the B-Tree, resulting in a larger fan-out and more entries in each internal node of a B + -Tree than in the corresponding B-Tree.

## EXAMPLE 7 (cont.)

- ◼ The leaf nodes of B + -tree will have the same number of values and pointers, except that the pointers are data pointers and a next pointer. Hence, the order p leaf for the leaf nodes can be calculated as follows:

<!-- formula-not-decoded -->

- ◼ If follows that each leaf node hold up to p leaf = 31 key value/data pointer combinations, assuming that the data pointers are record pointers.

- ◼ EXAMPLE 8 : Suppose that we construct a B + -Tree on the field of Example 4. To calculate that approximate number of entries of the B + Tree, we assume that each node is 69 percent full. On the average, each internal node will be have 34*0.69 ≈ 23.46 or approximately 23 pointers, and hence 22 values. Each leaf node, on the average, will hold 0.69*p leaf = 0.69*31 ≈ 21.39 or approximately 21 data record pointers. A B + -tree will have the following average number of entries at each level:
- ◼ For the block size, pointer size, and search field size given above, a three-level B + -tree holds up to 255,507 record pointers, on the average. Compare this to the 65,535 entries for the corresponding Btree in Example 3.

| Level             | Nodes               | Index entries Pointers   |                      |
|-------------------|---------------------|--------------------------|----------------------|
| Root              | 1 nodes 22 entries  | 23 pointers              |                      |
| Level 1           | 23 23*22 = 506      | 23 2 =529 pointers       |                      |
| Level 2           | 529 529*22 = 11,638 | 23 3 =12,167 pointers    |                      |
| Leaf level 12,167 | Leaf level 12,167   | 12,167 *21 = 255,507     | 12,167 *21 = 255,507 |

## B + -Tree: Insert entry

- ◼ Insert new entry at leaf node.
- If leaf node is full: overflows and must be split.
- Create a new node.
- [(pteaf + 1)/2)] The first j = entries are kept in the original node.
- The remaining entries are moved to the new node.
- The jth search value is replicated in the parent internal node in the correct sequence.
- An extra pointer to the new node is created in the parent.

## B + -Tree: Insert entry (cont.)

- ◼ If the parent internal node is full: overflow and must be split.
- The jth (j = [((p + 1)/2)] ) ) search value is move to the parent.
- The first j - 1 entries are kept.
- The remaining entries (from j+1 to the end) is hold in a new internal node.
- This splitting can propagate all the way to create a new root node
- new level for the B+-tree

## Example of insertion in B + -tree

- Treenodepointer

```
Data pointer Null tree pointer
```

<!-- formula-not-decoded -->

Insertion Sequence: 8, 5,

1, 7, 3, 12, 9, 6

<!-- image -->

## Example of insertion in B + -tree (cont.)

<!-- image -->

<!-- formula-not-decoded -->

Insertion Sequence:

8, 5, 1, 7, 3, 12, 9, 6

## Example of insertion in B + -tree (cont.)

<!-- image -->

<!-- formula-not-decoded -->

Insertion Sequence:

8, 5, 1, 7, 3, 12, 9, 6

## Example of insertion in B + -tree (cont.)

<!-- image -->

<!-- formula-not-decoded -->

Insertion Sequence:

8, 5, 1, 7, 3, 12, 9, 6

## Example of insertion in B + -tree (cont.)

<!-- image -->

p = 3 and p l eaf = 2

Insertion Sequence:

8, 5, 1, 7, 3, 12, 9, 6

## Example of insertion in B + -tree (cont.)

Insertion Sequence:

8, 5, 1, 7, 3, 12, 9, 6

<!-- image -->

## Example of insertion in B + -tree (cont.)

Insertion Sequence:

8, 5, 1, 7, 3, 12, 9, 6

<!-- image -->

## B + -Tree: Delete entry

- ◼ Remove the entry from the leaf node.
- ◼ If it happens to occur in an internal node:
- ❑ Remove.
- ❑ The value to its left in the leaf node must replace it in the internal node.
- ◼ Deletion may cause underflow in leaf node:
- ❑ Try to find a sibling leaf node - a leaf node directly to the left or to the right of the node with underflow.
- ❑ Redistribute the entries among the node and its siblings. (Common method: The left sibling first and the right sibling later)
- ❑ If redistribution fails, the node is merged with its sibling.
- ❑ If merge occurred, must delete entry (pointing to node and sibling) from parent node.

## B + -Tree: Delete entry (cont.)

- ◼ If an internal node is underflow:
- ❑ Redistribute the entries among the node, its siblings and entry pointing to node and sibling of parent node .
- ❑ If redistribution fails, the node is merged with its sibling and the entry pointing to node and sibling of parent node .
- ❑ If merge occurred, must delete entry pointing to node and sibling from parent node.
- ❑ If the root node is empty → the merged node becomes the new root node.
- ◼ Merge could propagate to root, reduce the tree levels.

## Example of deletion from B + -tree.

Deletion sequence : 5, 12, 9

<!-- image -->

## Example of deletion from B + -tree (cont.)

Deletion sequence

: 5, 12, 9

<!-- image -->

## Example of deletion from B + -tree (cont.)

Deletion sequence :

5, 12, 9

<!-- image -->

## Example of deletion from B+-tree (cont.)

<!-- image -->

<!-- formula-not-decoded -->

Deletion sequence

: 5, 12, 9

<!-- image -->

## Notes &amp; Suggestions

- ◼ [1], chapter 18:
- ❑ Index on Multiple Keys
- ❑ Other Types of Indexes
- ◼ Search, Insertion and Deletion with B-Trees.

## Chapter outline

- ◼ Types of Single-level Ordered Indexes
- ❑ Primary Indexes
- ❑ Clustering Indexes
- ❑ Secondary Indexes
- ◼ Multilevel Indexes
- ◼ Dynamic Multilevel Indexes Using B-Trees and B+-Trees
- ◼ Indexes in Oracle

## Types of Indexes

- ◼ B-tree indexes: standard index type
- ❑ Index-organized tables: the data is itself the index.
- ❑ Reverse key indexes: the bytes of the index key are reversed. For example, 103 is stored as 301. The reversal of bytes spreads out inserts into the index over many blocks.
- ❑ Descending indexes: This type of index stores data on a particular column or columns in descending order.
- ❑ B-tree cluster indexes: is used to index a table cluster key. Instead of pointing to a row, the key points to the block that contains rows related to the cluster key.

## Types of Indexes (cont.)

- ◼ Bitmap and bitmap join indexes: an index entry uses a bitmap to point to multiple rows. A bitmap join index is a bitmap index for the join of two or more tables.
- ◼ Function-based indexes:
- ❑ Includes columns that are either transformed by a function, such as the UPPER function, or included in an expression.
- ❑ B-tree or bitmap indexes can be function-based.
- ◼ Application domain indexes: customized index specific to an application.

## Creating Indexes

- ◼ Simple create index syntax:

## CREATE [ UNIQUE | BITMAP ] INDEX

[schema.] &lt;index\_name&gt;

```
ON [schema.] <table_name> (column [ ASC | DESC ] [ , column [ ASC | DESC ] ] ...) [ REVERSE ];
```

## Example of creating indexes

- ◼ CREATE INDEX ord\_customer\_ix ON ORDERS (customer\_id); ◼ CREATE INDEX emp\_name\_dpt\_ix ON HR.EMPLOYEES(last\_name ASC , department\_id DESC ); ◼ CREATE BITMAP INDEX emp\_gender\_idx ON EMPLOYEES (Sex); ◼ CREATE BITMAP INDEX emp\_bm\_idx ON EMPLOYEES (JOBS.job\_title) FROM EMPLOYEES, JOBS WHERE EMPLOYEES.job\_id = JOBS.job\_id;

## Example of creating indexes (cont.)

## Function-Based Indexes:

```
◼ CREATE INDEX emp_fname_uppercase_idx ON EMPLOYEES ( UPPER (first_name) ); ◼ SELECT First_name, Lname FROM Employee WHERE UPPER(Lname)= 'SMITH'; ◼ CREATE INDEX emp_total_sal_idx ON EMPLOYEES (salary + (salary * commission_pct)); ◼ SELECT First_name, Lname FROM Employee WHERE ((Salary*Commission_pct) + Salary ) > 15000;
```

## Guidelines for creating indexes

- ◼ Primary and unique keys automatically have indexes , but you might want to create an index on a foreign key.
- ◼ Create an index on any column that the query uses to join tables.
- ◼ Create an index on any column from which you search for particular values on a regular basis.
- ◼ Create an index on columns that are commonly used in ORDER BY clauses.
- ◼ Ensure that the disk and update maintenance overhead an index introduces will not be too high.

## Summary

- ◼ Types of Single-level Ordered Indexes
- ❑ Primary Indexes
- ❑ Clustering Indexes
- ❑ Secondary Indexes
- ◼ Multilevel Indexes
- ◼ Dynamic Multilevel Indexes Using B-Trees and B + -Trees
- ◼ Indexes in Oracle

## Review questions

- 1) Define the following terms: indexing field, primary key field, clustering field, secondary key field, block anchor, dense index, and nondense (sparse) index.
- 2) What are the differences among primary, secondary, and clustering indexes? How do these differences affect the ways in which these indexes are implemented? Which of the indexes are dense, and which are not?
- 3) Why can we have at most one primary or clustering index on a file, but several secondary indexes?
- 4) How does multilevel indexing improve the efficiency of searching an index file?
- 5) What is the order p of a B-tree? Describe the structure of B-tree nodes.
- 6) What is the order p of a B+-tree? Describe the structure of both internal and leaf nodes of a B+-tree.
- 7) How does a B-tree differ from a B+-tree? Why is a B+-tree usually preferred as an access structure to a data file?