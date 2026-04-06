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

#figure(
  image("figures/EulerFitAll.svg", width: 70%),
  caption: [
    Graph of the internal temperature over time for Trial 4.
  ],
) <All>

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
    ],
  ) <ExperimentalSetup>],

  [#figure(
    box(
      image("images/IMG_3997.jpeg", width: 100%),
      clip: true,
      inset: (bottom: -0.15in, right: -0.4in, top: -0.5in, left: -0.25in),
    ),
    caption: [
      An image of the tissue box that was dropped onto the sensor
    ],
  ) <ExperimentalSetup>],
)

// = *Assignment Description* <nonumber>


= Battery internal resistance
== Methodology
#p[[100 words max] Briefly explain your methodology (e.g. how you chose to vary the resistance: potentiometer? resistors?, over what resistance range? how did you measure the resistance value?, how did you determine your uncertainties?)]

#word-count(total => [

  Resistance over a 9 volt battery was varied by combining various small resistors on a breadboard. Voltage across the resistance was then measured with a digital multimeter (DMM). To gain further accuracy and account for the resistance of the breadboard, resistances were also measured with a DMM. 

  Uncertainties were propagated from the uncertainty reported in the DMM's manual. 

  #todo[Include a reference from the manual]

  $
    V = I R \ 
    I = V / R \ 
    u[I] = sqrt((u[V] (partial / (partial V) V / R) ) ^ 2 + (u[R] (partial / (partial R) V / R ) ) ^ 2 ) \ 

    u[I] = sqrt( (u[V] / R) ^ 2 + (u[R] (-V) / R^2 )  ^ 2 )
  $

  #figure(
    zap.circuit({
    import zap: *

    // remember you can use global styling
    set-style(variant: "ieee")
    
    let width = 6; 
    let height = 3; 

    rheostat("r2", (0, height), (width, height), label: $R_r$)

    wire((0, 0), (0, height * 2 ))

    vsource("b2", (0, 0), (width/2, 0), label: $eps$)

    resistor("r1", "b2.out", (width, 0), label: $R_b$)
    // resistor("r1", (width/2, 0), (width, 0), variant: "ieee")

    wire((width, 0), (width, height * 2))

    let thick = 1.2; 
    draw.rect((0.7, -thick + 0.2), (width - 0.5, thick), stroke: (dash: "dashed", thickness: .8pt, paint: blue), name: "rect")

    draw.content("rect.north", text(fill: blue)[9V battery], anchor: "south")

    voltmeter("i1", (0, height * 2), (width, height * 2), label: (content: $V_"obs"$, anchor: "south", distance: 4pt))

  }), 
  caption: [
    A circuit diagram of the setup. #todo["Define the variables here"] 

    #todo[subtract these words from the count]
  ]
  )

  From this: 
  $
     V = I R\ 
  $
  $
    &eps = I(R_r + R_b) wide &V_"obs" = I R_r  \ 
    &eps - I R_r = I R_b  wide &I = V_"obs" / R_r \ 
  $
  $
    eps - V_"obs" = I R_b \  \
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


== I-V Curve
#p[Include a figure that shows the I-V curve for a resistance of varying value connected to a 9V battery. Fit the curve and give the internal resistance of the battery in the caption. You can include fit parameters in the plot or in the caption.]

== Internal Resistance of Voltmeter
#p[[100 words max] Briefly comment on any marked deviation from the expected linear fit and if the obtained value of the internal resistance is reasonable.]

#word-count(total => [


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

= Voltmeter internal resistance
== Methodology
#p[[100 words max] Briefly explain your methodology (e.g. why you picked the capacitor you picked, how you recorded the time-dependent data, how you determined your uncertainties)]

== Discharge Voltage vs Time Curve
#p[Include a figure that shows the discharge voltage vs time of a capacitor connected to your voltmeter. Fit the curve and give the time constant and value of the internal resistance of your voltmeter in the caption. You can include fit parameters in the plot or in the caption.]

== Voltmeter Internal Resistance
#p[[100 words max] Briefly comment on if the obtained value of the internal resistance is reasonable and on the implication of your results when making measurements with your voltmeter.]

#word-count(total => [


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



