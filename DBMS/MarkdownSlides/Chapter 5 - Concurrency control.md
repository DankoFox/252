## Chapter 5

## Concurrency Control Techniques

Adapted from the slides of 'Fundamentals of Database Systems' (Elmasri et al., 2006)

## Chapter Outline

- n Purpose of Concurrency Control
- n Two-Phase Locking Techniques
- n Concurrency Control Based on Timestamp Ordering
- n Multi-version Concurrency Control Techniques
- n Validation (Optimistic) Concurrency Control Techniques
- n Granularity of Data Items And Multiple Granularity Locking

## 1. Purpose of Concurrency Control

- n To enforce Isolation (through mutual exclusion) among conflicting transactions.
- n To preserve database consistency through consistency preserving execution of transactions.
- n To resolve read-write and write-write conflicts.

## n Example:

- q In concurrent execution environment: if T1 conflicts with T2 over a data item A
- q Then the concurrency control decides if T1 or T2 should get the A and if the other transaction is rolled-back or waits.

## 2. Two-Phase Locking Techniques (1)

- n Locking is an operation which secures
- q (a) permission to Read
- q (b) permission to Write a data item for a transaction.
- n Example:
- q Lock (X).  Data item X is locked on behalf of the requesting transaction.
- n Unlocking is an operation which removes these permissions from the data item.
- n Example:
- q Unlock (X): Data item X is made available to all other transactions.
- n Lock and Unlock are Atomic operations.

## Two-Phase Locking Techniques (2)

- n Database requires that all transactions should be well-formed.  A transaction is wellformed if:
- q It must lock the data item before it reads or writes to it.
- q It must not lock an already locked data items and it must not try to unlock a free data item.

## Two-Phase Locking Techniques (3)

- n Type of Locks:
- q Binary Locks
- q Shared/ Exclusive (or Read/ Write) Locks

## Two-Phase Locking Techniques (4)

- n Binary Locks
- q 2 values: locked and unlocked (1 and 0) q The following code performs the lock operation: B: if LOCK (X) = 0 (*item is unlocked*) then LOCK (X)  1 (*lock the item*) else begin wait (until lock (X) = 0) and the lock manager wakes up the transaction); goto B end;

## Two-Phase Locking Techniques (5)

- n Binary Locks
- q The following code performs the unlock operation:

LOCK (X)  0 (*unlock the item*) if any transactions are waiting then wake up one of the waiting transactions;

## Two-Phase Locking Techniques (6)

## n Binary Locks

- q Rules:
1. A transaction T must issue the operation lock\_item( X ) before any read\_item( X ) or write\_item( X ) operations in T.
2. A transaction T must issue the operation unlock\_item( X ) after all read\_item( X ) and write\_item( X ) operations are completed in T.
3. A transaction T will not issue a lock\_item( X ) operation if it already holds the lock on item X .
4. A transaction T will not issue an unlock\_item( X ) operation unless it already holds the lock on item X .

## Two-Phase Locking Techniques (7)

- n Shared/ Exclusive (or Read/ Write) Locks
- q Two locks modes:
- n (a) shared (read) (b) exclusive (write).
- q Shared mode: read lock (X)
- n More than one transaction can apply share lock on X for reading its value but no write lock can be applied on X by any other transaction.
- q Exclusive mode: write lock (X)
- n Only one write lock on X can exist at any time and no shared lock can be applied by any other transaction on X.

## Two-Phase Locking Techniques (8)

- n Shared/ Exclusive (or Read/ Write) Locks
- q Lock Manager:
- n Managing locks on data items.
- q Lock table:
- n Lock manager uses it to store the identity of transaction locking the data item, lock mode and pointer to the next data item locked. One simple way to implement a lock table is through linked list.

| Transaction ID   | Data item id   | lock mode   | Ptr to next data item   |
|------------------|----------------|-------------|-------------------------|
| T1               | X1             | Read        | Next                    |

## Two-Phase Locking Techniques (9)

- n Shared/ Exclusive (or Read/ Write) Locks
- q The following code performs the read lock operation:

