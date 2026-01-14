Aug 2024

# Chapter 04 – Selection of an appropriate project approach

SOFTWARE 

PROJECT MANAGEMENT

# Outline of lecture

Ch4. Selection of an appropriate project approach

2

Building versus buying software 

Taking account of the characteristics of the project 

Process models 

- Waterfall 
- Prototyping and iterative approaches 
- Incremental delivery 

Agile approaches

# Selection of project approaches

Ch4. Selection of an appropriate project approach

3

This lecture concerned with choosing the right approach to a particular project: variously called technical planning, project analysis, methods engineering and methods tailoring

In-house: often the methods to be used dictated by organizational standards

Suppliers: need for tailoring as different customers have different needs

# Build or buy?

Ch4. Selection of an appropriate project approach

4

In-house development

Outsource

Build

Buy

Yes

No

Either

# Some advantages of off-the-shelf (OTS) software

Mar 2021

Ch4. Selection of an appropriate project approach

5

Cheaper as supplier can spread development costs over a large number of customers 

Software already exists 

- Can be trialled by potential customer 
- No delay while software being developed 

Where there have been existing users, bugs are likely to have been found and eradicated

5

# Some possible disadvantages of off-the- shelf

Customer will have same application as everyone else: no competitive advantage, but competitive advantage may come from the way application is used 

Customer may need to change the way they work in order to fit in with OTS application 

Customer does not own the code and cannot change it 

Danger of over-reliance on a single supplier

Ch4. Selection of an appropriate project approach

6

# General approach

Ch4. Selection of an appropriate project approach

7

Look at risks and uncertainties e.g.

- are requirement well understood? 
- are technologies to be used well understood?
- information system? embedded system? 
- criticality? differences between target and development environments?
- need to use a particular method

Look at the type of application being built e.g.

Clients’ own requirements

# Structure versus speed of delivery

Ch4. Selection of an appropriate project approach

8

Structured approach 

Also called ‘heavyweight’ approaches 

Step-by-step methods where each step and intermediate product is carefully defined 

Emphasis on getting quality right first time 

Example: use of UML and USDP 

Future vision: Model-Driven Architecture (MDA). UML supplemented with Object Constraint Language, press the button and application code generated from the UML/OCL model

# Structure versus speed of delivery

Ch4. Selection of an appropriate project approach

9

Agile methods 

Emphasis on speed of delivery rather than documentation 

RAD Rapid application development emphasized use of quickly developed prototypes 

JAD Joint application development. Requirements are identified and agreed in intensive workshops with users

# Choice of process models

Ch4. Selection of an appropriate project approach

10

- ‘waterfall’ also known as ‘one-shot’, ‘once-through’
- incremental delivery
- evolutionary development

Also use of ‘agile methods’ e.g. extreme programming

# Waterfall

Ch4. Selection of an appropriate project approach

11

# Waterfall

Ch4. Selection of an appropriate project approach

12

- the ‘classical’ model
- imposes structure on the project
- every stage needs to be checked and signed off
- BUT
- limited scope for iteration
- V model approach is an extension of waterfall where different testing phases are identified which check the quality of different development phases

# evolutionary delivery: prototyping

‘An iterative process of creating quickly and inexpensively live and working models to test out requirements and assumptions’

Sprague and McNurlin

main types

‘throw away’ prototypes

evolutionary prototypes

what is being prototyped?

human-computer interface

functionality

Ch4. Selection of an appropriate project approach

13

# reasons for prototyping

- learning by doing
- improved communication
- improved user involvement
- a feedback loop is established
- reduces the need for documentation
- reduces maintenance costs i.e. changes after the application goes live
- prototype can be used for producing expected results

Ch4. Selection of an appropriate project approach

14

# prototyping: some dangers

Ch4. Selection of an appropriate project approach

15

users may misunderstand the role of the prototype

lack of project control and standards possible

additional expense of building prototype

focus on user-friendly interface could be at expense of machine efficiency

# other ways of categorizing prototyping

Ch4. Selection of an appropriate project approach

16

what is being learnt? 

- organizational prototype 
- hardware/software prototype (‘experimental’) 
- application prototype (‘exploratory’) 
- mock-ups 
- simulated interaction 
- partial working models: vertical versus horizontal

to what extent 

# Incremental delivery

Figure 3: Incremental delivery approach

Ch4. Selection of an appropriate project approach

17

<!-- image -->

# the incremental process

Ch4. Selection of an appropriate project approach

18

Figure 4: Intentional incremental delivery

# incremental approach:benefits

Ch4. Selection of an appropriate project approach

19

