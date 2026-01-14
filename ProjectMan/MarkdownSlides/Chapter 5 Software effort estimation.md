Aug 2024

# Chapter 5 - Software effort estimation

SOFTWARE 

PROJECT MANAGEMENT

# What makes a successful project?

Ch5. Software effort estimation

2

BUT what if the targets are not achievable?

Delivering:

- Agreed functionality on time
- At the agreed cost with the required quality

Stages:

1. Set targets

2. Attempt to achieve targets

# Some problems with estimating

3

- Subjective nature of much of estimating
- It may be difficult to produce evidence to support your precise target
- Political pressures
- Managers may wish to reduce estimated costs in order to win support for acceptance of a project proposal
- Changing technologies
- these bring uncertainties, especially in the early days when there is a ‘learning curve’
- Projects differ
- Experience on one project may not be applicable to another

Ch5. Software effort estimation

# Over and under-estimating

Parkinson’s Law: ‘Work expands to fill the time available’

An over-estimate is likely to cause project to take longer than it would otherwise

Weinberg’s Zeroth Law of reliability: ‘a software project that does not have to meet a reliability requirement can meet any other requirement’

Mar 2021

4

Ch5. Software effort estimation

4

# Basis for successful estimating

5

Information about past projects

- Need to collect performance details about past project: how big were they? How much effort/time did they need?
- Traditional size measurement for software is ‘lines of code’ – but this can have problems

Need to be able to measure the amount of work involved

Ch5. Software effort estimation

# A taxonomy of estimating methods

6

Bottom-up - activity based, analytical

Parametric or algorithmic models e.g. function points

Expert opinion - just guessing?

Analogy - case-based, comparative

Ch5. Software effort estimation

# Bottom-up versus top-down

7

Bottom-up

use when no past project data

- identify all tasks that have to be done – so quite time-consuming
- use when you have no data about similar past projects
- produce overall estimate based on project cost drivers
- based on past project data
- divide overall estimate between jobs to be done

Top-down

Ch5. Software effort estimation

# Bottom-up estimating

8

1. Break project into smaller and smaller components

[2. Stop when you get to what one person can do in one/two weeks]

3. Estimate costs for the lowest level activities

4. At each higher level calculate estimate by adding estimates for lower levels

Ch5. Software effort estimation

# Top-down estimates

Produce overall estimate using effort driver(s)

distribute proportions of overall estimate to components

9

Ch5. Software effort estimation

# Algorithmic/Parametric models

10

<!-- image -->

COCOMO (lines of code) and function points examples of these

Problem with COCOMO etc:

	But what is desired is

Ch5. Software effort estimation

# Parametric models - the need for historical data

11

simplistic model for an estimate

- estimated effort = (system size) / productivity
- system size = lines of code
- productivity = lines of code per day
- based on past projects

e.g.

productivity = (system size) / effort

Ch5. Software effort estimation

# Parametric models

Some models focus on task or system size e.g. Function Points

FPs originally used to estimate Lines of Code, rather than effort

12

model

Number of file types

Numbers of input  and output transaction types

System size

Ch5. Software effort estimation

# Parametric models

Other models focus on productivity: e.g. COCOMO

Lines of code (or FPs etc) an input

13

System size

Productivity factors

Estimated effort

Ch5. Software effort estimation

# Expert judgement

Asking someone who is familiar with and knowledgeable about the application area and the technologies to provide an estimate

Particularly appropriate where existing code is to be modified

Research shows that experts judgement in practice tends to be based on analogy

Attribute values  effort

14

Ch5. Software effort estimation

# Estimating by analogy

Ch3. Step Wise: An approach to planning software projects

15

| attribute values   | effort   |
|--------------------|----------|
| attribute values   | effort   |
| attribute values   | effort   |
| attribute values   | effort   |
| attribute values   | effort   |
| attribute values   | effort   |

source cases

| attribute values   | ?????   |
|--------------------|---------|

Select case  with closet attribute  values

target cases

Use effort from source as  estimate

# Stages: identify

Significant features of the current project

previous project(s) with similar features

differences between the current and previous projects

possible reasons for error (risk)

measures to reduce uncertainty

16

Ch5. Software effort estimation

# Machine assistance for source selection (ANGEL)

Euclidean distance = sq root ((lt-ls)2 + (Ot-Os)2 )

17

Number of outputs

Number of inputs

Source A

Source B

target

Ot-Os

lt-ls

Ch5. Software effort estimation

# Parametric models

We are now looking more closely at four parametric models:

- Albrecht/IFPUG function points
- Symons/Mark II function points
- COSMIC function points
- COCOMO81 and COCOMO II

18

Ch5. Software effort estimation

# Albrecht/IFPUG function points

Albrecht worked at IBM and needed a way of measuring the relative productivity of different programming languages.

Needed some way of measuring the size of an application without counting lines of code.

Identified five types of component or functionality in an information system

Counted occurrences of each type of functionality in order to get an indication of the size of an information system

19

