Aug 2024

# Chapter 13.1 - software product quality

SOFTWARE 

PROJECT MANAGEMENT

# The importance of software quality

Ch13.1. software product quality

2

Increasing criticality of software

The intangibility of software

Project control concerns:

- errors accumulate with each stage
- errors become more expensive to remove the later they are found
- it is difficult to control the error removal process (e.g. testing)

# Quality specifications

Ch13.1. software product quality

3

Where there is a specific need for a quality, produce a quality specification

Definition/description of the quality

Scale: the unit of measurement

Test: practical test of extent of quality

Minimally acceptable: lowest acceptable value, if compensated for by higher quality level elsewhere

Target range: desirable value

Now: value that currently applies

<!-- image -->

# ISO standards: development life cycles

Mar 2021

Ch13.1. software product quality

4

A development life cycle (like ISO 12207) indicates the sequence of processes that will produce the software deliverable and the intermediate products that will pass between the processes.

4

# Iso standards

ISO 9126 Software product quality

- Attributes of software product quality
- External qualities i.e. apparent to the user of the deliverable
- Internal qualities i.e. apparent to the developers of the deliverables and the intermediate products

ISO Procedures to carry out the assessment of the product qualities defined in ISO 9126

Ch13.1. software product quality

5

# Types of quality	assessment

Ch13.1. software product quality

6

During software development, to assist developers to build software with the required qualities

During software acquisition to allow a customer to compare and select the best quality product

Independent evaluation by assessors rating a software product for a particular community of users

# ISO 9126 software product quality

Ch13.1. software product quality

7

# Quality in use

Ch13.1. software product quality

8

Effectiveness – ability to achieve user goals with accuracy and completeness

Productivity – avoids excessive use of resources in achieving user goals

Safety – within reasonable levels of risk of harm to people, business, software, property, environment etc,

Satisfaction – happy users!

‘users’ include those maintain software as well as those who operate it.

# ISO 9126 software qualities

Ch13.1. software product quality

9

| functionality   | does it satisfy user needs                                   |
|-----------------|--------------------------------------------------------------|
| reliability     | can the software maintain its level of performance           |
| usability       | how easy is it to use?                                       |
| efficiency      | relates to the physical resources used during execution      |
| maintainability | relates to the effort needed to make changes to the software |
| portability     | how easy can it be moved to ad new environment               |

# Sub-characteristics of Functionality

Ch13.1. software product quality

10

Suitability

Accuracy

Interoperability

- ability of software to interact with other software components
- degree to which software adheres to application-related standards or legal requirements e.g audit
- control of access to the system

Functionality compliance

Security

# Sub-characteristics of Reliability

Maturity

- frequency of failure due to faults - the more the software has been used, the more faults will have been removed
- note that this is distinguished from ‘security’ - see above
- complies with standards relating to reliability

Fault-tolerance

Recoverability

Reliability compliance 

Ch13.1. software product quality

11

# Sub-characteristics of Usability

Understandability

- easy to understand?
- easy to learn?
- easy to use?
- compliance with relevant standards

Learnability

Operability

Attractiveness – this is a recent addition

Usability compliance

Ch13.1. software product quality

12

# Sub-characteristics of Efficiency

Time behaviour

- e.g. response time
- e.g. memory usage
- compliance with relevant standards

Resource utilization

Efficiency compliance

Ch13.1. software product quality

13

# Sub-characteristics of Maintainability

Ch13.1. software product quality

14

“Analysability”

- ease with which the cause of a failure can be found
- how easy is software to change?
- low risk of modification having unexpected effects

Changeability

Stability

“Testability”

Maintainability conformance

# Sub-characteristics of portability

Ch13.1. software product quality

15

Adaptability

“Installability”

Co-existence

- Capability of co-existing with other independent software products

# Sub-characteristics of portability

Ch13.1. software product quality

16

“Replaceability”

- factors giving ‘upwards’ compatibility - ‘downwards’ compatibility is excluded
- Adherence to standards that support portability

Portability conformance

# Using ISO 9126 quality standards (development mode)

Ch13.1. software product quality

17

Judge the importance of each quality for the application

- for example, safety critical systems - reliability very important
- real-time systems - efficiency important
- mean-time between failures for reliability
- response-time for efficiency

Select relevant external measurements within ISO 9126 framework for these qualities, for example

# Using ISO 9126 quality standards

Ch13.1. software product quality

18

| map measurement onto ratings scale to show degree of user satisfaction – for example response time   | Response (secs)   | Rating               |
|------------------------------------------------------------------------------------------------------|-------------------|----------------------|
| map measurement onto ratings scale to show degree of user satisfaction – for example response time   | <2                | Exceeds requirement  |
| map measurement onto ratings scale to show degree of user satisfaction – for example response time   | 2-5               | Target range         |
| map measurement onto ratings scale to show degree of user satisfaction – for example response time   | 6-10              | Minimally acceptable |
| map measurement onto ratings scale to show degree of user satisfaction – for example response time   | >10               | Unacceptable         |

# Using ISO 9126 quality standards

Ch13.1. software product quality

19

Identify the relevant internal measurements and the intermediate products in which they would appear

e.g. at software design stage the estimated execution time for a transaction could be calculated

# Using ISO 9126 approach for application software selection

Ch13.1. software product quality

20

Rather than map engineering measurement to qualitative rating, map it to a score

Rate the importance of each quality in the range 1-5

Multiply quality and importance scores – see next slide

| Response (secs)   |   Quality score |
|-------------------|-----------------|
| <2                |               5 |
| 2-3               |               4 |
| 4-5               |               3 |
| 6-7               |               2 |
| 8-9               |               1 |
| >9                |               0 |

# Weighted quality scores

Ch13.1. software product quality

21

|                  |                       | Product A         | Product A              | Product B         | Product B              |
|------------------|-----------------------|-------------------|------------------------|-------------------|------------------------|
| Product quality  | Importance rating (a) | Quality score (b) | Weighted score (a x b) | Quality score (c) | Weighted score (a x c) |
| Usability        | 3                     | 1                 | 3                      | 3                 | 9                      |
| Efficiency       | 4                     | 2                 | 8                      | 2                 | 8                      |
| Maintain-ability | 2                     | 3                 | 6                      | 1                 | 2                      |
| Overall totals   |                       |                   | 17                     |                   | 19                     |

# How do we achieve product quality?

Ch13.1. software product quality

22

the problem: quality attributes tend to retrospectively measurable

need to be able to examine processes by which product is created beforehand

the production process is a network of sub-processes

output from one process forms the input to the next

errors can enter the process at any stage

# Correction of errors

Ch13.1. software product quality

23

Errors are more expensive to correct at later stages

- need to rework more stages
- later stages are more detailed and less able to absorb change
- Error typically 10 times more expensive to correct at coding stage than at requirements stage
- 100 times more expensive at maintenance stage

Barry Boehm

# For each activity, define:

Ch13.1. software product quality

24

Entry requirements

- these have to be in place before an activity can be started
- example: ‘a comprehensive set of test data and expected results be prepared and independently reviewed against the system requirement before program testing can commence’

# For each activity, define

Ch13.1. software product quality

25

Implementation requirements

- these define how the process is to be conducted
- example ‘whenever an error is found and corrected, all test runs must be completed, including those previously successfully passed’

# For each activity, define

Ch13.1. software product quality

26

Exit requirements

- an activity will not be completed until these requirements have been met
- example: ‘the testing phase is finished only when all tests have been run in succession with no outstanding errors’