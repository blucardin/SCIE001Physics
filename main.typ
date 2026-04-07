// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/sigfig:0.1.0": round, urounds
#import "@preview/unify:0.5.0": num
#import "@preview/frame-it:1.2.0": *

#import "@preview/wordometer:0.1.5": total-words, word-count

#import "@preview/zap:0.5.0"

#show: word-count


#let (p, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  p: ("Problem", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.thmbox)

#show link: underline
#show ref: underline


#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}
#let regular(body) = {
  set heading(supplement: [Regular])
  body
}
#show: regular

#set heading(numbering: "1.")

#let lim = math.limits(math.lim)

#align(center)[

  _#text(30pt)[
    *#titlecase("Real batteries and voltmeters ")*
  ] \ \
  *Assignment 4*
  _

  SCIE 001 Physics

  Noah Virjee \
  45515863

  #let today = datetime.today()
  #today.display("[month repr:long]")
  #today.day(), #today.year()// or another custom format
]

// #figure(
//   image("figures/EulerFitAll.svg", width: 70%),
//   caption: [
//     Graph of the internal temperature over time for Trial 4.
//   ],
// ) <All>
// \
\
\
#figure(
image("/figures/log_voltage_decay.svg", width: 90%),
caption:[
  See @log-voltage-decay
]
)
// #align(center)[
// #box(
      // #image("/figures/log_voltage_decay.svg", width: 70%),
    //   clip: true,
    //   inset: (bottom: -0in, right: -40%, top: -0.0in, left: 0in),
    // ),
// ]

#outline(target: heading.where(supplement: [Regular]))

#outline(target: heading.where(supplement: [Appendix]), title: [Appendix])

#let nonumber(body) = {
  set heading(numbering: none)
  body
}

#let eps = $epsilon$;
#let mo = $"M"Omega$;

// #set math.equation(numbering: "1.")

#pagebreak()

// // uncomment this for infinite page height except the first page.
// #set page(height: auto)
//

#nonumber[= Introduction and Description]
#p[For this assignment, you essentially only need to finish what you started in tutorial, where you investigated the internal resistance of a battery and of your voltmeter. Your submission should include two figures along with a brief description of your method and discussion of your results.]

= Battery internal resistance
== Methodology
#p[[100 words max] Briefly explain your methodology (e.g. how you chose to vary the resistance: potentiometer? resistors?, over what resistance range? how did you measure the resistance value?, how did you determine your uncertainties?)]