Ch5. Software effort estimation

# Albrecht/IFPUG function points

Five function types:

- Logical interface file (LIF) types – equates roughly to a datastore in systems analysis terms. Created and accessed by the target system
- External interface file types (EIF) – where data is retrieved from a datastore which is actually maintained by a different application

20

Ch5. Software effort estimation

# Albrecht/IFPUG function points 

- External input (EI) types – input transactions which update internal computer files
- External output (EO) types – transactions which extract and display data from internal computer files. Generally involves creating reports.
- External inquiry (EQ) types – user initiated transactions which provide information but do not update computer files. Normally the user inputs some data that guides the system to the information the user needs

21

Ch5. Software effort estimation

# Albrecht complexity multipliers

22

| External user types   |   Low complexity |   Medium complexity |   High complexity |
|-----------------------|------------------|---------------------|-------------------|
| EI                    |                3 |                   4 |                 6 |
| EO                    |                4 |                   5 |                 7 |
| EQ                    |                3 |                   4 |                 6 |
| LIF                   |                7 |                  10 |                15 |
| EIF                   |                5 |                   7 |                10 |

Ch5. Software effort estimation

# Examples

Payroll application has:

- Transaction to input, amend and delete employee details – an EI that is rated of medium complexity
- A transaction that calculates pay details from timesheet data that is input – an EI of high complexity
- A transaction of medium complexity that prints out pay-to-date details for each employee – EO
- A file of payroll details for each employee – assessed as of medium complexity LIF
- A personnel file maintained by another system is accessed for name and address details – a simple EIF

What would be the FP counts for these?

23

Ch5. Software effort estimation

# FP counts

	Medium EI 					4 FPs

	High complexity EI 			6 FPs

	Medium complexity EO 		5 FPs

	Medium complexity LIF 		10 FPs

	Simple EIF 					5 FPs

Total 							30 FPs

	If previous projects delivered 5 FPs a day, implementing the 	above should take 30/5 = 6 days

24

Ch5. Software effort estimation

# Function points Mark II

Developed by Charles R. Symons

‘Software sizing and estimating - Mk II FPA’, Wiley &amp; Sons, 1991.

Builds on work by Albrecht

Work originally for CCTA:

- should be compatible with SSADM; mainly used in UK

has developed in parallel to IFPUG FPs

A simpler method

25

Ch5. Software effort estimation

# Function points Mk II

For each transaction, count

- data items input (Ni )
- data items output (N0)
- entity types accessed (Ne)

26

FP count = Ni * 0.58 + Ne * 1.66 + N0 * 0.26  

#entities accessed

#input items

#output items

Ch5. Software effort estimation

# Function points for embedded systems

Mark II function points, IFPUG function points were designed for information systems environments

COSMIC FPs attempt to extend concept to embedded systems

Embedded software seen as being in a particular ‘layer’ in the system

Communicates with other layers and also other components at same level

27

Ch5. Software effort estimation

# Layered software

28

Receives request

Supplies service

Makes a request for a service

Receives service

Receives storage

peer component

Software component

Higher layers

Lower layers

Data reads/ writes

Peer to peer communication

Ch5. Software effort estimation

# COSMIC FPs

The following are counted:

- Entries: movement of data into software component from a higher layer or a peer component
- Exits: movements of data out
- Reads: data movement from persistent storage
- Writes: data movement to persistent storage

Each counts as 1 ‘COSMIC functional size unit’ (Cfsu)

29

Ch5. Software effort estimation

# COCOMO81

Based on industry productivity standards - database is constantly updated

Allows an organization to benchmark its software development productivity

Basic model

	effort = c x size k

C and k depend on the type of system: organic, semi-detached, embedded

Size is measured in ‘kloc’ ie. Thousands of lines of code

30

Ch5. Software effort estimation

# The COCOMO constants

31

| System type                            |   C |    K |
|----------------------------------------|-----|------|
| Organic (broadly, information systems) | 2.4 | 1.05 |
| Semi-detached                          | 3   | 1.12 |
| Embedded (broadly, real-time)          | 3.6 | 1.2  |

k exponentiation – ‘to the power of…’

adds disproportionately more effort to the larger projects

takes account of bigger management overheads

Ch5. Software effort estimation

# Development effort multipliers (dem)

According to COCOMO, the major productivity drivers include:

- Product attributes: required reliability, database size, product complexity
- Computer attributes: execution time constraints, storage constraints, virtual machine (VM) volatility
- Personnel attributes: analyst capability, application experience, VM experience, programming language experience
- Project attributes: modern programming practices, software tools, schedule constraints:

32

Ch5. Software effort estimation

# Using COCOMO development effort multipliers (dem)

An example: for analyst capability:

- Assess capability as very low, low, nominal, high or very high
- Extract multiplier:
- 		very low 	1.46
- 		low 		1.19
- 		nominal 	1.00
- 		high 		0.80
- 		very high 	0.71
- Adjust nominal estimate e.g. 32.6 x 0.80 = 26.8 staff months

