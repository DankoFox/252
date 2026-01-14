## Chapter 4

## Introduction to Transaction Processing Concepts and Theory

Adapted from the slides of 'Fundamentals of Database Systems' (Elmasri et al., 2006)

## Chapter Outline

- ◼ Introduction to Transaction Processing
- ◼ Transaction and System Concepts
- ◼ Desirable Properties of Transactions
- ◼ Characterizing Schedules based on Recoverability
- ◼ Characterizing Schedules based on Serializability
- ◼ Transaction Support in SQL

## 1. Introduction to Transaction Processing (1)

- ◼ Single-User System: At most one user at a time can use the system.
- ◼ Multiuser System : Many users can access the system concurrently.
- ◼ Concurrency
- ❑ Interleaved processing : concurrent execution of processes is interleaved in a single CPU
- ❑ Parallel processing : processes are concurrently executed in multiple CPUs.

## Introduction to Transaction Processing (2)

- ◼ A Transaction: logical unit of database processing that includes one or more access operations (read -retrieval, write - insert or update, delete).
- ◼ A transaction (set of operations) may be standalone specified in a high level language like SQL submitted interactively, or may be embedded within a program.
- ◼ Transaction boundaries : Begin and End transaction.
- ◼ An application program may contain several transactions separated by the Begin and End transaction boundaries.

## Introduction to Transaction Processing (3)

## SIMPLE MODEL OF A DATABASE (for purposes of discussing transactions):

- ◼ A database collection of named data items
- ◼ Granularity of data - a field, a record , or a whole disk block (Concepts are independent of granularity)
- ◼ Basic operations are read and write
- ❑ read\_item(X) : Reads a database item named X into a program variable. To simplify our notation, we assume that the program variable is also named X.
- ❑ write\_item(X) : Writes the value of program variable X into the database item named X .

## Introduction to Transaction Processing (4)

## READ AND WRITE OPERATIONS:

- ◼ Basic unit of data transfer from the disk to the computer main memory is one block .
- ◼ Data item (what is read or written):
- ❑ the field of some record in the database,
- ❑ a larger unit such as a record or even a whole block.
- ◼ read\_item(X) command includes the following steps:
1. Find the address of the disk block that contains item X .
2. Copy that disk block into a buffer in main memory (if that disk block is not already in some main memory buffer).
3. Copy item X from the buffer to the program variable named X .

## Introduction to Transaction Processing (5)

## READ AND WRITE OPERATIONS (cont.):

- ◼ write\_item(X) command includes the following steps:
1. Find the address of the disk block that contains item X .
2. Copy that disk block into a buffer in main memory (if that disk block is not already in some main memory buffer).
3. Copy item X from the program variable named X into its correct location in the buffer.
4. Store the updated block from the buffer back to disk (either immediately or at some later point in time).

```
Two sample transactions. (a) Transaction T 1 . (b) Transaction T 2 . (a) T (b) T2 read_item (X); read_item (X); X:=X-N; X:=X+M; write_item (X); write_item(X); read_item (Y); Y:=Y+N; write_item (Y);
```

## Introduction to Transaction Processing (7)

## Why Concurrency Control is needed:

- ◼ The Lost Update Problem.

This occurs when two transactions that access the same database items have their operations interleaved in a way that makes the value of some database item incorrect.

- ◼ The Temporary Update (or Dirty Read) Problem.

This occurs when one transaction updates a database item and then the transaction fails for some reason. The updated item is accessed by another transaction before it is changed back to its original value.

## Some problems  that occur when concurrent execution is uncontrolled. (a) The lost update problem.

<!-- image -->

## Some problems  that occur when concurrent execution is uncontrolled. (b) The temporary update problem.

<!-- image -->

## Introduction to Transaction Processing (8)

## Why Concurrency Control is needed (cont.):

- ◼ The Incorrect Summary Problem .

If one transaction is calculating an aggregate summary function on a number of records while other transactions are updating some of these records, the aggregate function may calculate some values before they are updated and others after they are updated.

## ◼ The unrepeatable Read Problem:

Transaction T reads the same item twice and the item is changed by another transaction T' between the two reads.

