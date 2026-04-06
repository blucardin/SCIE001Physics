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

#outline(target: heading.where(supplement: [Regular]))

#outline(target: heading.where(supplement: [Appendix]), title: [Appendix])

#let nonumber(body) = {
  set heading(numbering: none)
  body
}

#let eps = $epsilon$;

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

  Resistance over a 9 volt battery was varied from 1 Ohm to 2 M Ohms by combining various small resistors on a breadboard. Voltage across the resistance was then measured with a digital multimeter (DMM). To gain further accuracy and account for the resistance of the breadboard, resistances were also measured with a DMM.

  Uncertainties were propagated from the uncertainty reported in the DMM's manual.

  #todo[Include a reference from the manual]

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

      voltmeter("i1", (0, height * 2), (width, height * 2), label: (content: $V_"obs"$, anchor: "south", distance: 4pt))
    }),
    caption: [
      A circuit diagram of the setup. #todo["Define the variables here"]

      #todo[subtract these words from the count]
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

  Words: #(total.words - 2)
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
      An image of the tissue box that was dropped onto the sensor
    ],
  ) <ExperimentalSetup>],
)
#todo[Fix captions]


== I-V Curve
#p[Include a figure that shows the I-V curve for a resistance of varying value connected to a 9V battery. Fit the curve and give the internal resistance of the battery in the caption. You can include fit parameters in the plot or in the caption.]

#figure(
  image("figures/current_to_voltage.svg"),
  caption: [Current to voltage of #todo[Finish this]

    Internal Resistance = 8.6773 ± 0.1686
  ],
)

#figure(
  image("figures/current_to_voltage_cut.svg"),
  caption: [Current to voltage of #todo[Finish this]
    Internal Resistance = 8.0690 ± 0.1369

  ],
)

== Internal Resistance of Voltmeter
#p[[100 words max] Briefly comment on any marked deviation from the expected linear fit and if the obtained value of the internal resistance is reasonable.]
#word-count(total => [

  The data was fit using Orthogonal distance regression using the scipy.odr library as it accounted for errors in both the dependant in independent variable.

  There was a marked deviation when using a resistance over the battery was greater than 150.8 Ohms. At this point, current seemed to level out instead of following the linear trend.

  This is demonstrated by cutting the data before this point, reducing the chi-squared from 3170457191.1117 to 1.2024.

  The obtained value of internal resistance is reasonable, as is in the range of other batteries (0.006 - 35 Ohms). However, compared to the listed value for zinc carbon (which the battery is), it is out of range.

  https://www.learningaboutelectronics.com/Articles/Battery-internal-resistance#google_vignette

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

= Voltmeter internal resistance
== Methodology
#p[[100 words max] Briefly explain your methodology (e.g. why you picked the capacitor you picked, how you recorded the time-dependent data, how you determined your uncertainties)]

#word-count(total => [

  As shown in @circuit-diagram-capacitor, an arduino was used with a voltage divider to sample the voltage roughly every 10 milliseconds. $1 "uF"$ was chosen as it provided a long enough decay when measuring the DMM to gather enough data, while ensuring runs did not produce too much data.


  Uncertainty was propagated from the listed values for the Analogue to Digital Converter of the Arduino's ATmega328P (±2 LSB absolute accuracy) #footnote[https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf]. Voltage measurements were calibrated from 3.3V board reference.

  Words: #(total.words - 2)
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

    vsource("b1", (0, height * 4), (width, height * 4), label: $eps$)

    switch("s1", (0, height * 3), (0, height * 4))

    wire((0, 0), (0, height * 3))

    resistor("r3", (0, height), (width / 2, height), label: $1 "M"Omega$)

    resistor("r4", (width / 2, height), (width, height), label: $1 "M"Omega$)

    voltmeter("b2", (0, 0), (width / 2, 0), label: [Arduino])

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

    capacitor("i1", (0, height * 3), (width, height * 3), label: (content: $C$, anchor: "south", distance: 4pt))

    earth("s5", (0, 0), variant: "ieee")
  }),
  caption: [
    A circuit diagram of the setup. \ The resistance $R_r$ was varied during calibration to obtain a more precise value for the capacitance $C$, then swapped with the DMM to determine its internal resistance.

    #todo["Define the variables here"]
    #todo[subtract these words from the count]
  ],
) <circuit-diagram-capacitor>

== Discharge Voltage vs Time Curve
#p[Include a figure that shows the discharge voltage vs time of a capacitor connected to your voltmeter. Fit the curve and give the time constant and value of the internal resistance of your voltmeter in the caption. You can include fit parameters in the plot or in the caption.]

== Voltmeter Internal Resistance
#p[[100 words max] Briefly comment on if the obtained value of the internal resistance is reasonable and on the implication of your results when making measurements with your voltmeter.]

#word-count(total => [
  The obtained value of the internal resistance of the voltmeter is resonable

  Words: #(total.words - 2)
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

= Interactive Fitter <interactiveFitter>
Note: I included this app
#todo[Remove this]