```
B: if LOCK (X) = 'unlocked' then begin LOCK (X)  'read-locked'; no_of_reads (X)  1; end else if LOCK (X)  'read-locked' then no_of_reads (X)  no_of_reads (X) +1; else begin wait (until LOCK (X) = 'unlocked' and the lock manager wakes up the transaction); go to B; end;
```

## Two-Phase Locking Techniques (10)

- n Shared/ Exclusive (or Read/ Write) Locks
- q The following code performs the write lock operation:

```
B: if LOCK(X) = 'unlocked' then LOCK(X) ← 'write-locked' else begin wait (until LOCK(X) = 'unlocked' and the lock manager wakes up the transaction); go to B end;
```

## Two-Phase Locking Techniques (11)

## n Shared/ Exclusive (or Read/ Write) Locks

- q The following code performs the unlock operation:

```
if LOCK (X) = 'write-locked' then begin LOCK (X)  'unlocked'; wakes up one of the transactions, if any end else if LOCK (X)  'read-locked' then begin no_of_reads (X)  no_of_reads (X) -1 if  no_of_reads (X) = 0 then begin LOCK (X) = 'unlocked'; wake up one of the transactions, if any end
```

## Two-Phase Locking Techniques (12)

- n Shared/ Exclusive (or Read/ Write) Locks
- q Rules:
1. A transaction T must issue the operation read\_lock(X) or write\_lock(X) before any read\_item(X) operation is performed in T .
2. A transaction T must issue the operation write\_lock(X) before any write\_item(X) operation is performed in T .
3. A transaction T must issue the operation unlock(X) after all read\_item(X) and write\_item(X) operations are completed in T .

## Two-Phase Locking Techniques (13)

- n Shared/ Exclusive (or Read/ Write) Locks
- q Rules (cont.):
4. A transaction T must not issue a read\_lock(X) operation if it already holds a read(shared) lock or a write(exclusive) lock on item X .
5. A transaction T must not issue a write\_lock(X) operation if it already holds a read(shared) lock or a write(exclusive) lock on item X .
6. A transaction T must not issue the operation unlock(X) unless it already holds a read (shared) lock or a write(exclusive) lock on item X .

## Two-Phase Locking Techniques (14)

- n Shared/ Exclusive (or Read/ Write) Locks
- q Lock conversion
- n Lock upgrade : existing read lock to write lock
- n Lock downgrade : existing write lock to read lock Ti has a write-lock (X)   (*no transaction can have any lock on X*) convert write-lock (X) to read-lock (X)

```
if T i has a read-lock (X) and T j has no read-lock (X) (i  j) then convert read-lock (X) to write-lock (X) else force Ti to wait until T j unlocks X
```

## Two-Phase Locking Techniques (15)

## n Two-Phase Locking

- q Two Phases:
- n (a) Locking (Growing)
- n (b) Unlocking (Shrinking).

## q Locking (Growing) Phase:

- n A transaction applies locks (read or write) on desired data items one at a time.

## q Unlocking (Shrinking) Phase:

- n A transaction unlocks its locked data items one at a time.

## q Requirement:

- n For a transaction these two phases must be mutually exclusively, that is, during locking phase unlocking phase must not start and during unlocking phase locking phase must not begin.

## Two-Phase Locking Techniques (16)

## n Two-Phase Locking

<!-- image -->

Initialvalues:X=20,Y=30

Result serial scheduleT followedbyT2:X=50,Y=80

Result of serial schedule T2 followedbyT:X=70,Y=50

## Two-Phase Locking Techniques (17)

## n Two-Phase Locking

Time

<!-- image -->

| T                                                              | T2                                                                                                    |
|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| read_lock(Y); read_item(Y); unlock(Y);                         | read_lock(x); read_item(X); unlock(x); write_lock(Y); read_item(Y); Y:=X+Y; write_item(Y); unlock(Y); |
| write_lock(X); read_item(X): X:=X+Y; write_item(X); unlock(X); |                                                                                                       |

Result of schedule S: X=50,Y=50 (nonserializable)

## Two-Phase Locking Techniques (18)

## n Two-Phase Locking

```
T readlock(Y): read_item(Y): write_lock(X); unlock(Y) read_item(X): X:=X+Y: write_item(X); unlock(X);
```