Some problems  that occur when concurrent execution is uncontrolled. (c) The incorrect summary problem.

```
(c) T1 T3 Sum:=0; read_item(A); Sum:=Sum+A; read_item(X); X:=X-N; write_item(X); read_item(X); T 3 reads Xafter Nis subtracted and reads Sum:=Sum+X; Ybefore Nis added; a wrong summary read_item( Y); is the result (off by N). Sum:=Sum+ Y; read_item( Y); Y:=Y+N; write_item( Y);
```

## Introduction to Transaction Processing (11)

## Why recovery is needed:

(What causes a Transaction to fail)

1. A computer failure (system crash): A hardware or software error occurs in the computer system during transaction execution. If the hardware crashes, the contents of the computer's internal memory may be lost.
2. A transaction or system error : Some operation in the transaction may cause it to fail, such as integer overflow or division by zero. Transaction failure may also occur because of erroneous parameter values or because of a logical programming error. In addition, the user may interrupt the transaction during its execution.

## Introduction to Transaction Processing (12)

## Why recovery is needed (cont.):

3. Local errors or exception conditions detected by the transaction:
- certain conditions necessitate cancellation of the transaction. For example, data for the transaction may not be found. A condition, such as insufficient account balance in a banking database, may cause a transaction, such as a fund withdrawal from that account, to be canceled.
- a programmed abort in the transaction causes it to fail.
4. Concurrency control enforcement: The concurrency control method may decide to abort the transaction, to be restarted later, because it violates serializability or because several transactions are in a state of deadlock (see Chapter 5).

## Introduction to Transaction Processing (13)

## Why recovery is needed (cont.):

5. Disk failure: Some disk blocks may lose their data because of a read or write malfunction or because of a disk read/write head crash. This may happen during a read or a write operation of the transaction.
6. Physical problems and catastrophes: This refers to an endless list of problems that includes power or air-conditioning failure, fire, theft, sabotage, overwriting disks or tapes by mistake, and mounting of a wrong tape by the operator.

## 2 . Transaction and System Concepts (1)

- ◼ A transaction is an atomic unit of work that is either completed in its entirety or not done at all. For recovery purposes, the system needs to keep track of when the transaction starts, terminates, and commits or aborts.

## ◼ Transaction states :

- ❑ Active state
- ❑ Partially committed state
- ❑ Committed state
- ❑ Failed state
- ❑ Terminated State

## State transition diagram illustrating the states for transaction execution.

<!-- image -->

## Transaction and System Concepts (2)

## Recovery manager keeps track of the following operations:

- ◼ begin\_transaction: This marks the beginning of transaction execution.
- ◼ read or write: These specify read or write operations on the database items
- ◼ end\_transaction:
- ❑ This specifies that read and write transaction operations have ended and marks the end limit of transaction execution.
- ❑ may be necessary to check whether the changes introduced by the transaction can be permanently applied to the database or whether the transaction has to be aborted because it violates concurrency control or for some other reason.

## Transaction and System Concepts (3)

## Recovery manager keeps track of the following operations (cont):

- ◼ commit\_transaction: This signals a successful end of the transaction so that any changes (updates) executed by the transaction can be safely committed to the database and will not be undone.
- ◼ rollback (or abort): This signals that the transaction has ended unsuccessfully, so that any changes or effects that the transaction may have applied to the database must be undone.

## Transaction and System Concepts (4)

## Recovery techniques use the following operators:

- ◼ undo: Similar to rollback except that it applies to a single operation rather than to a whole transaction.
- ◼ redo: This specifies that certain transaction operations must be redone to ensure that all the operations of a committed transaction have been applied successfully to the database.

## Transaction and System Concepts (6)

## The System Log

## ◼ Log or Journal :

- ❑ The log keeps track of all transaction operations that affect the values of database items.
- ❑ This information may be needed to permit recovery from transaction failures.
- ❑ The log is kept on disk → not affected by any type of failure except for disk or catastrophic failure.
- ❑ In addition, the log is periodically backed up to archival storage (tape) to guard against such catastrophic failures.

## Transaction and System Concepts (7)

## The System Log (cont):