#word-count(total => [

  Resistance over a 9 volt battery was varied from 1 Ohm to 2 M Ohms by combining various small resistors on a breadboard to determine the internal resistance of the battery. Voltage across the resistance was then measured with a digital multimeter (DMM). To gain further accuracy and account for the resistance of the breadboard, resistances were also measured with the DMM.

  Uncertainties were propagated from the voltage and resistance uncertainties reported in the DMM's manual @voltage-resistance-unceranties.



  #figure(
    grid(
      columns: 2,
      gutter: 20pt,

      box(
        image("images/DMM uncertanties.jpeg", width: 100%),
        clip: true,
        inset: (bottom: -2.75in, right: -0.2in, top: -0.3in, left: -0.1in),
      ),

      box(
        image("images/DMM uncertanties.jpeg", width: 100%),
        clip: true,
        inset: (bottom: -0.15in, right: -0.0in, top: -2.5in, left: -0.0in),
      ),
    ),
    caption: [
      Voltage and Resistance uncertainties used.
    ],
  ) <voltage-resistance-unceranties>


  #figure(
    zap.circuit({
      import zap: *

      // remember you can use global styling
      set-style(variant: "ieee")

      let width = 6
      let height = 3

      rheostat("r2", (0, height), (width, height), label: $R_r$)

      wire((0, 0), (0, height * 2))

      vsource("b2", (0, 0), (width / 2, 0), label: $eps$)

      resistor("r1", "b2.out", (width, 0), label: $R_b$)
      // resistor("r1", (width/2, 0), (width, 0), variant: "ieee")

      wire((width, 0), (width, height * 2))

      let thick = 1.2
      draw.rect(
        (0.7, -thick + 0.2),
        (width - 0.5, thick),
        stroke: (dash: "dashed", thickness: .8pt, paint: blue),
        name: "rect",
      )

      draw.content("rect.north", text(fill: blue)[9V battery], anchor: "south")

      voltmeter("i1", (0, height * 2), (width, height * 2), u : (content: $V_"obs"$, anchor: "south-west", label-distance: -10pt, distance: 0pt)) // label: (content: $V_"obs"$, anchor: "south", distance: 4pt))
    }),
    caption: [
      A circuit diagram of the setup. $eps$ and $R_b$ is the battery voltage and internal resistance. $R_r$ is the varying resistance. And $V_"obs"$ is the voltage observed by the meter. 
      
      // #todo["Define the variables here"]
      // #todo[subtract these words from the count]
    ],
  )

  $
    V = I R \
    I = V_"obs" / R_r \
    u[I] = sqrt((u[V_"obs"] (partial / (partial V_"obs") V_"obs" / R_r) )^2 + (u[R_r] (partial / (partial R_r) V_"obs" / R_r ) )^2) \
    u[I] = sqrt((u[V_"obs"] / R_r)^2 + (u[R_r] (-V_"obs") / R_r^2 )^2)
  $

  From this:
  $
    V = I R\
  $
  $
    eps = I(R_r + R_b) wide V_"obs" = I R_r \
    eps - I R_r = I R_b \
  $
  $
    eps - V_"obs" = I R_b \ \
    // $
    // $
    therefore I = - (1/ R_b) V_"obs" + eps / R_b
  $

  Or in other words, in the linear relationship between $I$ and $V$:
  $
    "Slope" = m = -1/R_b \
    therefore R_b = -1/m \
    u[R_b] = sqrt((u[m](partial / (partial m) (-1/m) ))^2) \
    therefore u[R_b] = u[m] (1/(m^2) )
  $

  // Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#grid(
  columns: 2,
  gutter: 20pt,

  [#figure(
    box(
      image("images/IMG_4982.jpeg", width: 100%),
      clip: true,
      inset: (bottom: -0.2in, right: -0.0in, top: -0.65in, left: -0.8in),
    ),
    caption: [
      Image of the experimental setup.
    ],
  ) <ExperimentalSetup>],

  [#figure(
    box(
      image("images/IMG_4983.jpeg", width: 100%),
      clip: true,
      inset: (bottom: -0.15in, right: -0.4in, top: -0.5in, left: -0.25in),
    ),
    caption: [
      Image of the breadboard with 4, 10 Ohm resistors connected in series. White and black are power and ground. Blue and yellow are the DMM connections. A button was used to toggle power to the circuit. 
    ],
  ) <ExperimentalSetup>],
)
// #todo[Fix captions]


== I-V Curve
#p[Include a figure that shows the I-V curve for a resistance of varying value connected to a 9V battery. Fit the curve and give the internal resistance of the battery in the caption. You can include fit parameters in the plot or in the caption.]

#figure(
  image("figures/current_to_voltage.svg"),
  caption: [Current to voltage detected by DMM with varying $R_r$. 

    Model is $I(V) = m V + b$ where $m = - (1/ R_b), b = eps / R_b$.

    From this data, Battery Internal Resistance $R_b = -1/m = 8.6773 ± 0.1686$ Ohms. 
  ],
)

#figure(
  image("figures/current_to_voltage_cut.svg"),
  caption: [Current to voltage detected by DMM with varying $R_r$ with data cut before the 150.8 Ohm (8.78 V) datapoint to demonstrate decline in Chi-squared. 

    Model is $I(V) = m V + b$ where $m = - (1/ R_b), b = eps / R_b$.


  From this data, Battery Internal Resistance $R_b = -1/m = 8.0690 ± 0.1369$ Ohms

  ],
)