T2 read\_lock(X): read\_item(X); write\_lock(Y); unlock(x) read\_item(Y); Y:=X+Y; write\_item(Y): unlock(Y);

T1' and T2' follow two-phase policy but they are subject to deadlock, which must be dealt with.

## T'1

```
read_lock (Y); read_item (Y); write_lock (X); unlock (Y); read_item (X); X:=X+Y; write_item (X); unlock (X);
```

## T'2

read\_lock (X);

wait

```
read_lock (X); read_item (X); write_lock (Y); unlock (X); read_item (Y); Y:=X+Y; write_item (Y); unlock (Y);
```

Guaranteed to be serializable

## Can produce a deadlock

```
T'1 T'2 read_lock (Y); read_item (Y); read_lock (X); read_item (X); write_lock (X); write_lock (Y); unlock (X); read_item (Y); Y:=X+Y; write_item (Y); unlock (Y); unlock (Y); read_item (X); X:=X+Y; write_item (X); unlock (X); Deadlock
```

## Two-Phase Locking Techniques (19)

- n Two-Phase Locking
- q Variations:
- n (a) Basic
- n (b) Conservative
- n (c) Strict
- n (d) Rigorous

## q Basic :

- n Transaction locks data items incrementally. This may cause deadlock which is dealt with.

## q Conservative :

- n Prevents deadlock by locking all desired data items before transaction begins execution.

## Two-Phase Locking Techniques (20)

## n Two-Phase Locking

## q Strict :

- n A transaction T does not release any of its exclusive (write) locks until after it commits or aborts.
- n The most commonly used two-phase locking algorithm.

## q Rigorous:

- n A Transaction T does not release any of its locks (Exclusive or shared) until after it commits or aborts.

## Two-Phase Locking Techniques (21)

- n Dealing with Deadlock and Starvation
- q Deadlock
- T' 1 T' 2 read\_lock (Y); read\_item (Y); read\_lock (X); write\_lock (X); (waits for X) (waits for Y) q Deadlock (T'1 and T' )

T' 1 and T' 2 did follow two-phase policy but they are deadlock read\_item (Y); write\_lock (Y); 2

## Two-Phase Locking Techniques (22)

- n Dealing with Deadlock and Starvation
- q Deadlock prevention
- n A transaction locks all data items it refers to before it begins execution.
- n This way of locking prevents deadlock since a transaction never waits for a data item.
- n The conservative two-phase locking uses this approach.

## Two-Phase Locking Techniques (23)

- n Dealing with Deadlock and Starvation
- q Deadlock detection and resolution
- n In this approach, deadlocks are allowed to happen.
- n The scheduler maintains a wait-for-graph for detecting cycle.
- n If a cycle exists, then one transaction involved in the cycle is selected (victim) and rolled-back.

## Two-Phase Locking Techniques (24)

## n Dealing with Deadlock and Starvation

## q Deadlock detection and resolution

- n A wait-for-graph:
- q One node is for each transaction that is currently executing.
- q Whenever a transaction Ti is waiting to lock an item X that is currently locked by a transaction Tj , a directed edge ( Ti → Tj ) is created.
- q When Tj releases the lock(s) on the items that Ti was waiting for, the directed edge is dropped.
- q We have a state of deadlock if and only if the wait-for graph has a cycle.
- n When the system should check for a deadlock?

## Two-Phase Locking Techniques (25)

T ' 1

T ' 2

read\_lock (Y); read\_item (Y); read\_lock (X); read\_item (X); write\_lock (X); (waits for X) write\_lock (Y);

(waits for Y)

- a) Partial schedule of T' 1 and T' 2

<!-- image -->

b) wait-for graph

## Two-Phase Locking Techniques (26)

## n Dealing with Deadlock and Starvation

- q Deadlock avoidance
- n There are many variations of two-phase locking algorithm.
- n Some avoid deadlock by not letting the cycle to complete.
- n That is as soon as the algorithm discovers that blocking a transaction is likely to create a cycle, it rolls back the transaction.
- n Wound-Wait and Wait-Die algorithms use timestamps to avoid deadlocks by rolling-back victim.

## Two-Phase Locking Techniques (27)