## Types of log record:

1. [start\_transaction, T ]: Records that transaction T has started execution.
2. [write\_item, T,X ,old\_value,new\_value]: Records that transaction T has changed the value of database item X from old\_value to new\_value .
3. [read\_item, T,X ]: Records that transaction T has read the value of database item X .
4. [commit, T ]: Records that transaction T has completed successfully, and affirms that its effect can be committed (recorded permanently) to the database.
5. [abort, T ]: Records that transaction T has been aborted.

## Transaction and System Concepts (8)

## The System Log (cont):

- ◼ Protocols for recovery that avoid cascading rollbacks do not require that READ operations be written to the system log, whereas other protocols require these entries for recovery.
- ◼ Strict protocols require simpler WRITE entries that do not include new\_value .

## Transaction and System Concepts (9)

## Recovery using log records:

- ◼ If the system crashes, we can recover to a consistent database state by examining the log and using one of the techniques described in Chapter 6.
- ◼ Because the log contains a record of every write operation that changes the value of some database item, it is possible to undo the effect of these write operations of a transaction T by tracing backward through the log and resetting all items changed by a write operation of T to their old\_values.
- ◼ We can also redo the effect of the write operations of a transaction T by tracing forward through the log and setting all items changed by a write operation of T (that did not get done permanently) to their new\_values.

## Transaction and System Concepts (10)

## Commit Point of a Transaction:

- ◼ Definition: A transaction T reaches its commit point when
- ❑ all its operations that access the database have been executed successfully and
- ❑ the effect of all the transaction operations on the database has been recorded in the log.
- ◼ Beyond the commit point, the transaction is said to be committed, and its effect is assumed to be permanently recorded in the database.  The transaction then writes an entry [commit, T ] into the log.
- ◼ Roll Back of transactions: Needed for transactions that have a [start\_transaction, T ] entry into the log but no commit entry [commit, T ] into the log.

## 3. Desirable Properties of Transactions (1)

## ACID properties:

- ◼ Atomicity : A transaction is an atomic unit of processing; it is either performed in its entirety or not performed at all.
- ◼ Consistency preservation : A correct execution of the transaction must take the database from one consistent state to another.

## Desirable Properties of Transactions (2)

## ACID properties (cont.):

- ◼ Isolation : A transaction should appear as though it is being executed in isolation from other transaction. That is, the execution of a transaction should not be interfered with by any other transaction executing concurrently.
- ◼ Durability or permanency : Once a transaction changes the database and the changes are committed, these changes must never be lost because of subsequent failure.

## 4. Characterizing Schedules based on Recoverability (1)

## ◼ Transaction schedule or history:

- ❑ When transactions are executing concurrently in an interleaved fashion
- ❑ The order of execution of operations from the various transactions forms → a transaction schedule (or history).
- ◼ A schedule (or history ) S of n transactions T1 , T 2 , ..., T n :
- ❑ Constraint : for each transaction Ti that participates in S , the operations of T1 in S must appear in the same order in which they occur in T1 .
- ❑ However, that operations from other transactions Tj can be interleaved with the operations of Ti in S .

## Characterizing Schedules based on Recoverability (2)

- ◼ Notation:

| Notation   | Description                     |
|------------|---------------------------------|
| r i (X)    | read_item(X) - transaction T i  |
| w i (X)    | write_item(X) - transaction T i |
| c i        | commit - transaction T i        |
| a i        | abort - transaction T i         |

```
◼ Example (1): ❑ Sa : r 1 (X); r 2 (X); w 1 (X); r 1 (Y); w 2 (X); w 1 (Y); Characterizing Schedules based on Recoverability (3) T T2 read_item(X); X:=X-N; read _item(X); X:=X+M; write_item(X); read_item( Y); write_item(X); Y:=Y+N; write_item( Y);
```

```
◼ Example (2): ❑ Sb : r 1 (X); w 1 (X); r 2 (X); w 2 (X); r 1 (Y); a 1 ; Characterizing Schedules based on Recoverability (4) abort ; T1 T2 read_item(X); X:=X-N; write_item(X); read_item(X); X:=X+M; write_item(X); read_item( Y);
```

