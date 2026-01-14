Aug 2024

# Chapter 13.2 - software product quality

SOFTWARE 

PROJECT MANAGEMENT

# BS EN ISO 9001:2000 and quality management systems

Ch13.2. software product quality

2

ISO 9001 is one of a family of standards that specify the characteristics of a good quality management system (QMS)

Can be applied to the creation of any type of product or service, not just IT and software 

Does NOT set universal product/service standards 

DOES specify the way in which standards are established and monitored

# ISO 9001:2000 principles

Ch13.2. software product quality

3

1. Understanding the requirements of the customer 
2. Leadership to provide unity of purpose and direction to achieve quality 
3. Involvement of staff at all levels 
4. Focus on the individual which create intermediate and deliverable products and services

1. Focus on interrelation of processes that deliver products and services 
2. Continuous process improvement 
3. Decision-making based on factual evidence 
4. Mutually beneficial relationships with suppliers

# ISO 9001:2000 principles

Mar 2021

Ch13.2. software product quality

4

4

# ISO 9001:2000 cycle

Ch13.2. software product quality

5

# The need to improve

Ch13.2. software product quality

6

can everything be improved at one? no, must tackle the most important things first 

‘poor companies are poor at changing’ some later improvements build on earlier ones 

but there are problems 

- improvement takes up time and money 
- ‘improvement’ may simply be more bureaucracy!

# Capability maturity model

Ch13.2. software product quality

7

created by Software Engineering Institute, Carnegie Mellon University 

CMM developed by SEI for US government to help procurement 

Watts S. Humphrey ‘Managing the software process’ Addison Wesley 

Assessment is by questionnaire and interview

# Capability maturity model 2

Ch13.2. software product quality

8

Different versions have been developed for different environments e.g. software engineering 

New version CMMI tries to set up a generic model which can be populated differently for different environments

<!-- image -->

# Process maturity levels

A company is at level 1 by default i.e. there is no level zero

Ch13.2. software product quality

9

# A repeatable model

Ch13.2. software product quality

10

# Repeatable model KPAs

Ch13.2. software product quality

11

To move to this level concentrate on: 

Configuration management 

Quality assurance 

Sub-contract management 

Project planning 

Project tracking and oversight 

Measurement and analysis

# A defined process

Ch13.2. software product quality

12

<!-- image -->

# Repeatable to defined KPAs

Concentrate on 

Requirements development and technical solution 

Verification and validation 

Product integration 

Risk management 

Organizational training 

Organizational process focus (function) 

Decision analysis and resolution 

Process definition Integrated project management

Ch13.2. software product quality

13

# A managed process

Ch13.2. software product quality

14

# Defined to managed KPAs

Ch13.2. software product quality

15

Concentrate on: 

Organizational process performance 

Quantitative project management

# Optimizing

Ch13.2. software product quality

16

# Managing to optimizing: KPAs

Ch13.2. software product quality

17

concentrate on: 

Causal analysis and resolution 

Organizational innovation and deployment

# Some questions about CMMI

Ch13.2. software product quality

18

suitable only for large organizations? 

- e.g. need for special quality assurance and process improvement groups 
- how can we plan when we’ve not used the the development method before? 

defining processes may not be easy with new technology 

higher CMM levels easier with maintenance environments? 

can you jump levels? (HP level 5 in India)

# ISO/IEC 15504 IT process assessment

Ch13.2. software product quality

19

To provide guidance on the assessment of software development processes 

Process Reference Model: Needs a defined set of processes that represent good practice to be the benchmark 

ISO 12207 is the default reference model 

Could use others in specific environments

# ISO 15504 performance attributes

Ch13.2. software product quality

20

| CMMI level   | ISO 15504                                              |
|--------------|--------------------------------------------------------|
|              | 0 incomplete                                           |
| Initial      | 1.1 Process performance – achieves defined outcome     |
| Repeatable   | 2.1 Process management – it is planned and monitored   |
|              | 2.2 Work product management – control of work products |

# ISO 15504 performance attributes - contd

Ch13.2. software product quality

21

| CMMI level   | ISO 15504                |
|--------------|--------------------------|
| Defined      | 3.1 Process definition   |
|              | 3.2 Process deployment   |
| Managed      | 4.1 Process measurement  |
|              | 4.2 Process control      |
| Optimizing   | 5.1 Process innovation   |
|              | 5.2 Process optimization |

# Process Reference Model

Ch13.2. software product quality

22

A defined standard approach to development 

Reflects recognized good practice 

A benchmark against which the processes to be assessed can be judged 

ISO 12207 is the default model

# IS0 15504 Process Assessment

Ch13.2. software product quality

23

For each process in the relevant Process Reference Model 

- For each set of attribute level criteria 
- Assess whether: 
- N: not achieved 0-15% 
- P: partially achieved &gt;15%-50% 
- L: largely achieved &gt;50%-85% 
- F: fully achieved &gt;85%

# ISO 15504 performance indicators

Ch13.2. software product quality

24