- n Dealing with Deadlock and Starvation
- q Deadlock avoidance
- n Timestamp:
- q TS(T)
- q A unique identifier assigned to each transaction.
- q Typically based on the order in which transactions are started
- q If transaction T 1 starts before transaction T 2 , then TS( T 1 ) &lt; TS( T 2 ). Notice that the older transaction (which starts first) has the smaller timestamp value.

## Two-Phase Locking Techniques (28)

## n Dealing with Deadlock and Starvation

- q Deadlock avoidance

## n Wait-die :

- q If TS( Ti ) &lt; TS( Tj ), then ( Ti older than Tj ) Ti is allowed to wait.
- q Otherwise ( Ti younger than Tj ) abort Ti ( Ti dies ) and restart it later with the same timestamp .

## n Wound-wait :

- q If TS( Ti ) &lt; TS( Tj ), then ( Ti older than Tj ) abort Tj ( Ti wounds Tj ) and restart it later with the same timestamp.
- q Otherwise ( Ti younger than Tj ) Ti is allowed to wait.

## Two-Phase Locking Techniques (29)

## n Dealing with Deadlock and Starvation

## n Starvation

- q Starvation occurs when a particular transaction consistently waits or restarted and never gets a chance to proceed further.
- q In a deadlock resolution it is possible that the same transaction may consistently be selected as victim and rolled-back.
- q This limitation is inherent in all priority based scheduling mechanisms.
- q Wound-Wait and wait-die scheme can avoid starvation.

## 3. Concurrency Control Based on Timestamp Ordering (1)

- n Timestamp
- q A monotonically increasing variable (integer) indicating the age of an operation or a transaction. A larger timestamp value indicates a more recent event or operation.
- q Timestamp based algorithm uses timestamp to serialize the execution of concurrent transactions.

## Concurrency Control Based on Timestamp Ordering (2)

- n Timestamp
- q The algorithm associates with each database item X with two timestamp (TS) values:
- n Read\_TS ( X ): The read timestamp of item X ; this is the largest timestamp among all the timestamps of transactions that have successfully read item X .
- n Write\_TS ( X ):The write timestamp of item X ; this is the largest timestamp among all the timestamps of transactions that have successfully written item X .

## Concurrency Control Based on Timestamp Ordering (3)

- n Basic Timestamp Ordering
- q 1.  Transaction T issues a write\_item(X) operation:
- n (a) If read\_TS(X) &gt; TS(T) or if write\_TS(X) &gt; TS(T)
- q an younger transaction has already read the data item
- q abort and roll-back T with a new timestamp and reject the operation.
- n (b) If the condition in part (a) does not exist, then execute write\_item(X) of T and set write\_TS(X) to TS(T).
- q 2.  Transaction T issues a read\_item(X) operation:
- n (a) If write\_TS(X) &gt; TS(T)
- q an younger transaction has already written to the data item
- q abort and roll-back T with a new timestamp and reject the operation.
- n (b) If write\_TS(X)  TS(T), then execute read\_item(X) of T and set read\_TS(X) to the larger of (TS(T) and the current read\_TS(X) )

## Example:Three transactions executing under a timestamp-based scheduler

| T1                | T2                | T3          | A               | B               | C         |
|-------------------|-------------------|-------------|-----------------|-----------------|-----------|
| 200               | 150               | 175         | RT =0 WT=0      | RT = 0 WT=0     | RT=0 WT=0 |
| r1(B) w1(B) w1(A) | r2(A) w2(C) Abort | r3(C) w3(A) | RT = 150 WT=200 | RT = 200 WT=200 | RT=175    |

Why T2 must be aborted (rolled-back)?

## Concurrency Control Based on Timestamp Ordering (4)

- n Strict Timestamp Ordering
- q 1.  Transaction T issues a write\_item(X) operation:
- n If TS(T) &gt; write\_TS(X), then delay T until the transaction T' that wrote X has terminated (committed or aborted).
- q 2.  Transaction T issues a read\_item(X) operation:
- n If TS(T) &gt; write\_TS(X), then delay T until the transaction T' that wrote X has terminated (committed or aborted).
- q Ensures the schedules are both strict and conflict serializable

## Concurrency Control Based on Timestamp Ordering (5)

## n Thomas's Write Rule