33

Ch5. Software effort estimation

# COCOMO II

An updated version of COCOMO:

- There are different COCOMO II models for estimating at the ‘early design’ stage and the ‘post architecture’ stage when the final system is implemented. We’ll look specifically at the first.
- The core model is:
- 	pm = A(size)(sf) ×(em1) ×(em2) ×(em3)….
- 	where pm = person months, A is 2.94, size is number of 	thousands of lines of code, sf is the scale factor, and em is 	an effort multiplier

34

Ch5. Software effort estimation

# COCOMO II Scale factor

Based on five factors which appear to be particularly sensitive to system size

Precedentedness (PREC). Degree to which there are past examples that can be consulted

Development flexibility (FLEX). Degree of flexibility that exists when implementing the project

Architecture/risk resolution (RESL). Degree of uncertainty about requirements

Team cohesion (TEAM).

Process maturity (PMAT) could be assessed by CMMI – see Section 13.8

35

Ch5. Software effort estimation

# COCOMO II Scale factor values

36

| Driver   |   Very low |   low |   Nom-inal |   High |   Very high |   Extra high |
|----------|------------|-------|------------|--------|-------------|--------------|
| PREC     |       6.2  |  4.92 |       3.72 |   2.48 |        1.24 |            0 |
| FLEX     |       5.07 |  4.05 |       3.04 |   2.03 |        1.01 |            0 |
| RESL     |       7.07 |  5.65 |       4.24 |   2.83 |        1.41 |            0 |
| TEAM     |       5.48 |  4.38 |       3.29 |   2.19 |        1.1  |            0 |
| PMAT     |       7.8  |  6.24 |       4.68 |   3.12 |        1.56 |            0 |

Ch5. Software effort estimation

# Example of scale factor

A software development team is developing an application which is very similar to previous ones it has developed.

A very precise software engineering document lays down very strict requirements. PREC is very high (score 1.24).

FLEX is very low (score 5.07).

The good news is that these tight requirements are unlikely to change (RESL is high with a score 2.83).

The team is tightly knit (TEAM has high score of 2.19), but processes are informal (so PMAT is low and scores 6.24)

37

Ch5. Software effort estimation

# Scale factor calculation

The formula for sf is

	sf = B + 0.01× Σ scale factor values

	i.e. sf = 0/91 + 0.01

	× (1.24 + 5.07 + 2.83 + 2.19 + 6.24)

	= 1.0857

If system contained 10 kloc then estimate would be 2.94 x 101.0857 = 35.8 person months

Using exponentiation (‘to the power of’) adds disproportionately more to the estimates for larger applications

38

Ch5. Software effort estimation

# Effort multipliers

As well as the scale factor effort multipliers are also assessed:

- RCPX 		Product reliability and complexity
- RUSE 		Reuse required
- PDIF 		Platform difficulty
- PERS 		Personnel capability
- FCIL 		Facilities available
- SCED 		Schedule pressure

39

Ch5. Software effort estimation

# Effort multipliers

40

|       | Extra low   | Very low   |   low |   Nom-inal |   High |   Very high | Extra high   |
|-------|-------------|------------|-------|------------|--------|-------------|--------------|
| RCPX  | 0.49        | 0.60       |  0.83 |          1 |   1.33 |        1.91 | 2.72         |
| RUSE  |             |            |  0.95 |          1 |   1.07 |        1.15 | 1.24         |
| PDIF  |             |            |  0.87 |          1 |   1.29 |        1.81 | 2.61         |
| PPERS | 2.12        | 1.62       |  1.26 |          1 |   0.83 |        0.63 | 0.50         |
| PREX  | 1.59        | 1.33       |  1.12 |          1 |   0.87 |        0.74 | 0.62         |
| FCIL  | 1.43        | 1.30       |  1.1  |          1 |   0.87 |        0.73 | 0.62         |
| SCED  |             | 1.43       |  1.14 |          1 |   1    |        1    |              |

Ch5. Software effort estimation

# Example

Say that a new project is similar in most characteristics to those that an organization has been dealing for some time:

except:

- the software to be produced is exceptionally complex and will be used in a safety critical system.
- The software will interface with a new operating system that is currently in beta status.
- To deal with this the team allocated to the job are regarded as exceptionally good, but do not have a lot of experience on this type of software.

41

Ch5. Software effort estimation

# Example

RCPX 		very high 		1.91

PDIF 		very high 		1.81

PERS 		extra high 		0.50

PREX 		nominal 		1.00

All other factors are nominal

Say estimate is 35.8 person months

With effort multipliers this becomes 35.8 x 1.91 x 1.81 x 0.5 = 61.9 person months

42

Ch5. Software effort estimation

# Some conclusions: how to review estimates

Ask the following questions about an estimate

- What are the task size drivers?
- What productivity rates have been used?
- Is there an example of a previous project of about the same size?
- Are there examples of where the productivity rates used have actually been found?

43

Ch5. Software effort estimation