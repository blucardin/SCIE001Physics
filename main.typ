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

#let lim = math.limits(math.lim)

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

I used a space heater to heat  a standard $355 "ml"$ aluminum soda can, then let it cool down while monitoring internal temperature with an arduino and DHT11 temperature sensor. 

I then fit a Euler method-based model to this data to determine the emissivity constant and convention coefficient of the can. 

The can weighed $ (0.01246 plus.minus 2.887 times 10^(-6)) "kg"$, with a radius of $(0.0331 plus.minus 1.00 times 10^(-3) )"m"$ , and an effective height of $(0.112 plus.minus 3.25 times 10^(-3) ) "m"$.


#grid(
  columns: 2,
  gutter: 20pt,

  [#figure(
    box(
    image("images/IMG_3952.jpeg", width: 100%),
    clip: true, inset: (bottom: -0.85in, right: -0.0in, top: -0.0in, left: -0.8in)),
    caption: [
      Image of the experimental setup. 
      The can was hung from a string to limit heat flow to mostly radiative and convective and not conductive. Tape was used as a cover to limit air movement outside the can.
    ],
  ) <ExperimentalSetup>],

  [#figure(
    box(
    image("images/IMG_3997.jpeg", width: 100%),
     clip: true, inset: (bottom: -0.15in, right: -0.4in, top: -0.5in, left: -0.25in)),
    caption: [
      An image of the tissue box that was dropped onto the sensor on a scale with 0.01g precision. 
    ],
  ) <ExperimentalSetup>]
)

= Results

Data was fit to a computational model. Parameters $k_c$ and $epsilon$ were manually adjusted using an interactive fitter (see #ref(<interactiveFitter>)) to reduce $chi^2$ score (see #ref(<chi2>)) between experimental data and model while keeping a good fit.

The constants used are shown in #ref(<constants>), and the final parameters and fit data is shown in #ref(<parameterData>).

There are two differential equations we used to model heat flow.
$
  (d Q_c) / (d t) = -k_c A (T - T_("amb")) wide "for convective heat flow" \
$
Where:
- $A$ is area in $m^3$
- $k_c$ is the convection coefficient in $W m^(-2) K^(-1)$
- $T$ is the current temperature of the system in $K$
- $T_"amb"$ is the ambient temperature of the environment in $K$
$
  (d Q_r) / (d t) = -A epsilon sigma (T^4 - T_("amb")^4) wide "for radiative heat flow" \
$
Where:
- $A$, $T$, and $T_"amb"$, are the same as before. 
- $epsilon$ is the emissivity of the surface of the object:

The equation for the change in total heat was:
$
  therefore (d Q_"total") / (d t) = (d Q_c) / (d t) + (d Q_r) / (d t) \
$

To determine the change in temperature, we rearrange the formula for heat capacity.
$
  C_p = (Delta Q) / (Delta T)\
  Delta T = (Delta Q) / C_p \
$
Where $C_p$ is the heat capacity of our system at constant pressure in $J K^(-1)$ (instead of the usual $J "mol"^(-1) K^(-1)$).
  
Rewriting with differentials:  
$
    (d T)/(d t) &= ( 1 / C_p) (d Q_"total") /(d t) \
    therefore (d T)/(d t) &= ( 1 / C_p) ((d Q_c) / (d t) + (d Q_r) / (d t) ) \
$

For Euler-based modeling in python, this looks like:
```python
dHc = kc * A * (Tn-Tamb) * dt
dHr = eps * sig * A * (Tn**4 - Tamb**4) * dt
Tn = Tn - (dHc + dHr)/heatcap
```

This model assumes that there was no conductive heat loss, heat capacity of the system stays constant, no hot air left the container, and ambient temperature is static.


== Parameters and Fit Data
#figure(
    table(
    columns: 7,
    [*Trial Number*], [*Estimated $k_c$*], [*Relative Uncertainty in $k_c$*], [*Estimated $epsilon$*], [*Relative Uncertainty in $epsilon$*], [*$chi^2$*], [*$Delta T$ across wall of can*],
    [1], [3.142], [], [], [], [], [],
    [2], [33.125 m], [], [], [], [], [],
    [3], [122.25 m ], [], [], [],[], [],
    ),
    caption: [
      The trial number, estimated $k_c$ and $epsilon$ and their relative uncertainties, $chi^2$ of fit, and temperature difference across wall of can. 
    ],
) <parameterData>


== Constants used in code:
#figure(
    table(
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
    ),
    caption: [
      The constants used in the code. 
    ],
) <constants>



= Discussion






#show: appendix

= Interactive Fitter <interactiveFitter>

= Calculating $chi^2$ <chi2>

