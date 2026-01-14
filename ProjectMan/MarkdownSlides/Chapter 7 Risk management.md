Aug 2024

# Chapter 7 – Risk management

SOFTWARE 

PROJECT MANAGEMENT

# Risk management

Ch7. Risk management

2

This lecture will touch upon:

Definition of ‘risk’ and ‘risk management’

Some ways of categorizing risk

Risk management

- Risk identification – what are the risks to a project?
- Risk analysis – which ones are really serious?
- Risk planning – what shall we do?
- Risk monitoring – has the planning worked?

We will also look at PERT risk and critical chains

# Some definitions of risk

Ch7. Risk management

3

‘the chance of exposure to the adverse consequences of future events’ PRINCE2

‘an uncertain event or condition that, if it occurs, has a positive or negative effect on a project’s objectives’ PM-BOK

Risks relate to possible future problems, not current ones

They involve a possible cause and its effect(s) e.g. developer leaves &gt; task delayed

# Categories of risk

Ch7. Risk management

4

# A framework for dealing with risk

The planning for risk includes these steps:

Risk identification – what risks might there be?

Risk analysis and prioritization – which are the most serious risks?

Risk planning – what are we going to do about them?

Risk monitoring – what is the current state of the risk?

Ch7. Risk management

5

# Risk identification

Approaches to identifying risks include:

Use of checklists – usually based on the experience of past projects

Brainstorming – getting knowledgeable stakeholders together to pool concerns

Causal mapping – identifying possible chains of cause and effect

Ch7. Risk management

6

# Boehm’s top 10 development risks

Ch7. Risk management

7

| Risk                                | Risk reduction techniques                                                                                                                    |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Personnel shortfalls                | Staffing with top talent; job matching; teambuilding; training and career development; early scheduling of key personnel                     |
| Unrealistic time and cost estimates | Multiple estimation techniques; design to cost; incremental development; recording and analysis of past projects; standardization of methods |

# Boehm’s top 10 development risks

Ch7. Risk management

8

| Risk                                    | Risk reduction techniques                                                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Developing the wrong software functions | Improved software evaluation; formal specification methods; user surveys; prototyping; early user manuals |
| Developing the wrong user interface     | Prototyping; task analysis; user involvement                                                              |

# Boehm’s top ten risk - continued

Ch7. Risk management

9

| Gold plating                                 | Requirements scrubbing, prototyping, design to cost                                        |
|----------------------------------------------|--------------------------------------------------------------------------------------------|
| Late changes to requirements                 | Change control, incremental development                                                    |
| Shortfalls in externally supplied components | Benchmarking, inspections, formal specifications, contractual agreements, quality controls |

# Boehm’s top ten risk - continued

Ch7. Risk management

10

| Gold plating                             | Requirements scrubbing, prototyping, design to cost               |
|------------------------------------------|-------------------------------------------------------------------|
| Shortfalls in externally performed tasks | Quality assurance procedures, competitive design etc              |
| Real time performance problems           | Simulation, prototyping, tuning                                   |
| Development technically too difficult    | Technical analysis, cost-benefit analysis, prototyping , training |

# Risk prioritization

Ch7. Risk management

11

Risk exposure (RE) = (potential damage) x (probability of occurrence) Ideally

Potential damage: a money value e.g. a flood would cause £0.5 millions of damage

Probability 0.00 (absolutely no chance) to 1.00 (absolutely certain) e.g (one in hundred chance)

RE = £0.5m x 0.01 = £5,000

Crudely analogous to the amount needed for an insurance premium

# Risk probability: qualitative descriptors

Ch7. Risk management

12

| Probability level   | Range                                |
|---------------------|--------------------------------------|
| High                | Greater than 50% chance of happening |
| Significant         | 30-50% chance of happening           |
| Moderate            | 10-29% chance of happening           |
| Low                 | Less than 10% chance of happening    |

# Qualitative descriptors of impact on cost and associated range values

Ch7. Risk management

13

| Impact level   | Range                                       |
|----------------|---------------------------------------------|
| High           | Greater than 30% above budgeted expenditure |
| Significant    | 20 to 29% above budgeted expenditure        |
| Moderate       | 10 to 19% above budgeted expenditure        |
| Low            | Within 10% of budgeted expenditure.         |