This is just an example of how indicators for each level might be identified 

     1. Performance  	Descriptions of maximum and minimum expected input 	values exist 

     2.1 Performance management  	A plan of how expected input variable ranges are to be 	obtained exists which is up to date

# ISO 15504 performance indicators 2

Ch13.2. software product quality

25

    2.2 Work product management 	There are minutes of a meeting where the input 	requirements document was reviewed and corrections 	were mandated

    3.1 Process definition 	A written procedure for input requirements gathering 	exists

    3.2 Process deployment 	A control document exists that is signed as each part of 	the procedure is completed

# ISO 15504 performance indicators 2

Ch13.2. software product quality

26

    4.1. Process measurement 	Collected measurement data can be collected e.g.    	number of changes resulting from review

    4.2. Process control 	Memos relating to management actions taken in the light 	of the above

# ISO 15504 performance indicators 3

Ch13.2. software product quality

27

    5.1 Process innovation 	Existence of some kind of ‘lessons learnt’ report at the 	end of project

    5.2. Process optimization 	Existence of documents assessing the feasibility of 	suggested process improvements and which show 	consultation with relevant stakeholders

# Techniques to improve quality -Inspections

Ch13.2. software product quality

28

When a piece of work is completed, copies are distributed to co-workers 

Time is spent individually going through the work noting defects 

A meeting is held where the work is then discussed 

A list of defects requiring re-work is produced

# Inspections - advantages of approach

Ch13.2. software product quality

29

an effective way of removing superficial errors from a piece of software 

motivates the software developer to produce better structured and self-descriptive code 

spreads good programming practice 

enhances team-spirit 

the main problem maintaining the commitment of participants

# ‘Clean-room’ software development

Ch13.2. software product quality

30

Ideas associated with Harlan Mills at IBM 

Three separate teams: 

- Specification team – documents user requirements and usage profiles (how much use each function will have) 
- Development team – develops code but does not test it. Uses mathematical verification techniques 
- Certification team – tests code. Statistical model used to decide when to stop

# Formal methods

Ch13.2. software product quality

31

Use of mathematical notations such as VDM and Z to produce unambiguous specifications 

Can prove correctness of software mathematically (cf. geometric proofs of Pythagoras’ theorem) 

Newer approach use Object Constraint Language (OCL) to add detail to UML models 

Aspiration is to be able to generate applications directly from UML+OCL without manual coding – Model Driven Architectures (MDA)

# Testing: the V-process model

Ch13.2. software product quality

32

This shown diagrammatically on the next slide 

It is an extension of the waterfall approach 

For each development stage there is a testing stage 

The testing associated with different stages serves different purposes e.g. system testing tests that components work together correctly, user acceptance testing that users can use system to carry out their work

# Testing: the v-process model

Ch13.2. software product quality

33

# Black box versus glass box test

Ch13.2. software product quality

34

Glass box testing 

- The tester is aware of the internal structure of the code; can test each path; can assess percentage test coverage of the tests e.g. proportion of code that has been executed 
- The tester is not aware of internal structure; concerned with degree to which it meets user requirements

Black box testing 

# Test plans

Ch13.2. software product quality

35

Specify test environment 

- In many cases, especially with software that controls equipment, a special test system will need to be set up 
- Failures in operational system more likely in the more heavily used components 
- Faults in less used parts can lie hidden for a long time 
- Testing heavily used components more thoroughly tends to reduce number of operational failures

Usage profile 

# Management of testing

Ch13.2. software product quality

36

The tester executes test cases and may as a result find discrepancies between actual results and expected results – issues 

Issue resolution – could be: 

a mistake by tester 

a fault – needs correction 

a fault – may decide not to correct: off-specification 

a change – software works as specified, but specification wrong: submit to change control

# Decision to stop testing

Ch13.2. software product quality

37

The problem: impossible to know there are no more errors in code 

Need to estimate how many errors are likely to be left 

Bug seeding – insert (or leave) known bugs in code 

Estimate of bugs left = (total errors found)/(seeded errors found) x (total seeded errors)

# Alternative method of error estimation

Ch13.2. software product quality

38

Have two independent testers, A and B 

N1 = valid errors found by A 

N2 = valid errors found by B 

N12 = number of cases where same error found by A and B 

Estimate = (N1 × N2 )/ N12 

Example: A finds 30 errors, B finds 20 errors. 15 are common to A and B. How many errors are there likely to be?

# Quality plans

Ch13.2. software product quality

39

Quality standards and procedures should be documented in an organization’s quality manual 

For each separate project, the quality needs should be assessed 

Select the level of quality assurance needed for the project and document in a quality plan

# typical contents of a quality

Ch13.2. software product quality

40

Plan scope of plan 

References to other documents 

Quality management, including organization, tasks, and responsibilities 

Documentation to be produced 

Standards, practices and conventions 

Reviews and audits

# more contents of a quality plan

Ch13.2. software product quality

41

testing 

problem reporting and corrective action 

tools, techniques, and methodologies 

code, media and supplier control 

records collection, maintenance and retention 

training  

risk management