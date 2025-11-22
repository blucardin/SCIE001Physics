// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#show link: underline
#import "@preview/sigfig:0.1.0": round, urounds
#import "@preview/unify:0.5.0": num

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

#figure(
  image("figures/EulerFitAll.svg", width: 90%),
  caption: [
    Graph of the internal temperature over time for Trial 4.
  ],
) <All>

#outline(target: heading.where(supplement: [Regular]))

#outline(target: heading.where(supplement: [Appendix]), title: [Appendix])

#pagebreak()

// uncomment this for infinite page height except the first page.
#set page(height: auto)
#show: regular

= Introduction

I used a space heater to heat  a standard $355 "ml"$ aluminum soda can, then let it cool down while monitoring internal temperature with an arduino and DHT11 temperature sensor.

I then fit a Euler method-based model to this data to determine the emissivity constant and convention coefficient of the can.

The can weighed $(0.01246 plus.minus 2.887 times 10^(-6)) "kg"$, with a radius of $(0.0331 plus.minus 1.00 times 10^(-3) )"m"$ , and an effective height of $(0.112 plus.minus 3.25 times 10^(-3) ) "m"$.


#grid(
  columns: 2,
  gutter: 20pt,

  [#figure(
    box(
      image("images/IMG_3952.jpeg", width: 100%),
      clip: true,
      inset: (bottom: -0.85in, right: -0.0in, top: -0.0in, left: -0.8in),
    ),
    caption: [
      Image of the experimental setup.
      The can was hung from a string to limit heat flow to mostly radiative and convective and not conductive. Tape was used as a cover to limit air movement outside the can.
    ],
  ) <ExperimentalSetup>],

  [#figure(
    box(
      image("images/IMG_3997.jpeg", width: 100%),
      clip: true,
      inset: (bottom: -0.15in, right: -0.4in, top: -0.5in, left: -0.25in),
    ),
    caption: [
      An image of the tissue box that was dropped onto the sensor on a scale with 0.01g precision.
    ],
  ) <ExperimentalSetup>],
)

#pagebreak()
= Results

Data was fit to a computational model starting at the inflection point where the slope of the cooling graph began to decline. Parameters $k_c$ and $epsilon$ were manually adjusted using an interactive fitter (see #ref(<interactiveFitter>)) to reduce $chi^2$ score (see #ref(<chi2>)) between experimental data and model while keeping a good fit.

The constants used are shown in #ref(<constants>), and the final parameters and fit data is shown in #ref(<parameterData>).

Uncertainties in $k_c$ and $epsilon$ were calculated using gaussian error:
$
  delta k_c = (k_(c)"max" - k_(c)"min")/ 4 \
  delta epsilon = (epsilon"max" - epsilon"min")/ 4
$

Final convection coefficient and emissivity came out to $k_c = #round(0.3693528693528694, 3) plus.minus #round(0.011191181424687495, 2) $W/$m^2$/K and $epsilon = #round(0.22536737248466868, 5) plus.minus #round(0.002473898371967511, 2)$ by averaging the best $k_c$'s and propagating the uncertainties.

$
  k_c = (k_(c 1) + k_(c 2) + k_(c 3))/3 wide epsilon = (epsilon_1 + epsilon_2 + epsilon_3)/3 \
  delta(k_c) = ( 1 / 3 ) sqrt((delta k_(c 1))^2 + (delta k_(c 2))^2 + (delta k_(c 3))^2) wide
  delta(epsilon) = ( 1 / 3 ) sqrt((delta epsilon_1)^2 + (delta epsilon_2)^2 + (delta epsilon_3)^2) \
$


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
            (d T)/(d t) & = ( 1 / C_p) (d Q_"total") /(d t) \
  therefore (d T)/(d t) & = ( 1 / C_p) ((d Q_c) / (d t) + (d Q_r) / (d t) ) \
$

For Euler-based modeling in python, this looks like:
```python
dHc = kc * A * (Tn-Tamb) * dt
dHr = eps * sig * A * (Tn**4 - Tamb**4) * dt
Tn = Tn - (dHc + dHr)/heatcap
```

This model assumes that there was no conductive heat loss, heat capacity of the system stays constant, no hot air left the container, and ambient temperature is static.

#pagebreak()
== Parameters and Fit Data

#let data = json("fitParameters.json");
#let sig_figs = 3;

#let s(x) = {
  round(x, 2)
}