## Characterizing Schedules based on Recoverability (5)

- ◼ Two operations in a schedule are said to conflict if they satisfy all :
- ❑ (1) they belong to different transactions.
- ❑ (2) they access the same item X.
- ❑ (3) at least one of the operation is a write\_item(X)

## Characterizing Schedules based on Recoverability (6)

## ◼ Example (1):

## ❑ conflict:

- ◼ r 1 (X) and w 2 (X)
- ◼ r 2 (X) and w 1 (X)
- ◼ w1 (X) and w 2 (X)

## ❑ Not conflict:

- ◼ r 1 (X) and r 2 (X)
- ◼ r 1 (Y) and w 2 (X)
- ◼ r 1 (X) and w 1 (X)

◼

…

<!-- image -->

## Characterizing Schedules based on Recoverability (7)

- ◼ Example (2):

<!-- formula-not-decoded -->

- ❑ Conflict:
- ◼ r 1 (X) and w 2 (X)
- ◼ w1 (X) and r 2 (X)
- ◼ w1 (X) and w 2 (X)

## Characterizing Schedules based on Recoverability (8)

## Schedules classified on recoverability:

- ◼ Recoverable schedule: A schedule S is recoverable if no transaction T in S commits until all transactions T ' that have written an item that T reads have committed.
- ◼ Cascadeless schedule: One where every transaction reads only  the items that are written by committed transactions. Schedules requiring cascaded rollback : A schedule in which uncommitted transactions that read an item from a failed transaction must be rolled back.

## Characterizing Schedules based on Recoverability (9)

## Schedules classified on recoverability (cont.):

- ◼ Strict Schedules: A schedule in which a transaction can neither read or write an item X until the last transaction that wrote X has committed.

## Characterizing Schedules based on Recoverability (10)

- ◼ Example of Recoverable schedule :
- Sa ': r 1 (X); r 2 (X); w 1 (X); r 1 (Y); w 2 (X); c 2 ; w 1 (Y); c 1 ; ❑ Lost update
- ◼ Example of Not Recoverable schedule :

```
Sc : r 1 (X); w 1 (X); r 2 (X); r 1 (Y); w 2 (X); c 2 ; a 1 ;
```

## Characterizing Schedules based on Recoverability (11)

- ◼ Example of Cascading Rollback :

Sd : r

- ❑ :
- ◼ Example of Cascadeless schedule :

```
1 (X); w 1 (X); r 2 (X); r 1 (Y); w 2 (X); w 1 (Y); c 1 ; c 2 ; Sd Recoverable schedule
```

```
S' d : r 1 (X); w 1 (X); r 1 (Y); w 1 (Y); c 1 ; r 2 (X); w 2 (X); c 2 ;
```

## 5. Characterizing Schedules based on Serializability (1)

- ◼ Serial schedule : A schedule S is serial if, for every transaction T participating in the schedule, all the operations of T are executed consecutively in the schedule. Otherwise, the schedule is called nonserial schedule.
- ◼ Serializable schedule : A schedule S is serializable if it is equivalent to some serial schedule of the same n transactions.

## Characterizing Schedules based on Serializability (2)

Time

<!-- image -->

Time

## Characterizing Schedules based on Serializability (3)

<!-- image -->

## Characterizing Schedules based on Serializability (4)

- ◼ Result equivalent : Two schedules are called result equivalent if they produce the same final state of the database.
- ◼ Conflict equivalent : Two schedules are said to be conflict equivalent if the order of any two conflicting operations is the same in both schedules.
- ❑ Two operations in a schedule are said to conflict if they belong to different transactions, access the same data item, and at least one of the two operations is a write\_item operation.

## Characterizing Schedules based on Serializability (5)

- ◼ Conflict serializable : A schedule S is said to be conflict serializable if it is conflict equivalent to some serial schedule S ' .
- ❑ In such a case, we can reorder the nonconflicting operations in S until we form the equivalent serial schedule S'.

## Characterizing Schedules based on Serializability (6)