Modify the checks for the write\_item(X) operation:

- q 1. If read\_TS(X) &gt; TS(T) then abort and roll-back T and reject the operation.
- q 2. If write\_TS(X) &gt; TS(T), then just ignore the write operation and continue execution because it is already outdated and obsolete.
- q If the conditions given in 1 and 2 above do not occur, then execute write\_item(X) of T and set write\_TS(X) to TS(T).

## 4. Multiversion Concurrency Control

## Techniques (1)

- n This approach maintains a number of versions of a data item and allocates the right version to a read operation of a transaction. Thus unlike other mechanisms a read operation in this mechanism is never rejected.
- n Side effect:
- q Significantly more storage (RAM and disk) is required to maintain multiple versions.
- q To check unlimited growth of versions, a garbage collection is run when some criteria is satisfied.

## Multiversion Concurrency Control Techniques (2)

## n Multiversion technique based on timestamp ordering

- q Assume X1, X2, …, Xn are the version of a data item X created by a write operation of transactions.  With each X i a read\_TS (read timestamp) and a write\_TS (write timestamp) are associated.
- q read\_TS(Xi) :  The read timestamp of Xi is the largest of all the timestamps of transactions that have successfully read version Xi .
- q write\_TS(Xi) :  The write timestamp of Xi is the timestamps of the transaction hat wrote the value of version X i .
- q A new version of Xi is created only by a write operation.

## Multiversion Concurrency Control Techniques (3)

- n Multiversion technique based on timestamp ordering

To ensure serializability, the following two rules are used:

1. If transaction T issues write\_item (X) and version i of X has the highest write\_TS(Xi) of all versions of X that is also less than or equal to TS(T), and read \_TS(Xi ) &gt; TS(T), then abort and roll-back T; otherwise create a new version Xi and read\_TS(X) = write\_TS(Xj) = TS(T).
2. If transaction T issues read\_item (X), find the version i of X that has the highest write\_TS(X i ) of all versions of X that is also less than or equal to TS(T), then return the value of X i to T, and set the value of read \_TS(Xi ) to the largest of TS(T) and the current read\_TS(Xi).
3. q Rule 2 guarantees that a read will never be rejected.

## Example: Execution of transactions using multiversion concurrency control

| T1          | T2          | T3    | T4    | A 0   | A 150            | A 200       |
|-------------|-------------|-------|-------|-------|------------------|-------------|
| 150         | 200         | 175   | 225   |       |                  |             |
| r1(A) w1(A) | r2(A) w2(A) | r3(A) | r4(A) | read  | Create Read read | Create read |

Note: T3 does not have to abort, because it can read an earlier version of A.

## Multiversion Concurrency Control Techniques (4)

## Multiversion Two-Phase Locking Using Certify Locks

## n Concept:

- q Allow a transaction T' to read a data item X while it is write locked by a conflicting transaction T.
- q This is accomplished by maintaining two versions of each data item X
- n One version must always have been written by some committed transaction.  This means a write operation always creates a new version of X.
- n The second version created when a transaction acquires a write lock an the item.

## Multiversion Concurrency Control Techniques (5)

## Multiversion Two-Phase Locking Using Certify Locks

## n Steps:

1. X is the committed version of a data item.
2. T creates a second version X' after obtaining a write lock on X.
3. Other transactions continue to read X.
4. T is ready to commit so it obtains a certify lock on X'.
5. The committed version X becomes X'.
6. T releases its certify lock on X', which is X now.

Compatibility tables for

|       |     |    |         | Read   | Write   | Certify   |
|-------|-----|----|---------|--------|---------|-----------|
| Read  | Yes | No | Write   | Yes    | No      | No        |
| Write | No  | No | Certify | No     | No      | No        |

## Multiversion Concurrency Control Techniques (6)

## Multiversion Two-Phase Locking Using Certify Locks

- n Note:
- q In multiversion 2PL read and write operations from conflicting transactions can be processed concurrently.
- q This improves concurrency but it may delay transaction commit because of obtaining certify locks on all its writes.  It avoids cascading abort but like strict two phase locking scheme conflicting transactions may get deadlocked.

## 5. Validation (Optimistic) Concurrency Control Techniques (1)