== Internal Resistance of Voltmeter
#p[[100 words max] Briefly comment on any marked deviation from the expected linear fit and if the obtained value of the internal resistance is reasonable.]
#word-count(total => [

  The data was fit using Orthogonal distance regression using the scipy.odr library as it accounted for errors in both the dependant and independent variable.

  There was a marked deviation when using a resistance over the battery was greater than 150.8 Ohms. At this point, current seemed to level out instead of following the linear trend. This is demonstrated by cutting the data before this point, reducing the chi-squared from 3170457191.1117 to 1.2024. Our model does not fit the data over 150.8 Ohms. 

  This could be due to DMM loading effects, where, as the resistance of the resistor approaches the internal resistance of the multimeter, they form a parallel resistor circuit. This would form a voltage division circuit with the internal resistance of the battery, distorting the measured voltage and current values. 

  The obtained value of internal resistance of the battery is reasonable, as is in the range of reported values (0.006 - 35 Ohms)#footnote[https://www.learningaboutelectronics.com/Articles/Battery-internal-resistance#google_vignette]. However, compared to the value for its type (zinc carbon) (35 Ohms), it is out of range.

  // #todo[this could be because]

  // Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#pagebreak()

= Voltmeter internal resistance
== Methodology
#p[[100 words max] Briefly explain your methodology (e.g. why you picked the capacitor you picked, how you recorded the time-dependent data, how you determined your uncertainties)]

#word-count(total => [

  As shown in @circuit-diagram-capacitor, an arduino was used to sample the voltage in an RC circuit roughly every 10 milliseconds to determine the internal resistance of a voltmeter. $1 "uF"$ was chosen as it provided a long enough decay when measuring the DMM to gather enough data for small resistances, while ensuring large resistance runs did not produce too much data. A voltage divider was used to step down the voltage from 0-9.48V to 4.74V to not overvolt the arduino's pins.


  Uncertainty was propagated from the listed values for the Analogue to Digital Converter of the Arduino's ATmega328P chip (±2 LSB absolute accuracy) #footnote[https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf]. Voltage measurements were calibrated from the arduino's 3.3V reference pin.

  // Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#figure(
  zap.circuit({
    import zap: *
    // remember you can use global styling
    set-style(variant: "ieee")

    let width = 6
    let height = 2.1

    rheostat("r2", (0, height * 2), (width, height * 2), label: $R_r$)

    vsource("b1", (0, height * 4), (width, height * 4), label: $eps = V_0$)

    switch("s1", (0, height * 3), (0, height * 4))

    wire((0, 0), (0, height * 3))

    resistor("r3", (0, height), (width / 2, height), label: $1 "M"Omega$)

    resistor("r4", (width / 2, height), (width, height), label: $1 "M"Omega$)

    voltmeter("b2", (0, 0), (width / 2, 0), label: [Arduino], u : (content: $V_"ard"$, anchor: "south-west", label-distance: -10pt, distance: 0pt))

    // resistor("r1", "b2.out", (width, 0), label: $R_b$)
    // resistor("r1", (width/2, 0), (width, 0), variant: "ieee")

    wire((width, height), (width, height * 4))

    wire((width / 2, 0), (width / 2, height))

    let thick = 0.8
    draw.rect(
      (0.5, -thick + height + 0.4),
      (width - 0.5, thick + height + 0.1),
      stroke: (dash: "dashed", thickness: .8pt, paint: blue),
      name: "rect",
    )

    draw.content("rect.north", text(fill: blue)[Voltage Divider], anchor: "south", padding: 0.2)

    capacitor(
      "i1",
      (0, height * 3),
      (width, height * 3),
      label: (content: $C$, anchor: "south", distance: 4pt),
      u: $V(t)$,
    )

    earth("s5", (0, 0), variant: "ieee")
  }),
  caption: [
    A circuit diagram of the setup. \ 

    The capacitor was charged with the switch engaged, then when released, the decay trace recorded. The resistance $R_r$ was varied to obtain a more precise value for the capacitance $C$, then swapped with the DMM to determine its internal resistance. 
    
    // $1 mo $ resistors were used for the divider to extend decay time (compared to the standard 10 k$Omega$)

    // #todo["Define the variables here"]
  ],
) <circuit-diagram-capacitor>

We need to also account for the resistance caused by the voltage divider.

Let $R_T$ represent the total resistance over the capacitor.
From the circuit diagram, we can see:

$
  R_T = 1 / ((1/R_r) + (1/ (1 mo + 1 mo)))\
  therefore R_r = 1 / ((1/R_T) - (1/ (1 mo + 1 mo)))\
$ <Rr-from-RT>

The time decay curve of voltage in an RC circuit is:

$
  V(t) = V_0 e^(-t/(R C)) \
  log(V(t)) = log(V_0) + (-1/(R C)) t
$

Where $V(t)$ is the voltage over the capacitor at time $t$. 

Let $V_"ard"$ equal the voltage detected by the arduino.\
Let $I$ represent the current flowing through the divider. 

For the voltage divider circuit:
$
  V = I R \
  V(t) = I(1mo + 1mo) \
  V_"ard" = I(1mo)\
  V_"ard" = V(t) / (1mo + 1mo) (1mo) = (1/2) V(t)
$
This ratio is implicitly present in the 3.3V calibration. 

#figure(
  box(
    image("images/arduino_capacitance.jpeg", width: 100%),
    clip: true,
    inset: (bottom: -0.3in, right: -0.0in, top: -0.7in, left: -0.2in),
  ),
  caption: [
    The experimental setup.
  ],
)

== Discharge Voltage vs Time Curve
#p[Include a figure that shows the discharge voltage vs time of a capacitor connected to your voltmeter. Fit the curve and give the time constant and value of the internal resistance of your voltmeter in the caption. You can include fit parameters in the plot or in the caption.]

#let pm = $plus.minus$;


#figure(
  image("/figures/log_voltage_decay.svg"),
  caption: [
  Logarithm of scaled voltage decay trace obtained from the arduino. Data was fit in log space for ease of programming. Model is $log(V(t)) = b + m t$, where $b = log(V_0), m = -1/(R C)$. Parameters can be found in @fit-parameters. 
  
  Uncertainties were calculated using $u[ln(V(t))] = u[V(t)]/V(t)$ and are shown as ribbons. 
  ],
) <log-voltage-decay>

#figure(
  image("/figures/voltage_decay.svg"),
  caption: [
  Scaled voltage decay trace obtained from the arduino with model. 
  
  Model is $V(t) = e^(b)e^(m t)$, where $e^(b) = V_0$ and $m = -1/(R C)$

  Parameters can be found in @fit-parameters. Uncertainties are shown as ribbons, however they are too small to be seen in this plot. See @log-voltage-decay for more visible uncertainties. 
  ],
)

#figure(
  image("/figures/RC_to_R.svg"),
  caption: [
  A plot of the obtained RC value to the actual resistance over the capacitor $R_T$. Uncertainties are shown as error bars however they are too small to be seen in this plot.

  Model is: $R C = m R + b$ where $m = C$. The $b$ parameter is not necessary, since there is no intercept, however I wanted to confirm $b approx 0$. 

  $m = C = 0.8784 pm 0.0020 mu"f"$
  ],
) <RC-to-C>

== Voltmeter Internal Resistance
#p[[100 words max] Briefly comment on if the obtained value of the internal resistance is reasonable and on the implication of your results when making measurements with your voltmeter.]