- ◼ Being serializable is not the same as being serial
- ◼ Being serializable implies that the schedule is a correct schedule.
- ❑ It will leave the database in a consistent state.
- ❑ The interleaving is appropriate and will result in a state as if the transactions were serially executed, yet will achieve efficiency due to concurrent execution.

## Characterizing Schedules based on Serializability (7)

- ◼ Serializability is hard to check.
- ❑ Interleaving of operations occurs in an operating system through some scheduler
- ❑ Difficult to determine beforehand how the operations in a schedule will be interleaved.

## Characterizing Schedules based on Serializability (8)

## Practical approach:

- ◼ Come up with methods (protocols) to ensure serializability.
- ◼ It ' s not possible to determine when a schedule begins and when it ends. Hence, we reduce the problem of checking the whole schedule to checking only a committed project of the schedule (i.e. operations from only the committed transactions.)
- ◼ Current approach used in most DBMSs:
- ❑ Use of locks with two phase locking

## Characterizing Schedules based on Serializability (9)

## Testing for conflict serializability

- ◼ Precedence graph (serialization graph) G = ( N , E )
- ❑ Directed graph
- ❑ Set of Nodes: N = {T 1 , T 2 , ... , T n }
- ❑ Directed edge: E ={e 1 , e 2 , …, e m }
- ◼ e i : T j → Tk if one of the operations in T j appears in the schedule before some conflicting operation in T k

## Characterizing Schedules based on Serializability (10)

## Testing for conflict serializability (cont.)

## ◼ Algorithm

1. For each transaction Ti participating in schedule S, create a node labeled Ti in the precedence graph.
2. For each case in S where Tj executes a read\_item( X ) after Ti executes a write\_item( X ), create an edge ( Ti → Tj ) in the precedence graph.
3. For each case in S where Tj executes a write\_item( X ) after Ti executes a read\_item( X ), create an edge ( Ti → Tj ) in the precedence graph.

## Characterizing Schedules based on Serializability (11)

## Testing for conflict serializability (cont.)

- ◼ Algorithm (cont.)
4. For each case in S where Tj executes a write\_item( X ) after Ti executes a write\_item( X ), create an edge ( Ti → Tj ) in the precedence graph.
5. The schedule S is serializable if and only if the precedence graph has no cycles.

Time

## Example of Serializability Testing (1)

<!-- image -->

Schedule A

<!-- image -->

<!-- image -->

## Example of Serializability Testing (2)

<!-- image -->

## Example of Serializability Testing (3)

| T                                                  | T2                     |
|----------------------------------------------------|------------------------|
| read_item(X); X:=X-N; write_item(X); read_item(Y); | read_item(X); X:=X+ M; |
| Y:=Y+N; write_item(Y);                             | write_item(X);         |

<!-- image -->

## Example of Serializability Testing (4)

| T                                    | T2                                   |
|--------------------------------------|--------------------------------------|
| read_item(X); X:=X-N; write_item(X); | read_item(X); X:=X+M; write_item(X); |
| read_item(Y); Y:=Y+N; write_item(Y); |                                      |

<!-- image -->

Another example of serializability testing. (a) The READ and WRITE operations of three transactions T 1 , T 2 , and T 3 .

(a)

## transaction  T1

read\_item (X);

write\_item (X);

read\_item (Y);

write\_item (Y);

## transaction  2

read\_item (Z);

read\_item (Y);

write\_item (Y);

read\_item (X);

write\_item (X);

## transaction T3

read\_item (Y);

read\_item (Z);

write\_item (Y);

write\_item (Z);

## Another example of serializability testing. (b) Schedule E .

| (b)   | transaction  T                                                | transaction  T2                | transaction  T3                                               |
|-------|---------------------------------------------------------------|--------------------------------|---------------------------------------------------------------|
| Time  | read_item (X); write_item (X); read_item (Y); write_item (Y); | read_item (X); write_item (X); | read_item (Y); read_item (Z); write_item (Y); write_item (Z); |

## Schedule E

## Another example of serializability testing. (c) Schedule F .

<!-- image -->

| (c)   | transaction  T1                | transaction  T2   | transaction  T3                                               |
|-------|--------------------------------|-------------------|---------------------------------------------------------------|
| Time  | read_item (X); write_item (X); | read_item (Z);    | read_item (Y); read_item (Z); write_item (Y); write_item (Z); |