#figure(
  table(
    columns: 7,
    [*Trial Number*],
    [*Estimated $k_c$ \ W/$m^2$/K*],
    [*Relative Uncertainty in $k_c$ \ W/$m^2$/K*],
    [*Estimated $epsilon$*],
    [*Relative Uncertainty in $epsilon$*],
    [*$chi^2$*],
    [*$Delta T$ across wall of can K*],

    [1],
    [$#round(data.at("1k_c"), 3) plus.minus #s(data.at("1del_k_c"))$],
    [#s(data.at("1k_c_ru"))],
    [$#round(data.at("1eps"), 4) plus.minus #s(data.at("1del_eps"))$],
    [#s(data.at("1eps_ru"))],
    [#s(data.at("1chi2"))],
    [#s(0.01070273861760804)],

    [3],
    [$#round(data.at("3k_c"), 4) plus.minus #s(data.at("3del_k_c"))$],
    [#s(data.at("3k_c_ru"))],
    [$#round(data.at("3eps"), 4) plus.minus #s(data.at("3del_eps"))$],
    [#s(data.at("3eps_ru"))],
    [#s(data.at("3chi2"))],
    [#s(0.006306556209366091)],

    [4],
    [$#round(data.at("4k_c"), 3) plus.minus #s(data.at("4del_k_c"))$],
    [#s(data.at("4k_c_ru"))],
    [$#round(data.at("4eps"), 4) plus.minus #s(data.at("4del_eps"))$],
    [#s(data.at("4eps_ru"))],
    [#s(data.at("4chi2"))],
    [#s(0.012812335379065525)],
  ),
  caption: [
    The trial number, estimated $k_c$ and $epsilon$ and their relative uncertainties, $chi^2$ of fit, and temperature difference across wall of can.
  ],
) <parameterData>


== Constants used in code:
#figure(
  table(
    columns: 4,
    [*Name*], [*Value*], [*Uncertainty*], [*Link*],
    [$pi$], [3.141592653589793], [], [],
    [Radius of Can], [0.0331 m], [$plus.minus 1.00 times 10^(-3)$], [],
    [Height of Can], [0.112 m], [$plus.minus 3.25 times 10^(-3)$], [],
    [Volume of Can], [$0.000355 "m"^(-3)$], [], [Determined from the ml rating on the can.],
    [rhoair],
    [1.225 $"kg" "m"^(-3)$ ],
    [],
    [#link("https://www.engineeringtoolbox.com/standard-atmosphere-d_604.html")[link]],

    [rhoAl], [2712 $"kg" "m"^3$], [], [#link("https://kg-m3.com/material/aluminum")[link]],
    [mAl], [0.01246 kg], [$plus.minus 2.887 times 10^(-6) "kg"$], [],
    [thickness of Al], [0.095 m], [], [],
    [conductivity of Al],
    [237 W/m K],
    [],
    [#link("https://www.engineeringtoolbox.com/thermal-conductivity-metals-d_858.html")[link]],

    [Heat capacity of air], [1005 J/kg/K], [], [#link("https://www.engineeringtoolbox.com/specific-heat-capacity-d_391.html")[link]],
    [Heat capacity of aluminum], [897 J/kg/K], [], [#link("https://www.engineeringtoolbox.com/specific-heat-capacity-d_391.html")[link]],
    [0 degrees Celsius in Kelvin], [273.15 K], [], [],
    [ Stefan-Boltzmann Constant], [ 5.67e-8 W/m^2/K^4], [], [],
  ),
  caption: [
    The constants used in the code.
  ],
) <constants>

// #todo("Expand the names of the constants")

#pagebreak()

== Graphs
#figure(
  image("figures/EulerFit3.svg"),
  caption: [
    Graph of the internal temperature of the can over time for Trial 3.
  ],
) <trial3>

#figure(
  image("figures/EulerFit4.svg"),
  caption: [
    Graph of the internal temperature of the can over time for Trial 4.
  ],
) <trial3>

#figure(
  image("figures/EulerFit1.svg"),
  caption: [
    Graph of the internal temperature of the can over time for Trial 1.
  ],
) <trial3>


#pagebreak()

= Discussion

Our graphs show the internal temperature of the can over time plotted against an Euler model to predict the temperature of the can given its temperature at one point.

Our expanded differential equation is:
$
  (d T)/(d t) & = ( 1 / C_p) ( -k_c A (T - T_("amb"))
                  + (-A epsilon sigma (T^4 - T_("amb")^4) )) \
  (d T)/(d t) & = ( 1 / C_p) ( -k_c A T + k_c A T_("amb") - A epsilon sigma T^4 + A epsilon sigma T_("amb")^4 ) \
$

Therefore if $T > T_"amb"$, $(d T)/(d t) < 0$ and so the temperature decays over time till $T = T_"amb"$, $(d T)/(d t) = 0$ and temperature has equalized. This is exactly what we see in our numerical approximation.

The $epsilon$ does not agree well across the trials, but the $k_c$ agrees well, this is evident by their t-prime scores being greater than $1$ about $1$ respectively in #ref(<tprimes>).

#let sig(x) = {
  round(x, 4)
}

#figure(
  table(
    columns: 3,
    [*Trial Pair*], [*t-prime Score of their $k_c$*], [*t-prime Score of their $epsilon$*],
    [3 and 1], [#sig(json("t_primes.json").k_c_3_1)], [#sig(json("t_primes.json").eps_3_1)],
    [3 and 4], [#sig(json("t_primes.json").k_c_3_4)], [#sig(json("t_primes.json").eps_3_4)],
    [1 and 4], [#sig(json("t_primes.json").k_c_4_1)], [#sig(json("t_primes.json").eps_4_1)],
  ),
  caption: [
    The calculated t-prime scores for the best estimated $k_c$ and $epsilon$ of each pair of trials.
  ],
) <tprimes>


Based on the #link("https://www.engineeringtoolbox.com/emissivity-coefficients-d_447.html", [here]), and that my can was painted, my emissivity is reasonable. Aluminum Heavily Oxidized was listed with $epsilon = 0.2 - 0.31$ and mine was $epsilon = #round(0.22536737248466868, 4) plus.minus #round(0.002473898371967511, 2)$. 

Relative to #link("https://www.researchgate.net/publication/232877343_Experimental_Investigation_on_Pressure_Drop_and_Heat_Transfer_Characteristics_of_Copper_Metal_Foam_Heat_Sink", [here]) showing $k_c$ of aluminum $ = 6.87$ W/$m^2$/K, my convection coefficient of $k_c = #round(0.3693528693528694, 3) plus.minus #round(0.011191181424687495, 2) $W/$m^2$/K is is unreasonable (off by a factor of 614).


We graph the change temperature across the wall of our can over time:

#figure(
  image("figures/EulerFitDelts.svg"),
  caption: [
    A graph of the simulated change in temperature across the wall over time.
  ],
) <delt>

#ref(<delt>) shows aluminum is a good conductor, as heat flows out of the can readily until it equalizes with ambient temperature, then heat stops flowing.

This is also a result of the second law of thermodynamics, more specifically that if no work is done heat flows across a temperature gradient.


#pagebreak()


#show: appendix

= Interactive Fitter <interactiveFitter>
Note: I included this appendix just for fun because I found it interesting. You do not have to read it for marking purposes.

I wrote some custom code to do interactive fitting, you can find it here: \
#link("https://github.com/blucardin/SCIE001Physics/blob/assignment_2/interactive_fitter.ipynb")

#figure(
  image("images/Screenshot 2025-11-21 at 3.20.40 AM.png"),
  caption: [
    An image of the interactive fitting application.
  ],
)

= Calculating $chi^2$ <chi2>
For the fitter to work, I needed to calculate $chi^2$, but since the datapoints were not aligned in time I couldn't compute the metric normally.

So I wrote some code that did some interpolation between the points, you can find it below.

```python
def chiSquared(x1s, y1s, x2s, y2s):
    # since they are not aligned on the time axis, we have to do some interpolation.
    # (the time axis for the experimental temperatures varies, so even if we matched them, they wouldn't fit)

    sum = 0
    for x1, y1 in zip(x1s, y1s):
        observed_value = y1

        point_after_index = np.searchsorted(x2s, x1)
        point_before_index = point_after_index - 1


        if point_after_index >= len(y2s):
            # we are at the end of the list, so just use the last interpolation
            point_after_index -= 1
            point_before_index -= 1

        m = (y2s[point_after_index] - y2s[point_before_index])/ (x2s[point_after_index] - x2s[point_before_index])

        interpolated_value = (m * (x1 - x2s[point_before_index])) + y2s[point_before_index]

        sum += ((observed_value - interpolated_value)**2)/ (interpolated_value)

    return sum
```

