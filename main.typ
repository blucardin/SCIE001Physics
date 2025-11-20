// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo


#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}
#let regular(body) = {
  set heading(supplement: [Regular])
  body
}

#set heading(numbering: "1.")

#align(center)[

  _#text(30pt)[
    #titlecase("Modeling the cooling of air in a can")
  ] \ \
  *Assignment 2*
  _

  SCIE 001 Physics

  Noah Virjee \
  45515863


  #let today = datetime.today()

  #today.display("[month repr:long]")
  #today.day(), #today.year()// or another custom format

]

#outline(target: heading.where(supplement: [Regular]))

#outline(target: heading.where(supplement: [Appendix]), title: [Appendix])

#pagebreak()

// uncomment this for infinite page height except the first page.
// #set page(height: auto)
#show: regular

= Introduction

Introduction (max 100 words):
Explain what you did and state key facts about your experiment (e.g. describe your can, heat source used, etc.).
All reported quantities should have units and uncertainty (if measured).
Include a picture of your experimental setup.

To measure the emissivity and convention coefficient of an aluminum can, I used a space heater to heat the can, then let the can cool back to ambient temperature, while monitoring internal temperature with an arduino and DHT11 temperature sensor. I then fit the data with a model, and adjusted the

#grid(
  columns: 2,
  gutter: 5pt,

  [#figure(
    image("images/IMG_3952.jpeg", width: 70%),
    caption: [
      For the experimental setup
      The can was hung from a string to reduce conductive heat flow
    ],
  ) <ExperimentalSetup>],

  // [#figure(
  //   image("IMG_3709.jpeg", width: 70%),
  //   caption: [
  //     An image of the tissue box that was dropped onto the sensor on a scale with 0.01g precision. Note: it was dropped plastic side up.
  //   ],
  // ) <ExperimentalSetup>]
)

= Results

== Constants used in code:
#table(
  columns: 4,
  [*Name*], [*Value*], [*Uncertainty*], [*Citation*],
  [$pi$], [3.142], [], [],
  [Radius of Can], [33.125 m], [], [],
  [Height of Can], [122.25 m ], [], [],
  [100g], [Cane sugar], [], [],
  [100g], [70% cocoa chocolate], [], [],
  [100g], [35-40% cocoa chocolate], [], [],
  [2], [Eggs], [], [],
  [Pinch], [Salt], [], [],
  [Drizzle], [Vanilla extract], [], [],
)



= Discussion
There are two differential equations we considered to model both conductive and convective heat flow.
$
  (d Q_c) / (d t) = -k_c A (T - T_("amb")) wide "for conductive heat" \
$
Where:
- $A$ is area in $m^3$
- $k_c$ is the convection coefficient in $W m^-2 K^-1$
- $T$ is the current temperature of the system in $K$
- $T_"amb"$ is the ambient temperature of the environment in $K$
$
  (d Q_r) / (d t) = -A epsilon sigma (T^4 - T_("amb")^4) wide "for radiative heat" \
$
Where:
- $A$, $T$, and $T_"amb"$, are the same as before. 
- $k_c$ is the convection coefficient in $W m^-2 K^-1$
- $T$ is the current temperature of the system in $K$
- $T_"amb"$ is the ambient temperature of the environment in $K$

$
  therefore (d Q_"total") / (d t) = (d Q_c) / (d t) + (d Q_r) / (d t) \
$


Then we considered that the total change in temperature is equal to the change in heat, divided by the heat capacity of the system.
$
  C_p = (Delta Q) / (Delta T)\
  Delta T = (Delta Q) / C_p \
  "Since" C_p "is (relatively) constant, we can rewrite with differentials:" \
  therefore d T = (d Q) / C_p \
$
Where we define $C_p$ as the heat capacity of our system at constant pressure in $J K^-1$ (instead of the usual $J "mol"^-1 K^-1$).

For Euler-based modeling, this looks like:

```python
dHc = kc * A * (Tn-Tamb) * dt
dHr = eps * sig * A * (Tn**4 - Tamb**4) * dt
Tn = Tn - (dHc + dHr)/heatcap
```

This model functions on the assumptions that heat capacity stays constant, that ambient tempature, 

Parameters $k_c$ and $epsilon$ were manually adjusted to reduce $chi^2$ metric between observed and

while keeping good fit.





#show: appendix

= Ultrasonic Measurement and Code Snippets<app1>