## Schedule F

<!-- image -->

## Equivalent serial schedules

## None

## Reason

<!-- formula-not-decoded -->

## Equivalent serial schedules

<!-- image -->

## Equivalent serial schedules

<!-- image -->

<!-- image -->

## 6. Transaction Support in SQL2 (1)

- ◼ A single SQL statement is always considered to  be atomic.  Either the statement completes execution without error or it fails and leaves the database unchanged.
- ◼ With SQL, there is no explicit Begin Transaction statement. Transaction   initiation is done implicitly when particular SQL statements are   encountered.
- ◼ Every transaction must have an explicit end statement,  which is either a COMMIT or ROLLBACK.

## Transaction Support in SQL2 (2)

## Characteristics specified by a SET TRANSACTION statement in SQL2:

- ◼ Access mode: READ ONLY or READ WRITE.  The default is READ WRITE unless the isolation level of READ UNCOMITTED is specified, in which case READ ONLY is assumed.
- ◼ Diagnostic size n,  specifies an integer value n, indicating the number of conditions that can be held simultaneously in the diagnostic  area.  (Supply user feedback information)

## Transaction Support in SQL2 (3)

## Characteristics specified by a SET TRANSACTION statement in SQL2 (cont.):

- ◼ Isolation level &lt;isolation&gt;, where &lt;isolation&gt; can be READ UNCOMMITTED, READ COMMITTED, REPEATABLE
- READ or SERIALIZABLE.   The default is SERIALIZABLE. However, if any transaction executes at a lower level, then

With SERIALIZABLE: the interleaved execution of transactions  will adhere to our notion of serializability. serializability may be violated.

## Transaction Support in SQL2 (4)

## Potential problem with lower isolation levels:

- ◼ Dirty Read : Reading a value that was written by a transaction which failed.
- ◼ Nonrepeatable Read : Allowing another transaction to write a new value between multiple reads of one transaction.

A transaction T 1 may read a given value from a table. If another transaction T 2 later updates that value and T 1 reads that value again, T 1 will see a different value. Consider that T 1 reads the employee salary for Smith. Next, T 2 updates the salary for Smith.  If T 1 reads Smith's salary again, then it will see a different value for Smith's salary.

## Transaction Support in SQL2(5)

## Potential problem with lower isolation levels (cont.):

- ◼ Phantoms : New rows being read using the same read with a condition.
- ❑ A transaction T1 may read a set of rows from a table, perhaps based on some condition specified in the SQL WHERE clause.
- ❑ A transaction T2 inserts a new row that also satisfies the WHERE clause condition of T1 , into the table used by T1 .
- ❑ If T1 is repeated, then T1 will see a row that previously did not exist, called a phantom .

## Transaction Support in SQL2 (6)

## Sample SQL transaction:

```
EXEC SQL whenever sqlerror go to UNDO; EXEC SQL SET TRANSACTION READ WRITE DIAGNOSTICS SIZE 5 ISOLATION LEVEL SERIALIZABLE; EXEC SQL INSERT INTO EMPLOYEE (FNAME, LNAME, SSN, DNO, SALARY) VALUES ('Robert','Smith','991004321',2,35000); EXEC SQL UPDATE EMPLOYEE SET SALARY = SALARY * 1.1 WHERE DNO = 2; EXEC SQL COMMIT; GOTO THE_END; UNDO: EXEC SQL ROLLBACK; THE_END:  ...
```

## Transaction Support in SQL2 (7)

## Possible violation of serializabilty:

|                  | Type of Violation   | Type of Violation   | Type of Violation   |
|------------------|---------------------|---------------------|---------------------|
| lsolation Level  | Dirty Read          | Nonrepeatable Read  | Phantom             |
| READ UNCOMMITTED | Yes                 | Yes                 | Yes                 |
| READ COMMITTED   | No                  | Yes                 | Yes                 |
| REPEATABLE READ  | No                  | No                  | Yes                 |
| SERIALIZABLE     | No                  | No                  | No                  |