- n In this technique only at the time of commit serializability is checked and transactions are aborted in case of nonserializable schedules.
- n Three phases:
1. Read phase
2. Validation phase
3. Write phase

## 1. Read phase :

- q A transaction can read values of committed data items. However, updates are applied only to local copies (versions) of the data items (in database cache).

## Validation (Optimistic) Concurrency Control Techniques (2)

2. Validation phase : Serializability is checked before transactions write their updates to the database.
2. q This phase for T i checks that, for each transaction T j that is either committed or is in its validation phase, one of the following conditions holds:
1. Tj completes its write phase before T i starts its read phase.
2. Ti starts its write phase after T j completes its write phase, and the read\_set of T i has no items in common with the write\_set of Tj
3. Both the read\_set and write\_set of Ti have no items in common with the write\_set of T j , and T j completes its read phase before T i completes its read phase.
6. n The first condition is checked first for each transaction T j . If (1) is false then (2) is checked and if (2) is false then (3 ) is checked.  If none of these conditions holds,  fails and Ti is aborted.

## Validation (Optimistic) Concurrency Control Techniques (3)

3. Write phase : On a successful validation transactions' updates are applied to the database; otherwise, transactions are restarted.

## 6. Granularity of Data Items And Multiple Granularity Locking (1)

- n A lockable unit of data defines its granularity. Granularity can be coarse (entire database) or it can be fine (a tuple or an attribute of a relation).
- n Data item granularity significantly affects concurrency control performance . Thus, the degree of concurrency is low for coarse granularity and high for fine granularity.
- n Example of data item granularity:
1. A field of a database record (an attribute of a tuple)
2. A database record (a tuple or a relation)
3. A disk block
4. An entire file
5. The entire database

## Granularity of data items and Multiple Granularity Locking (2)

- n The following diagram illustrates a hierarchy of granularity from coarse (database) to fine (record).

<!-- image -->

## Granularity of data items and Multiple Granularity Locking (3)

- n To manage such hierarchy, in addition to read and write, three additional locking modes, called intention lock modes are defined:
- q Intention-shared (IS) : indicates that a shared lock(s) will be requested on some descendent nodes(s).
- q Intention-exclusive (IX) : indicates that an exclusive lock(s) will be requested on some descendent node(s).
- q Shared-intention-exclusive (SIX) : indicates that the current node is locked in shared mode but an exclusive lock(s) will be requested on some descendent nodes(s).

## Granularity of data items and Multiple Granularity Locking (4)

- n These locks are applied using the following compatibility matrix:

<!-- image -->

|     | IS   | IX   | S   | SIX   | X   |
|-----|------|------|-----|-------|-----|
| IS  | Yes  | Yes  | Yes | Yes   | No  |
| IX  | Yes  | Yes  | No  | No    | No  |
| S   | Yes  | No   | Yes | No    | No  |
| SIX | Yes  | No   | No  | No    | No  |
| X   | No   | No   | No  | No    | No  |

Intention-shared (IS Intention-exclusive (IX) Shared-intentionexclusive (SIX)

## Granularity of data items and Multiple Granularity Locking (5)

- n The set of rules which must be followed for producing serializable schedule:
1. The lock compatibility must adhered to.
2. The root of the tree must be locked first, in any mode.
3. A node N can be locked by a transaction T in S or IX mode only if the parent node is already locked by T in either IS or IX mode.
4. A node N can be locked by T in X, IX, or SIX mode only if the parent of N is already locked by T in either IX or SIX mode.
5. T can lock a node only if it has not unlocked any node (to enforce 2PL policy).
6. T can unlock a node, N, only if none of the children of N are currently locked by T.

## Granularity of data items and Multiple Granularity Locking (6)

- n An example of a serializable execution:

<!-- image -->

## Granularity of data items and Multiple Granularity Locking (7)

- n An example of a serializable execution (continued):

| T,                                                                             | T2                               | Ta              |
|--------------------------------------------------------------------------------|----------------------------------|-----------------|
| unlock(r21) unlock(p21) unlock(f) unlock(r+1) unlock(p1) unlock(f,) unlock(db) | unlock(p12) unlock(f) unlock(db) | S(f) unlock(r1) |