feedback from early stages used in developing latter stages

shorter development thresholds 

user gets some benefits earlier

project may be put aside temporarily

reduces ‘gold-plating’:

BUT there are some possible disadvantages

loss of economy of scale

‘software breakage’

# the outline incremental plan

Ch4. Selection of an appropriate project approach

20

Steps ideally 1% to 5% of the total project

Non-computer steps should be included

ideal if a step takes one month or less: 

- not more than three months

each step should deliver some benefit to the user

some steps will be physically dependent on others

# which step first?

Ch4. Selection of an appropriate project approach

21

- some steps will be pre-requisite because of physical dependencies
- others may be in any order
- value to cost ratios may be used
- V/C where
- V is a score 1-10 representing value to customer
- C is a score 0-10 representing value to developers

# V/C ratios: an example

Ch4. Selection of an appropriate project approach

22

| Step                            |   Value |   Cost |   Ratio |     |
|---------------------------------|---------|--------|---------|-----|
| Profit reports                  |       9 |      1 |    9    | 2nd |
| Online database                 |       1 |      9 |    0.11 | 5th |
| Ad hoc enquiry                  |       5 |      5 |    1    | 4th |
| Purchasing plans                |       9 |      4 |    2.25 | 3rd |
| Profit – based pay for managers |       9 |      0 |  inf    | 1st |

# ‘Agile’ methods

Ch4. Selection of an appropriate project approach

23

structured development methods have some perceived 

Advantages

- produce large amounts of documentation which can be unread
- documentation has to be kept up to date
- division into specialist groups and need to follow procedures stifles communication
- users can be excluded from decision process
- long lead times to deliver anything etc. etc 

The answer? Agile methods?

# Atern/Dynamic system development method (DSDM)

Ch4. Selection of an appropriate project approach

24

UK-based consortium

arguably DSDM can be seen as replacement for SSADM

DSDM is more a project management approach than a development approach 

Can still use DFDs, LDSs etc!

An update of DSDM has been badged as ‘Atern’

# Six core Atern/DSDM principles

Ch4. Selection of an appropriate project approach

25

1. Focus on business need 
2. Delivery on time – use of time-boxing 
3. Collaborate 
4. Never compromise qualitiy 
5. Deliver iteratively 
6. Build incrementally

# Atern/DSDM framework

Ch4. Selection of an appropriate project approach

26

# Atern DSDM: time-boxing

Ch4. Selection of an appropriate project approach

27

- time-box fixed deadline by which something has to be delivered
- typically two to six weeks
- MOSCOW priorities 
- Must have - essential
- Should have - very important, but system could operate without
- Could have
- Want - but probably won’t get!

# Extreme programming

Ch4. Selection of an appropriate project approach

28

- increments of one to three weeks
- customer can suggest improvement at any point
- argued that distinction between design and building of software are artificial
- code to be developed to meet current needs only
- frequent re-factoring to keep code structured

# extreme programming - contd

Ch4. Selection of an appropriate project approach

29

- developers work in pairs
- test cases and expected results devised before software design
- after testing of increment, test cases added to a consolidated set of test cases

# Limitations of extreme programming

Ch4. Selection of an appropriate project approach

30

Reliance on availability of high quality developers

Dependence on personal knowledge – after development knowledge of software may decay making future development less easy

Rationale for decisions may be lost e.g. which test case checks a particular requirement

Reuse of existing code less likely

# Grady Booch’s concern

Ch4. Selection of an appropriate project approach

31

Booch, an OO authority, is concerned that with requirements driven projects: 

‘Conceptual integrity sometimes suffers because this is little motivation to deal with scalability, extensibility, portability, or reusability beyond what any vague requirement might imply’

 Tendency towards a large number of discrete functions with little common infrastructure?

# macro and micro processes

Ch4. Selection of an appropriate project approach

32

# combinations of approach

Ch4. Selection of an appropriate project approach

33

|              | One-shot   | Incremental   | Evolutionary   |
|--------------|------------|---------------|----------------|
| One-shot     | Yes        | Yes           | No             |
| Incremental  | Yes        | Yes           | No             |
| Evolutionary | Yes        | Yes           | Yes            |

installation

construction

one-shot or incremental installation - any construction approach possible 

evolutionary installation implies evolutionary construction

# ‘rules of thumb’ about approach to be used

Ch4. Selection of an appropriate project approach

34

IF uncertainty is high  	THEN use evolutionary approach 

IF complexity is high but uncertainty is not  	THEN use incremental approach 

IF uncertainty and complexity both low  	THEN use one-shot 

IF schedule is tight  	THEN use evolutionary or incremental