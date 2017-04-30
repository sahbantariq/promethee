Promethee
========================================================
author: Sahban Tariq Malik
date: May 2, 2017
autosize: true

Multi-criteria Decision Analysis
========================================================

To choose or obtain a ranking of several alternatives based
on more than one criteria

| Alternative | C1 | C2 | C3 | C4 |
|------:|------:|:-----|---------|:------:|
| Project 1 |   12  |  12  |    12   |    12  |
| Project 2 |  123  |  123 |   123   |   123  |
| Project 3 |    1  |    1 |     1   |     1  |

Types of Criteria
========================================================

Different criteria are usually not in the same unit, making
direct comparison implausible.

* Qualitivative or ordinal criteria
  + Relevance of project to current business
      - High
      - Medium
      - Low
* Quantitative or cardinal criteria
  + NPV of a project - in USD
  + Cost of labor - in USD
  + IRR - %

Types of Criteria
========================================================
* Beneficial Criteria
   + Higher value indicates better
      - e.g. NPV, IRR

* Non-beneficial Criteria
    + Higher value indicates worse
      - e.g. Cost, Investment

PROMETHEE
========================================================
Preference Ranking Organization Method for Enrichment of
Evaluations

- Developed by J.P. Brans and presented for the first time
in 1982 at a conference organised by R. Nadeau and M. Landry
at the Universite Laval, Quebec, Canada
- Obtains a preference function based on pairwise
differences for each criteria
- Aggregates using criteria weights to get net outranking
flow for final ranking

PROMETHEE
========================================================
- Additional information required to use PROMETHEE

    + Information within each criterion
      - Through a preference function that eliminates the
      effect of scale and enables comparability between
      criteria

    + Information between the criteria
      - Weights of relative importance
          summation Wj = 1


PROMETHEE - PROBLEM
========================================================
Consider the following decision matrix:
- Higher value of leverage ratio indicates higher risk:
non-benificial criteria


|Fund   |Currency Ratio |Cash Ratio         |Leverage Ratio        |Asset Turnover     |ROA                   |ROC                   |Net Profit to Net Sales |
|:------|:--------------|:------------------|:---------------------|:------------------|:---------------------|:---------------------|:-----------------------|
|NA     |$              |$                  |%                     |x                  |%                     |%                     |%                       |
|ATLAS  |351            |120.18             |0.11799999999999999   |25.92              |1.9E-2                |2.4E-2                |1.35E-2                 |
|ECBYO  |371            |89.77              |8.6999999999999994E-2 |32.01              |4.3999999999999997E-2 |0.154                 |4.02E-2                 |
|EUKYO  |359            |78.010000000000005 |8.2000000000000003E-2 |35.83              |4.9000000000000002E-2 |0.17599999999999999   |4.2500000000000003E-2   |
|EUYO   |390            |78.349999999999994 |0.11600000000000001   |23.07              |2.4E-2                |3.9E-2                |1.8200000000000001E-2   |
|ET YAT |1264           |121.62             |9.8000000000000004E-2 |26.77              |3.7999999999999999E-2 |9.6000000000000002E-2 |3.2500000000000001E-2   |
|GRNYO  |100            |99.59              |9.0999999999999998E-2 |29.06              |4.1000000000000002E-2 |0.128                 |3.6900000000000002E-2   |
|ISYAT  |780            |32.01              |7.8E-2                |39.979999999999997 |5.0999999999999997E-2 |0.185                 |5.0099999999999999E-2   |
|OYAYO  |767            |138.69999999999999 |0.109                 |22.68              |2.9000000000000001E-2 |5.6000000000000001E-2 |2.3699999999999999E-2   |
|VKFYO  |701            |121.99             |0.10199999999999999   |28.88              |3.4000000000000002E-2 |7.8E-2                |2.8899999999999999E-2   |


STEP 1: Normalize Decision Matrix
========================================================
1. Normalize the decision matrix by using the following formula

For benificial criteria:

Rij = (Xij - min(Xij))/(max(Xij) - min(Xij))

For non-benificial criteria:

Rij = (max(Xij) - Xij)/(max(Xij) - min(Xij))

STEP 1: Normalize Decision Matrix
========================================================
TABLE

STEP 2: Preference Function
========================================================
- Pairwise comparisons
    + a > b if alternative a dominates b for each criteria
    + a = b if alternative a and b have same value for each criteria
- In practice, mostly pairwise comparisons are incomparable
    + a > b for some criteria while a < b for others
    + e.g. EIYAT > GRNYO w.r.t. currency ratio and cash ratio
    while GRNYO > EIYAT w.r.t all other criteria
- No single best way to objectively aggregate the information
in all criteria
  - The compromise solution depends on the individual "preferences"
