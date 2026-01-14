Aug 2024

# Chapter 6 - Activity planning

SOFTWARE 

PROJECT MANAGEMENT

# Scheduling

‘Time is nature’s way of stopping everything happening at once’

Having

- worked out a method of doing the project
- identified the tasks to be carried
- assessed the time needed to do each task need to allocate dates/times for the start and end of each activity

Ch6. Activity planning

2

# Activity networks

These help us to:

- Assess the feasibility of the planned project completion date
- Identify when resources will need to be deployed to activities
- Calculate when costs will be incurred

This helps the co-ordination and motivation of the project team

Ch6. Activity planning

3

# Defining activities

Activity networks are based on some assumptions:

A project is:

- Composed of a number of activities
- May start when at least one of its activities is ready to start
- Completed when all its activities are completed

Ch6. Activity planning

4

# Defining activities

An activity

- Must have clearly defined start and end-points
- Must have resource requirements that can be forecast: these are assumed to be constant throughout the project
- Must have a duration that can be forecast
- May be dependent on other activities being completed first (precedence networks)

Ch6. Activity planning

5

# Identifying activities

Work-based: draw-up a Work Breakdown Structure listing the work items needed

Product-based approach

- list the deliverable and intermediate products of project – product breakdown structure (PBS)
- Identify the order in which products have to be created
- work out the activities needed to create the products
- 

Ch6. Activity planning

6

# Hybrid approach

Ch6. Activity planning

7

<!-- image -->

# The final outcome of the planning process

A project plan as a bar chart

Ch6. Activity planning

8

<!-- image -->

# PERT vs cpm

Ch6. Activity planning

9

Do B

Do C

Do A

Do D

Do A

Do B

Do C

Do D

CPM

PERT

# Drawing up a PERT diagram

No looping back is allowed – deal with iterations by hiding them within single activities

Ch6. Activity planning

10

milestones – ‘activities’, such as the start and end of the project, which indicate transition points. They have zero duration.

# Lagged activities

where there is a fixed delay between activities e.g. seven days notice has to be given to users that a new release has been signed off and is to be installed

Ch6. Activity planning

11

Acceptance

testing

Install new

release

20 days

1 day

7 days

# Types of links between activities

Finish to start

Ch6. Activity planning

12

Software

development

Acceptance testing

Start to start/ Finish to finish

Document

Amendments

Test prototype

1 day

2 days

# Types of links between activities

Start to finish

Ch6. Activity planning

13

Acceptance test

of new system

Cutover to new

system

Operate temporary

system

# Start and finish times

Activity ‘write report software’

Earliest start (ES)

Earliest finish (EF) = ES + duration

Latest finish (LF) = latest task can be completed without affecting project end Latest start = LF - duration

Ch6. Activity planning

14

activity

1 day

Earliest start

Latest finish

Latest start

Earliest finish

# Example

earliest start = day 5

latest finish = day 30

duration = 10 days

Ch6. Activity planning

15

earliest finish = ?

latest start = ?

Float = LF - ES - duration

What is it in this case?

# ‘Day 0’

Note that in the last example, day numbers used rather than actual dates

Makes initial calculations easier – not concerned with week-ends and public holidays

For finish date/times Day 1 means at the END of Day 1.

For a start date/time Day 1 also means at the END of Day 1.

The first activity therefore begin at Day 0 i.e. the end of Day 0 i.e. the start of Day 1

Ch6. Activity planning

16

Ch6. Activity planning

17

| Earliest start                       | Duration                             | Earliest finish                      |
|--------------------------------------|--------------------------------------|--------------------------------------|
| Activity label, activity description | Activity label, activity description | Activity label, activity description |
| Latest start                         | Float                                | Latest finish                        |

# Complete for the previous example

Ch6. Activity planning

18

# Forward pass

Start at beginning (Day 0) and work forward following chains.

Earliest start date for the current activity = earliest finish date for the previous

When there is more than one previous activity, take the latest earliest finish

Ch6. Activity planning

19

EF = day 7

EF = day 10

ES = day 10

# Example of an activity network

Ch6. Activity planning

20

<!-- image -->

# Complete the table

Ch6. Activity planning

21

| Activity   | ES   | duration   | EF   |
|------------|------|------------|------|
| A          |      |            |      |
| B          |      |            |      |
| C          |      |            |      |
| D          |      |            |      |
| E          |      |            |      |
| F          |      |            |      |
| G          |      |            |      |
| H          |      |            |      |

# Backward pass

Start from the last activity

Latest finish (LF) for last activity = earliest finish (EF)

work backwards

Latest finish for current activity = Latest start for the following

More than one following activity - take the earliest LS

Latest start (LS) = LF for activity - duration

Ch6. Activity planning

22

# Example: LS for all activities?

Ch6. Activity planning

23

<!-- image -->

# Complete the table

Ch6. Activity planning

24

| Activity   | ES   | DUR   | EF   | LS   | LF   |
|------------|------|-------|------|------|------|
| A          |      |       |      |      |      |
| B          |      |       |      |      |      |
| C          |      |       |      |      |      |
| D          |      |       |      |      |      |
| E          |      |       |      |      |      |
| F          |      |       |      |      |      |
| G          |      |       |      |      |      |
| H          |      |       |      |      |      |

# Float

    Float = Latest finish –

		Earliest start –

		Duration

Ch6. Activity planning

25

activity

ES

LF

Latest start

Earliest finish

# Complete the table

Ch6. Activity planning

26

| Act-ivity   | ES   | DUR   | EF   | LS   | LF   | Float   |
|-------------|------|-------|------|------|------|---------|
| A           |      |       |      |      |      |         |
| B           |      |       |      |      |      |         |
| C           |      |       |      |      |      |         |
| D           |      |       |      |      |      |         |
| E           |      |       |      |      |      |         |
| F           |      |       |      |      |      |         |
| G           |      |       |      |      |      |         |

# Critical path

Note the path through network with zero floats

Critical path: any delay in an activity on this path will delay whole project

Can there be more than one critical path?

Can there be no critical path?

Sub-critical paths

Ch6. Activity planning

27

# Free and interfering float

B can be up to 3 days late  and not affect any  other activity = free float

Ch6. Activity planning

28

B can be a further 2 days late – affects D but not the project end date =  interfering float

| 0   | 7W   | 7   |
|-----|------|-----|
| A   | A    | A   |
| 2   | 2    | 9   |

| 0   | 4W   | 4   |
|-----|------|-----|
| B   | B    | B   |
| 5   | 5    | 9   |

| 0   | 10W   | 10   |
|-----|-------|------|
| A   | A     | A    |
| 0   | 0     | 10   |

| 7   | 1W   | 8   |
|-----|------|-----|
| D   | D    | D   |
| 9   | 2    | 10  |

| 10   | 2W   | 12   |
|------|------|------|
| E    | E    | E    |
| 10   | 0    | 12   |