# Probability impact matrix

Ch7. Risk management

14

# Risk planning

Risks can be dealt with by:

Risk acceptance

Risk avoidance

Risk reduction

Risk transfer

Risk mitigation/contingency measures

Ch7. Risk management

15

# Risk reduction leverage

Risk reduction leverage = (REbefore- REafter)/ (cost of risk reduction)

REbefore is risk exposure before risk reduction e.g. 1% chance of a fire causing £200k damage

REafter is risk exposure after risk reduction e.g. fire alarm costing £500 reduces probability of fire damage to 0.5%

RRL = (1% of £200k)-(0.5% of £200k)/£500 = 2

RRL &gt; 1.00 therefore worth doing

Ch7. Risk management

16

# Probability chart

Ch7. Risk management

17

# Using PERT to evaluate the effects of uncertainty

Ch7. Risk management

18

Three estimates are produced for each activity

Most likely time (m)

Optimistic time (a)

Pessimistic (b)

‘expected time’ te = (a + 4m +b) / 6

‘activity standard deviation’ S = (b-a)/6

# A chain of activities

Ch7. Risk management

19

| Task   |   a |   m |   b | te   | S   |
|--------|-----|-----|-----|------|-----|
| A      |  10 |  12 |  16 | ?    | ?   |
| B      |   8 |  10 |  14 | ?    | ?   |
| C      |  20 |  24 |  38 | ?    | ?   |

<!-- image -->

# A chain of activities

Ch7. Risk management

20

- What would be the expected duration of the chain A + B + C?
- Answer: 12.66 + 10.33 + 25.66 i.e 48.65
- What would be the standard deviation for A + B+ C?
- Answer: square root of ( 12 + 12 + 32 ) i.e.

3.32

# Assessing the likelihood of meeting a target

Ch7. Risk management

21

Say the target for completing A+B+C was 52 days (T)

Calculate the z value thus z = (T – te)/s

In this example z = ( 52 – 48.33 )/3.32 i.e. 1.01

Look up in table of z values – see next overhead

# Graph of z values

Ch7. Risk management

22

# Critical chain concept

Ch7. Risk management

23

Traditional planning approach

# Critical chain approach

Ch7. Risk management

24

One problem with estimates of task duration:

- Estimators add a safety zone to estimate to take account of possible difficulties
- Developers work to the estimate + safety zone, so time is lost
- No advantage is taken of opportunities where tasks can finish early – and provide a buffer for later activities

# Critical chain approach

Ch7. Risk management

25

One answer to this:

Ask the estimators for two estimates

- Most likely duration: 50% chance of meeting this
- Comfort zone: additional time needed to have 95% chance

Schedule all activities suing most likely values and starting all activities on latest start dates

# Most likely and comfort zone estimates

Ch7. Risk management

26

| Activity   |   Most likely | Plus comfort zone   | Comfort zone   |
|------------|---------------|---------------------|----------------|
| A          |             6 | 8                   | 2              |
| B          |             4 | 5                   | 1              |
| C          |             3 | 3                   | 0              |
| D          |             4 | 5                   | 1              |
| E          |             3 | 4                   | 1              |
| F          |            10 | 15                  | 5              |
| G          |             3 | 4                   | 1              |
| H          |             2 | 2,5                 | 0,5            |

# Critical chain - continued

Ch7. Risk management

27

Identify the critical chain – same a critical path but resource constraints also taken into account

Put a project buffer at the end of the critical chain with duration 50% of sum of comfort zones of the activities on the critical chain.

# Critical chain -continued

Ch7. Risk management

28

Where subsidiary chains of activities feed into critical chain, add feeding buffer

Duration of feeding buffer 50% of sum of comfort zones of activities in the feeding chain

Where there are parallel chains, take the longest and sum those activities

# Plan employing critical chain concepts

Ch7. Risk management

29

# Executing the critical chain – based plan

Ch7. Risk management

30

No chain of tasks is started earlier than scheduled, but once it has started is finished as soon as possible

This means the activity following the current one starts as soon as the current one is completed, even if this is early – the relay race principle

# Executing the critical chain-based plan

Ch7. Risk management

31

Buffers are divided into three zones:

Green: the first 33%. No action required

Amber : the next 33%. Plan is formulated

Red : last 33%. Plan is executed.