of each decision-maker


STEP 2: Preference Function
========================================================
- PROMETHEE methods belong to the class of outranking methods
- Includes realistic enrichments of the dominance relation
    + Provides reliable information in the presence of
    incomparabilities


STEP 2: Preference Function
========================================================
- Deviation between two alternatives on a particular criteria j

          dj(a,b)=gj(a)-gj(b)

- Define a preference function Pj(.) based on pairwise deviations

        Pj(a,b)= Fj[dj(a,b)] for any pair of alternatives a,b

          Pj(a,b)!= Pj(b,a)

          Thus, Pj(a,b)>0 implies Pj(b,a)=0

Six types of particular preference functions have been
proposed by J.P. Brans

STEP 2: Preference Function
========================================================
Type 1: Usual Criterion

P(d) =

      0 if d <= 0

      1 if d > 0
Parameters: none
***
![alt](1.png)

STEP 2: Preference Function
========================================================
Type 2: U-shape Criterion

P(d) =

      0 if d <= q

      1 if d > q
Parameters:

    q - threshold of indifference
***
![alt](2.png)

STEP 2: Preference Function
========================================================
Type 3: V-shape Criterion

P(d) =

      0 if d <= 0
      d/p if 0<=d<=p
      1 if d > p
Parameters:

    p - threshold of strict preference
***
![alt](3.png)

STEP 2: Preference Function
========================================================
Type 4: Level Criterion

P(d) =

      0 if d <= q
      1/2 if q<d<=p
      1 if d > p
Parameters:

    q - threshold of indifference
    p - threshold of strict preference
***
![alt](4.png)

STEP 2: Preference Function
========================================================
Type 5: V-shape with indifference Criterion

P(d) =

      0 if d <= q
      d-q/p-q if q<d<=p
      1 if d > p
Parameters:

    q - threshold of indifference
    p - threshold of strict preference
***
![alt](5.png)

STEP 2: Preference Function
========================================================
Type 6: Gaussian Criterion

P(d) =

      0 if d <= 0
      1-exp(d^2/2s^2) if d > 0
Parameters:

    s - an intermediate value between q and p
***
![alt](6.png)

STEP 2: Preference Function
========================================================
Choosing the appropriate parameters is crucial, though easy
- Indifference threshold is the largest deviation which is
considered as
negligible by the decision maker
- Preference threshold is the smallest deviation which is
considered as sufficient to generate a full preference

- s defines the inflection point of the preference function.
    + If s is close to q, preferences will be reinforced for
    small deviations,
    + If s is close to p, preferences will be softened for
    small deviations

STEP 2: Preference Function
========================================================
TABLE

STEP 3: Aggregated Preference Function
========================================================
The preference functions for criteria are aggregated by
assigning weights.

The aggregated preference function is given by:

![pi](pi.png)

pi(a,b) expresses with which degree a is preferred to b
over all the criteria

pi(b,a) expressses how b is preferred to a

STEP 3: Aggregated Preference Function
========================================================
General properties of the aggregated preference function pi
***
![pi](prop_pi.png)

STEP 4: Outranking Flows
========================================================
+ Each alternative a is facing n-1 other alternatives
    - Thus n-1 pairs pi(a,b) for any alternative a
    - We take their average to get outranking flows
+ Positive outranking flow of a - the power or outranking
character of an a
    - Average of pi(a,b) for each b!=a
    - It expresses how an alternative is outranking all the others
    - The higher phi_plus(a), the better the alternative
+ Negative outranking flow of a - the weakness or outranked character
of an a
    - Average of pi(b,a) for each b!=a
    - It expresses how an alternative is outranked by all the others
    - The lower phi_minus(a), the better the alternative

***
![pi](outranking.png)

STEP 5: Partial Ranking PROMETHEE I
========================================================
- PROMETHEE I is the intersection of both positive and negative
outranking flows

![pi](prom1.png)

- Remember pi_plus(a) is power of a and pi_minus(a) is weakness of a
- a is preferred to b if a has higher power and/or lower weakness than
b
- a and b are indifferent if both power and weakness are same
- a and b are incomparable if a has higher power and higher weakness
or vice versa
    + Information provided by both flows is not consistent
    + Deciding which alternative is better is pto the decision-maker


STEP 5: Complete Ranking PROMETHEE II
========================================================
- PROMETHEE II is the balance between positive and negative
outranking flows

        phi(a) = phi_plus - phi_minus
- The higher the net flow, the better the alternative
- No incomparabilities remain, but more information gets lost by
considering the difference
- phi relies on comparative statements rather than absolute statements
- Recommended to use PROMETHEE I an II together for more information
![pi](prom2.png)