#word-count(total => [

  As shown in @RC-to-C, by plotting the measured RC value to the expected resistance of the circuit and fitting a linear curve, $C$ can be determined with greater precision. I found $C = 0.8784 "uf" plus.minus 0.0020 "uf"$ a difference of $0.1216 mu"f"$ from the marked value.

  We can divide the voltmeter's $R C$ with $C$ to determine $R_T$, then use the parallel resistance equation with uncertainty propagation, to get a voltmeter resistance of $11.264160 mo plus.minus 0.001996 mo$. (Without calibrating for the capacitance [using C = 1 $mu$ f], this value would have been $5.8677 mo pm 0.001753mo$). The equation and propagation is shown below: 

  $
    R_T = (R C) /C \ 
    R_r = 1 / ((1/R_T) - (1/ (1 mo + 1 mo)))\

    R_r = 1 / ((C / (R C)) - (1/ (2 mo)))\

  $
  Since I treat $1/ (2 mo)$ as having infinite precision, and subtraction does not affect uncertainty. We can approximate the uncertainty as: 
  $
    u[R_r] = u[1 / ((C / (R C)))] = u[(R C) / C] \ 

    u[R_r] = sqrt((u[(R C)] (partial / (partial (R C)) (R C) / C) )^2 + (u[C] (partial / (partial C) (R C) / C ) )^2) \

    u[R_r] = sqrt((u[(R C)] / C)^2 + (u[C] (-(R C)) / C^2 )^2)

  $


  The obtained value of the internal resistance of the voltmeter is reasonable, as it matches the measurement made by another multimeter $11.10 mo plus.minus #(11.10 * 0.01 + 0.02) mo$. It also makes sense for the internal resistance to be so high, so as to prevent loading effects when measuring the voltage over small resistors. 


  This implies that whenever you make a measurement with the voltmeter, you are really measuring a system in parallel with an $11 mo$ resistor. For resistors under constant voltage, this is fine, as the power supply will increase the current so that the measurement would be the same if using an ideal voltmeter. However, if the circuit is non-voltage controlled (like the voltage divider-type circuit in part 1), when measuring voltage over large resistances, the voltmeter would significantly lower the resistance in the circuit, causing voltage measurements to be lower than with an ideal meter. 


  // Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

// #pagebreak()
// == Parameters and Fit Data

// #let data = json("fitParameters.json");
// #let sig_figs = 3;

// #let s(x) = {
//   round(x, 2)
// }

// #figure(
//   table(
//     columns: 2,
//     [*Trial Number*], [*Estimated $k_c$ \ W/$m^2$/K*],
//     [*Relative Uncertainty in $k_c$ \ W/$m^2$/K*],
//   ),
//   caption: [
//     The trial number, estimated $k_c$ and $epsilon$ and their relative uncertainties, $chi^2$ of fit, and temperature difference across wall of can.
//   ],
// ) <parameterData>


// #pagebreak()

// == Graphs

// #figure(
//   image("figures/EulerFit1.svg"),
//   caption: [
//     Graph of the internal temperature of the can over time for Trial 1.
//   ],
// ) <trial3>



#pagebreak()


#show: appendix

= Fit Parameters for Part 2 <fit-parameters>
I found that all the fit parameters really cluttered up the graphs, so I have included them in a table here.

Chi-squared were quite bad across the board. This implies that either the uncertainties were underestimated, or that the model did not reflect the actual discharge characteristics. I believe it is the ladder case, as by looking at the residuals, they are clearly patterned. See @fit-residuals.

This could also be due to the integral non-linearly of the arduino's Analogue to Digital Converter which is not taken into account in the uncertainties.

Nevertheless, fit uncertainties were quite low.

To calculate the effective resistance over the capacitor you must consider parallel effects from the voltage divider: 
$
  R_T = 1 / ((1/R_r) + (1/ (1 mo + 1 mo)))\
$

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  stroke: 0.4pt,
[*Trial*],
[*m*],
[*dm*],
[*b*],
[*db*],
[*Chi-Squared*],
[voltmeter],
[-0.6717],
[0.0008],
[2.1834],
[0.0039],
[22.4315],
[100 KΩ],
[-12.0566],
[0.1031],
[2.2636],
[0.0352],
[2.2014],
[200 KΩ],
[-6.2680],
[0.0322],
[2.2486],
[0.0209],
[4.4509],
[1 MΩ],
[-1.7143],
[0.0047],
[2.2155],
[0.0103],
[2.2617],
[2 MΩ],
[-1.1336],
[0.0022],
[2.2079],
[0.0069],
[5.2966],
[5.5 MΩ],
[-0.7753],
[0.0011],
[2.2137],
[0.0048],
[3.9752],
[6.6 MΩ],
[-0.7479],
[0.0010],
[2.2211],
[0.0048],
[3.8836],
[Just divider],
[-0.5693],
[0.0006],
[2.1977],
[0.0036],
[11.0145],
)

#pagebreak()

= Fit Residuals for Part 2 <fit-residuals>

#figure(
image("figures/voltage_residuals.svg"),
caption: [Fit residuals for part 2, clearly patterned. ]
)
